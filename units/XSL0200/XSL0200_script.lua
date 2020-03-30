#****************************************************************************
#**
#**  File     :  /units/XSB4201/XSB4201_script.lua
#**
#**  Summary  :  Seraphim anti-TML Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local SHoverLandUnit = import('/lua/seraphimunits.lua').SHoverLandUnit
local SAMElectrumMissileDefense = import('/lua/seraphimweapons.lua').SAMElectrumMissileDefense

XSL0200 = Class(SHoverLandUnit) {
    Weapons = {
        AntiMissile = Class(SAMElectrumMissileDefense) {},
    },
}

TypeClass = XSL0200

