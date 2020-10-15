#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0202/UEL0202_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Heavy Tank Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local THoverLandUnit = import('/lua/terranunits.lua').THoverLandUnit
local FBPNTWeaponFile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua')
local TDFLaserLightWeapon = FBPNTWeaponFile.TDFLaserLightWeapon
local EffectUtils = import('/lua/effectutilities.lua')
local Effects = import('/lua/effecttemplates.lua')

UEL0212 = Class(THoverLandUnit) {
    Weapons = {
        FrontTurret01 = Class(TDFLaserLightWeapon) 
        {
				IdleState = State (TDFLaserLightWeapon.IdleState) {
                Main = function(self)
                    TDFLaserLightWeapon.IdleState.Main(self)
                end,
                
                OnGotTarget = function(self)
						if not self.SpinManip01 then 
							self.SpinManip01 = CreateRotator(self.unit, 'Barrel', 'z', nil, 750, 750, 750)
							self.unit.Trash:Add(self.SpinManip01)
							self.SpinManip01:SetTargetSpeed(650)
						end	
						TDFLaserLightWeapon.OnGotTarget(self)
                end,
					OnFire = function(self)
						TDFLaserLightWeapon.IdleState.OnFire(self)
						if self.SpinManip01 then
						self.SpinManip01:SetTargetSpeed(650)
						end	
                end,                
            },
                  
            OnLostTarget = function(self)
                if self.SpinManip01 then
					self.SpinManip01:SetTargetSpeed(0)
				end	

                TDFLaserLightWeapon.OnLostTarget(self)
            end,
        }
    },
}

TypeClass = UEL0212