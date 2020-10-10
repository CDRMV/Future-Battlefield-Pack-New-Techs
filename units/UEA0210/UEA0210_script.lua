#****************************************************************************
#**
#**  File     :  /cdimage/units/UEA0203/UEA0203_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix, Gordon Duclos
#**
#**  Summary  :  UEF Gunship Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local FBPNTWeaponFile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua')
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFRiotWeapon = WeaponsFile.TDFRiotWeapon
local TSAMLauncher = WeaponsFile.TSAMLauncher
local TReflectBeamWeapon = FBPNTWeaponFile.TReflectBeamWeapon

UEA0210 = Class(TAirUnit) {

    Weapons = {
        Turret01 = Class(TDFRiotWeapon) {},
        Missile_Pod = Class(TSAMLauncher) {}, 
		ReflectWeapon = Class(TReflectBeamWeapon){},
    },
}

TypeClass = UEA0210