#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0303/UEL0303_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Siege Assault Bot Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TerranWeaponFile = import('/lua/terranweapons.lua')
local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local TSAMLauncher = TerranWeaponFile.TSAMLauncher
local TDFGaussCannonWeapon = TerranWeaponFile.TDFGaussCannonWeapon
local TDFRiotWeapon = TerranWeaponFile.TDFRiotWeapon

UEL0311 = Class(TWalkingLandUnit) {

    Weapons = {
	    FrontTurret01 = Class(TDFGaussCannonWeapon) {
        },
        Missile_Pod = Class(TSAMLauncher) {
        },
		GatlingGun = Class(TDFRiotWeapon) {
                PlayFxWeaponUnpackSequence = function(self)
                    if not self.SpinManip then 
                        self.SpinManip = CreateRotator(self.unit, 'L_Gatling_Rotate', 'z', nil, -270, -180, -60)
                        self.unit.Trash:Add(self.SpinManip)
						self.SpinManip2 = CreateRotator(self.unit, 'R_Gatling_Rotate', 'z', nil, 270, 180, 60)
						self.unit.Trash:Add(self.SpinManip2)
                    end
                    if self.SpinManip then
                        self.SpinManip:SetTargetSpeed(270)
                    end
					if self.SpinManip2 then
                        self.SpinManip2:SetTargetSpeed(270)
                    end
                    TDFRiotWeapon.PlayFxWeaponUnpackSequence(self)
                end,

                PlayFxWeaponPackSequence = function(self)
                    if self.SpinManip then
                        self.SpinManip:SetTargetSpeed(0)
                    end
					if self.SpinManip2 then
                        self.SpinManip2:SetTargetSpeed(0)
                    end
                    TDFRiotWeapon.PlayFxWeaponPackSequence(self)
                end,
		},
    },
    
}

TypeClass = UEL0311