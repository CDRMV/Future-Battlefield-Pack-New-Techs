#****************************************************************************
#**
#**  File     :  /data/units/XEL0306/XEL0306_script.lua
#**  Author(s):  Jessica St. Croix, Dru Staltman
#**
#**  Summary  :  UEF Mobile Missile Platform Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local TDFHeavyMaserCannonWeapon2 = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua').TDFHeavyMaserCannonWeapon2

UEL0310 = Class(TLandUnit) {
    Weapons = {
        MaserWeapon = Class(TDFHeavyMaserCannonWeapon2) {
        },
    },

}

TypeClass = UEL0310