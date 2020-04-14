#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0103/UES0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Frigate Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

UES0107 = Class(TSeaUnit) {
    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
        },
    },
}

TypeClass = UES0107