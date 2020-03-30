#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0202/UES0202_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Cruiser Script
#**
#**  Copyright � 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local EffectTemplate = import('/lua/EffectTemplates.lua')
local TConstructionUnit = import('/lua/terranunits.lua').TConstructionUnit
local WeaponFile = import('/lua/terranweapons.lua')
local TSAMLauncher = WeaponFile.TSAMLauncher
local TDFRiotWeapon = import('/lua/terranweapons.lua').TDFRiotWeapon


UES0205 = Class(TConstructionUnit) {
    DestructionTicks = 200,

    Weapons = {
        Riotgun01 = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
		Riotgun02 = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
		Riotgun03 = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
		Riotgun04 = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
		Riotgun05 = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
		Riotgun06 = Class(TDFRiotWeapon) {
            FxMuzzleFlash = EffectTemplate.TRiotGunMuzzleFxTank
        },
		
        AA_Missilelauncher = Class(TSAMLauncher) {
            FxMuzzleFlash = EffectTemplate.TAAMissileLaunchNoBackSmoke,
        },
	},

    RadarThread = function(self)
        local spinner = CreateRotator(self, 'Spinner04', 'x', nil, 0, 30, -45)
        while true do
            WaitFor(spinner)
            spinner:SetTargetSpeed(-45)
            WaitFor(spinner)
            spinner:SetTargetSpeed(45)
        end
    end,

    OnStopBeingBuilt = function(self, builder,layer)
        TConstructionUnit.OnStopBeingBuilt(self, builder,layer)
        self:ForkThread(self.RadarThread)
        self.Trash:Add(CreateRotator(self, 'Spinner01', 'y', nil, 45, 0, 0))
    end,

}

TypeClass = UES0205