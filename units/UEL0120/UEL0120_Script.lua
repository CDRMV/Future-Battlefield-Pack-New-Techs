#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0101/UEL0101_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Land Scout Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TConstructionUnit = import('/lua/terranunits.lua').TConstructionUnit
local TDFLightMaserCannonWeapon = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua').TDFLightMaserCannonWeapon


UEL0120 = Class(TConstructionUnit) {
    
    Weapons = {
        MainGun = Class(TDFLightMaserCannonWeapon) {
        },
    },

}


TypeClass = UEL0120
