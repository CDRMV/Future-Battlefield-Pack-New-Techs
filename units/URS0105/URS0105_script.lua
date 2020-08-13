#****************************************************************************
#**
#**  File     :  /cdimage/units/URS0103/URS0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Cybran Frigate Script
#**
#**  Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local CybranWeaponsFile = import('/lua/cybranweapons.lua')
local CAAAutocannon = CybranWeaponsFile.CAAAutocannon

URS0105 = Class(CSeaUnit) {
    DestructionTicks = 200,

    Weapons = {
        Gun = Class(CAAAutocannon) {},
    },
}

TypeClass = URS0105
