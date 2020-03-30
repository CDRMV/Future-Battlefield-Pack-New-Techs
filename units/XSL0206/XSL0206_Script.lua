#****************************************************************************
#**
#**  File     :  /cdimage/units/XSA0104/XSA0104_script.lua
#**  Author(s):  Greg Kohne, Aaron Lundquist
#**
#**  Summary  : Seraphim T2 Transport Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local SHoverLandUnit = import('/lua/seraphimunits.lua').SHoverLandUnit
local SDFOhCannon = import('/lua/seraphimweapons.lua').SDFOhCannon

XSL0206 = Class(SHoverLandUnit) {

    Weapons = {
        MainGun = Class(SDFOhCannon) {}
    },
	
	OnStopBeingBuilt = function(self,builder,layer)
        SHoverLandUnit.OnStopBeingBuilt(self,builder,layer)
        self.Rotator1 = CreateRotator(self, 'Spinner', 'y', nil, 10, 5, 10)
        self.Trash:Add(self.Rotator1)
		self.Rotator1:SetTargetSpeed(40)
    end,
}

TypeClass = XSL0206