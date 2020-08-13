#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0111/UEL0111_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Mobile Missile Launcher Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local TDFMediumMaserCannonWeapon2 = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua').TDFMediumMaserCannonWeapon2

UEL0215 = Class(TLandUnit) {

    Weapons = {
        MaserWeapon = Class(TDFMediumMaserCannonWeapon2) {
        },
    },

}

TypeClass = UEL0215