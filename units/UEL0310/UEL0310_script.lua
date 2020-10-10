#****************************************************************************
#**
#**  File     :  /data/units/XEL0306/XEL0306_script.lua
#**  Author(s):  Jessica St. Croix, Dru Staltman
#**
#**  Summary  :  UEF Mobile Missile Platform Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local FBPNTWeaponFile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua')
local TDFHeavyMaserCannonWeapon = FBPNTWeaponFile.TDFHeavyMaserCannonWeapon
local TIFFragLauncherWeapon = WeaponsFile.TIFFragLauncherWeapon

UEL0310 = Class(TLandUnit) {
    Weapons = {
        HeavyMaserWeapon = Class(TDFHeavyMaserCannonWeapon) {
        },
		
		Grenade = Class(TIFFragLauncherWeapon) {},  
    },  

}

TypeClass = UEL0310