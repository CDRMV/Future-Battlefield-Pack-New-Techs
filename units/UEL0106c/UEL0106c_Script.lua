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
	--Inspired Code from 4DC's Sera Unit: Kyhku Oss
	--Copyright/Credits goes to the 4DC Team
     OnCreate = function(self, builder, layer)
        TWalkingLandUnit.OnCreate(self,builder,layer)
            
        self.Jetpack = nil
		
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
      
    
    SpawnFlyingBot = function(self)
       if not self:IsDead() and self.Jetpack == nil then 
           self.Jetpack = true
                
           self:SetUnSelectable(false) 
           self:SetWeaponEnabledByLabel('ArmCannonTurret', false)
           
           self:RemoveToggleCap('RULEUTC_WeaponToggle') 
           
           IssueClearCommands({self}) 
           
           IssueStop({self})               
			
			local position = self:GetPosition()
			self.Station01 = CreateUnitHPR('uel0106d', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)

			
			self:Destroy()
			flyingBot = nil
       end
   end,                
}
TypeClass = UEL0106c

