#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0103/UES0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Frigate Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TAirStagingPlatformUnit = import('/lua/terranunits.lua').TAirStagingPlatformUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun
local Entity = import('/lua/sim/Entity.lua').Entity

UES0102 = Class(TAirStagingPlatformUnit) {

    Weapons = {
        AAGun = Class(TAALinkedRailgun) {
        },
    },
}

TypeClass = UES0102