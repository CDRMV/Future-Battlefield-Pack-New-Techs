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
local TDFMediumMaserCannonWeapon = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua').TDFMediumMaserCannonWeapon

UEL0214 = Class(TLandUnit) {

    Weapons = {
        MaserWeapon = Class(TDFMediumMaserCannonWeapon) {
        },
    },

}

TypeClass = UEL0214