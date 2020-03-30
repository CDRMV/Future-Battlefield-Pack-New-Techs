#****************************************************************************
#**
#**  File     :  UEL0103b_script.lua
#**  Author(s):  Jessica St. Croix, Dru Staltman
#**
#**  Summary  :  UEF Mobile Missile Platform Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher

UEL0103b = Class(TLandUnit) {
    Weapons = {
        Missile_Pod = Class(TSAMLauncher) {}, 
    },
}

TypeClass = UEL0103b