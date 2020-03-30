#****************************************************************************
#**
#**  File     :  /units/XSA0303/XSA0303_script.lua
#**  Author(s):  Greg Kohne
#**
#**  Summary  :  Seraphim Air Superiority Fighter Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeaponAirUnit
local SDFAireauWeapon = import('/lua/seraphimweapons.lua').SDFAireauWeapon
local SDFBombOtheWeapon = import('/lua/seraphimweapons.lua').SDFBombOtheWeapon

XSA0303 = Class(SAirUnit) {
    Weapons = {
        AutoCannon1 = Class(SAALosaareAutoCannonWeapon) {},
		MainGun = Class(SDFAireauWeapon) {},
		SecondGun = Class(SDFBombOtheWeapon) {},
    },
	
		OnCreate = function(self)
        SAirUnit.OnCreate(self)
        self.Spinners = {
            Spinner1 = CreateRotator(self, 'XSA0303', 'y', nil, 0, 60, 360):SetTargetSpeed(30),
			Spinner2 = CreateRotator(self, 'Spinner', 'y', nil, 0, -60, -360):SetTargetSpeed(20),
			Spinner3 = CreateRotator(self, 'Spinner2', 'y', nil, 0, -60, -360):SetTargetSpeed(10),
        }
        for k, v in self.Spinners do
            self.Trash:Add(v)
        end
    end,
}

TypeClass = XSA0303