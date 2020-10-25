#****************************************************************************
#**
#**  File     :  /cdimage/units/UEA0103/UEA0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Gordon Duclos
#**
#**  Summary  :  Terran Carpet Bomber Unit Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
#
# Terran Bomber Script : UEA0103
#
local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local TIFCarpetBombWeapon = import('/lua/terranweapons.lua').TIFCarpetBombWeapon
local TIFSmallYieldNuclearBombWeapon = import('/lua/terranweapons.lua').TIFSmallYieldNuclearBombWeapon
local TAirToAirLinkedRailgun = import('/lua/terranweapons.lua').TAirToAirLinkedRailgun


UEA0402= Class(TAirUnit) {
    Weapons = {
        SecBomb = Class(TIFCarpetBombWeapon) {},
		Bomb = Class(TIFSmallYieldNuclearBombWeapon) {},
		LinkedRailGun1 = Class(TAirToAirLinkedRailgun) {},
    },
#   DestructionPartsLowToss = {'P01', 'P02', 'P03', 'P04', 'P05', 'P06', },
#   DestructionTicks = 50,
    DamageEffectPullback = 0.5,
}

TypeClass = UEA0402

