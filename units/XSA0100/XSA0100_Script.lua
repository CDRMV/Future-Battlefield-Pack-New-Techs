#****************************************************************************
#**
#**  File     :  /data/units/XSA0103/XSA0103_script.lua
#**  Author(s):  Jessica St. Croix
#**
#**  Summary  :  Seraphim Bomber Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local SAirUnit = import('/lua/seraphimunits.lua').SAirUnit
local SDFBombOtheWeapon = import('/lua/seraphimweapons.lua').SDFBombOtheWeapon

XSA0100 = Class(SAirUnit) {

	OnCreate = function(self)
        SAirUnit.OnCreate(self)
        self.Spinners = {
            Spinner1 = CreateRotator(self, 'XSA0103', 'y', nil, 0, 60, 360):SetTargetSpeed(60),
        }
        for k, v in self.Spinners do
            self.Trash:Add(v)
        end
    end,
	
    Weapons = {
        Bomb = Class(SDFBombOtheWeapon) {},
    },
}

TypeClass = XSA0100