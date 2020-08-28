#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0106/UEL0106_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Light Assault Bot Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local TDFMachineGunWeapon = import('/lua/terranweapons.lua').TDFMachineGunWeapon
local Util = import('/lua/utilities.lua')
   
UEL0106c = Class(TWalkingLandUnit) {
    Weapons = {
        ArmCannonTurret = Class(TDFMachineGunWeapon) {
            DisabledFiringBones = {
                'Torso', 'Head',  'Arm_Right_B01', 'Arm_Right_B02','Arm_Right_Muzzle',
                'Arm_Left_B01', 'Arm_Left_B02','Arm_Left_Muzzle'
            },
        },
    },

    OnCreate = function(self, builder, layer)
        TWalkingLandUnit. OnCreate(self,builder,layer)
        self.MotionStatus = nil
    end,     
        
    OnScriptBitSet = function(self, bit)
        TWalkingLandUnit.OnScriptBitSet(self, bit)
        if bit == 1 then    	    
    	    self:ForkThread(self.SpawnFlyingBot)    	    
    	end
    end,
    
    ReceiveKills = function(self, unitKills)
        if not self:IsDead() then
            self.AddKills(self, unitKills) 
        end   
    end,  
    
    OnMotionHorzEventChange = function(self, new, old) 
        TWalkingLandUnit.OnMotionHorzEventChange(self, new, old)     
        if not self:IsDead() and new != old then
            self.MotionStatus = new
        end                
    end,      
    
    SpawnFlyingBot = function(self)
       if not self:IsDead() then  
                
           ### Disables user control and weapons 
           self:SetUnSelectable(false) 
           self:SetWeaponEnabledByLabel('ArmCannonTurret', false)
           
           ### Removes the toggle after activation 
           self:RemoveToggleCap('RULEUTC_WeaponToggle')                                 
           
           ### Removes all commands
           IssueClearCommands({self}) 
           
           ### Forces the land bot to stop
           IssueStop({self})
           
           ### Waits for the bot to come to a complete stop before transforming
           while not self:IsDead() and self.MotionStatus != 'Stopped' and self.MotionStatus != nil  do          
               WaitSeconds(0.1)
           end                    
                                
           ### Spawns the flying bot                  
           local myOrientation = self:GetOrientation()
           local location = self:GetPosition()
           local health = self:GetHealth()
           local unitKills = self:GetStat('KILLS', 0).Value        
           local flyingBot = CreateUnit('UEL0106d', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air')
           
           ### Update Stats and veterancy
           if unitKills > 0 then
               flyingBot.ReceiveKills(flyingBot, unitKills) 
           end  
           flyingBot:SetHealth(self,health)                
                    
           ### Remove the old unit
           flyingBot = nil
           self:Destroy()
       end
   end,  
}
TypeClass = UEL0106c

