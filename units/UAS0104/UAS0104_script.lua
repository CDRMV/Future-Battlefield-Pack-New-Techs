#****************************************************************************
#**
#**  File     :  /cdimage/units/UAS0202/UAS0202_script.lua
#**  Author(s):  David Tomandl
#**
#**  Summary  :  Aeon Cruiser Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local AeonWeapons = import('/lua/aeonweapons.lua')
local AAirStagingPlatformUnit = import('/lua/aeonunits.lua').AAirStagingPlatformUnit
local AAAZealotMissileWeapon = AeonWeapons.AAAZealotMissileWeapon
local Entity = import('/lua/sim/Entity.lua').Entity

UAS0104 = Class(AAirStagingPlatformUnit) {

    Weapons = {
        AntiAirMissiles01 = Class(AAAZealotMissileWeapon) {},
    },
	
    RadarThread = function(self)
        local spinner = CreateRotator(self, 'Spinner', 'y', nil, 90, 0, -90)
        self.Trash:Add(spinner)
        while true do
            WaitFor(spinner)
            spinner:SetTargetSpeed(90)
			WaitFor(spinner)
            spinner:SetTargetSpeed(-90)
        end
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        AAirStagingPlatformUnit.OnStopBeingBuilt(self,builder,layer)
        self:ForkThread(self.RadarThread)
    end,

}

TypeClass = UAS0104