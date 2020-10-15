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

UEL0211 = Class(THoverLandUnit) {
    Weapons = {
        FrontTurret01 = Class(TDFLaserLightWeapon) {
        }
    },
}

TypeClass = UEL0211