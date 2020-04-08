#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0106/UEL0106_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Light Assault Bot Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local Unit = import('/lua/sim/Unit.lua').Unit
local TSAMLauncher = import('/lua/terranweapons.lua').TSAMLauncher


UEL0003 = Class(TWalkingLandUnit) {
    Weapons = {
        ArmCannonTurret = Class(TSAMLauncher) {},
    },
}
TypeClass = UEL0003

