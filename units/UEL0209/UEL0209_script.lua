#****************************************************************************
#**
#**  File     :  /cdimage/units/URL0107/URL0107_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Cybran Heavy Infantry Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CWalkingLandUnit = import('/lua/cybranunits.lua').CWalkingLandUnit
local TerranWeaponFile = import('/lua/terranweapons.lua')
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher


UEL0209 = Class(CWalkingLandUnit) {
    Weapons = {
        LaserArms = Class(TSAMLauncher) {}
    },  
}

TypeClass = UEL0209
