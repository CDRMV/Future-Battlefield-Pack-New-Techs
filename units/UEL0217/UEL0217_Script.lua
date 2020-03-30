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
local WeaponFile = import('/lua/terranweapons.lua')
local TDFLaserLightWeapon = WeaponFile.TDFLaserLightWeapon
local TDFLaserArtWeapon = WeaponFile.TDFLaserArtWeapon
local TSAMLauncher = WeaponFile.TSAMLauncher

UEL0217 = Class(THoverLandUnit) {
    Weapons = {
        FrontTurret01 = Class(TDFLaserLightWeapon) {},
        Missile_Pod = Class(TSAMLauncher) {},
        GroundGun2 = Class(TDFLaserArtWeapon) {},
        GroundGun3 = Class(TDFLaserArtWeapon) {},
    },
}

TypeClass = UEL0217