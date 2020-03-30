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

    RadarThread = function(self)
        local spinner = CreateRotator(self, 'Spinner04', 'x', nil, 0, 90, -90)
        self.Trash:Add(spinner)
        while true do
            WaitFor(spinner)
            spinner:SetTargetSpeed(90)
            WaitFor(spinner)
            spinner:SetTargetSpeed(-90)
        end
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        TAirStagingPlatformUnit.OnStopBeingBuilt(self,builder,layer)
        self:ForkThread(self.RadarThread)
    end,
}

TypeClass = UES0102