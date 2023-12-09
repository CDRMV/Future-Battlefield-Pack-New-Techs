#****************************************************************************
#**
#**  File     :  /cdimage/units/UAB2101/UAB2101_script.lua
#**  Author(s):  John Comes, David Tomandl
#**
#**  Summary  :  Aeon Light Laser Tower Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local AAirUnit = import('/lua/aeonunits.lua').AAirUnit
local WeaponsFile = import ('/lua/aeonweapons.lua')
local ADFLightPhasonLaser = WeaponsFile.ADFPhasonLaser

UAA0201 = Class(AAirUnit) {
    DestroyNoFallRandomChance = 1.1,
    Weapons = {
        MainGun = Class(ADFLightPhasonLaser) {},
    },
	
	   OnStopBeingBuilt = function(self,builder,layer)
        AAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.Rotator1 = CreateRotator(self, 'Spinner1', 'y', nil, 60, 0, 0)
		self.Rotator1 = CreateRotator(self, 'Spinner2', 'y', nil, -60, 0, 0)
        end,
}

TypeClass = UAA0201