#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0303/UEL0303_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Siege Assault Bot Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local WeaponFile = import('/lua/terranweapons.lua')
local TDFLaserLightWeapon = WeaponFile.TDFLaserLightWeapon
local TDFLaserArtWeapon = WeaponFile.TDFLaserArtWeapon

UEL0207 = Class(TWalkingLandUnit) {
    Weapons = {
        GroundGun = Class(TDFLaserLightWeapon) {},
        GroundGun2 = Class(TDFLaserArtWeapon) {},
    },
    
}

TypeClass = UEL0207