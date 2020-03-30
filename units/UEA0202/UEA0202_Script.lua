#****************************************************************************
#**
#**  File     :  /data/units/XEA0306/XEA0306_script.lua
#**  Author(s):  Jessica St. Croix
#**
#**  Summary  :  UEF Heavy Air Transport Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local explosion = import('/lua/defaultexplosions.lua')
local util = import('/lua/utilities.lua')
local WeaponsFile = import('/lua/terranweapons.lua')

local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local TSAMLauncher = WeaponsFile.TSAMLauncher

UEA0202 = Class(TAirUnit) {
    EngineRotateBones = {'BackRight_Engine', 'BackLeft_Engine', },

    Weapons = {
        Missile_Pod = Class(TSAMLauncher) {}, 
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.EngineManipulators = {}

        # create the engine thrust manipulators
        for key, value in self.EngineRotateBones do
            table.insert(self.EngineManipulators, CreateThrustController(self, "thruster", value))
        end

        # set up the thursting arcs for the engines
        for key,value in self.EngineManipulators do
            #                          XMAX, XMIN, YMAX,YMIN, ZMAX,ZMIN, TURNMULT, TURNSPEED
            value:SetThrustingParam( -0.0, 0.0, -0.25, 0.25, -0.1, 0.1, 1.0,      0.25 )
        end
        
        for k, v in self.EngineManipulators do
            self.Trash:Add(v)
        end

    end,
    
}

TypeClass = UEA0202