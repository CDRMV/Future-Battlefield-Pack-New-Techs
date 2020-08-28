#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0106/UEL0106_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Light Assault Bot Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon
local Util = import('/lua/utilities.lua')
local EffectTemplate = import('/lua/EffectTemplates.lua')


UEL0106d = Class(TAirUnit) {
    Weapons = {
        ArmCannonTurret = Class(TDFMachineGunWeapon) {
            DisabledFiringBones = {
                'Torso', 'Head',  'Arm_Right_B01', 'Arm_Right_B02','Arm_Right_Muzzle',
                'Arm_Left_B01', 'Arm_Left_B02','Arm_Left_Muzzle'
            },
        },
    },
	
	    BeamExhaustCruise = '/effects/emitters/air_idle_trail_beam_01_emit.bp',
        BeamExhaustIdle = '/effects/emitters/air_idle_trail_beam_01_emit.bp',    

    OnCreate = function(self, builder, layer)
        TAirUnit. OnCreate(self,builder,layer)
        
        ### Create the takeoff special effects
        self.FxGroundEffect = EffectTemplate.CDisruptorGroundEffect       
 	    for k, v in self.FxGroundEffect do
            CreateAttachedEmitter(self, 'UEL0106', self:GetArmy(), v):ScaleEmitter(0.25)
        end             
    end, 
                            
    OnScriptBitSet = function(self, bit)
        TAirUnit.OnScriptBitSet(self, bit)
        if bit == 1 then
    	    self:ForkThread(self.SpawnLandBot)
    	end
    end,
	
	OnDamage = function(self, instigator, amount, vector, damagetype)
        local damageReduction = 8
        amount = math.ceil(amount * damageReduction)
        TAirUnit.OnDamage(self, instigator, amount, vector, damagetype)
    end,
    
    ReceiveKills = function(self, unitKills)
        if not self:IsDead() then
            self.AddKills(self, unitKills) 
        end   
    end,    
    
    SpawnLandBot = function(self)
       if not self:IsDead() then 
          
           ### Disables user control and weapons 
           self:SetUnSelectable(false) 
           
           ### Removes the toggle after activation 
           self:RemoveToggleCap('RULEUTC_WeaponToggle')            
           
           ### Removes all commands
           IssueClearCommands({self}) 
           
           ### Forces the unit to stop and land
           IssueStop({self})
           
           ### Loops till the unit is on the "Land" Layer
           while not self:IsDead() and self:GetCurrentLayer() != 'Land' do
               WaitSeconds(0.1)
           end        
                             
           ### Spawns the land bot 
           if not self:IsDead() then                  
               local myOrientation = self:GetOrientation()
               local location = self:GetPosition()
               local health = self:GetHealth()
               local unitKills = self:GetStat('KILLS', 0).Value               
               local landBot = CreateUnit('UEL0106c', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Land')
               
               ### Update Stats and veterancy
               if unitKills > 0 then                            
                   landBot.ReceiveKills(landBot, unitKills)
               end
               landBot:SetHealth(self,health)                
                              
               ### Remove the old unit               
               landBot = nil
               self:Destroy()
           end
       end
   end,  		
}
TypeClass = UEL0106d

