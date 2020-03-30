#****************************************************************************
#**
#**  File     :  /units/XSA0304/XSA0304_script.lua
#**  Author(s):  Drew Staltman, Greg Kohne, Gordon Duclos
#**
#**  Summary  :  Seraphim Strategic Bomber Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SDFUltraChromaticBeamGenerator = import('/lua/seraphimweapons.lua').SDFUltraChromaticBeamGenerator
local SLaanseMissileWeapon = import('/lua/seraphimweapons.lua').SLaanseMissileWeapon

XSA0200 = Class(SAirUnit) {

    Weapons = {
        MainGun = Class(SDFUltraChromaticBeamGenerator) {},
        Missile = Class(SLaanseMissileWeapon) {},
    },

	OnCreate = function(self)
        SAirUnit.OnCreate(self)
        self.Spinners = {
            Spinner1 = CreateRotator(self, 'XSA0304', 'y', nil, 0, 60, 360):SetTargetSpeed(30),
			Spinner2 = CreateRotator(self, 'Spinner', 'y', nil, 0, -60, -360):SetTargetSpeed(20),
        }
        for k, v in self.Spinners do
            self.Trash:Add(v)
        end
    end,
}
TypeClass = XSA0200