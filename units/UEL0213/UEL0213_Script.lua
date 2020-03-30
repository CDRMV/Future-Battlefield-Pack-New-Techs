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
local TDFLaserArtWeapon = WeaponFile.TDFLaserArtWeapon

UEL0213 = Class(THoverLandUnit) {
    Weapons = {
        FrontTurret01 = Class(TDFLaserArtWeapon) {
        }
    },
}

TypeClass = UEL0213