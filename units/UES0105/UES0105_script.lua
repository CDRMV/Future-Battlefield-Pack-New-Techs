#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0103/UES0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Frigate Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local Entity = import('/lua/sim/Entity.lua').Entity

UES0104 = Class(TSeaUnit) {
    DestructionTicks = 100,

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
        },
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
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
		self.Trash:Add(CreateRotator(self, 'Spinner05', 'y', nil, 90, 0, 180))
        self.Trash:Add(CreateRotator(self, 'Spinner06', 'y', nil, 180, 0, 180))
        self:ForkThread(self.RadarThread)
    end,
}

TypeClass = UES0104