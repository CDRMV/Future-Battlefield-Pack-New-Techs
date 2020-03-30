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
		-- Preload Globals 
		self.Jetpack = nil
		self.AirBotDest = nil                 
    end,
   
	OnStopBeingBuilt = function(self,builder,layer)
		TAirUnit.OnStopBeingBuilt(self,builder,layer) 
		
		-- Enable fuel checking
		--self:ForkThread(self.HeartBeatFuelCheck)
		       
	end,
                                
    OnScriptBitSet = function(self, bit)
        TAirUnit.OnScriptBitSet(self, bit)
        if bit == 1 then
           self:ForkThread(self.SpawnLandBot)
       end
    end,
     
	--domino says the transferre unit function in the spawn bot function transferres kills and vet.. so i dont think this is needed.. 
    ReceiveKills = function(self, unitKills)
        if not self:IsDead() then
            self.AddKills(self, unitKills)
        end   
    end,   
   
    SpawnLandBot = function(self)
       if not self:IsDead() and self.Jetpack == nil then 
           self.Jetpack = true
                
           self:SetUnSelectable(false) 
           self:SetWeaponEnabledByLabel('ArmCannonTurret', false)
           
           self:RemoveToggleCap('RULEUTC_WeaponToggle') 
           
           IssueClearCommands({self}) 
           
           IssueStop({self})               
			
			local position = self:GetPosition()
			self.Station01 = CreateUnitHPR('uel0106c', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
			
			self:Destroy()
			flyingBot = nil
       end
   end,           
}
TypeClass = UEL0106d

