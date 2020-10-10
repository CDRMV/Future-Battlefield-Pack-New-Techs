#****************************************************************************
#**
#**  File     :  /lua/defaultcollisionbeams.lua
#**  Author(s):  Gordon Duclos
#**
#**  Summary  :  Default definitions collision beams
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local CollisionBeam = import('/lua/sim/CollisionBeam.lua').CollisionBeam
local EffectTemplate = import('/lua/EffectTemplates.lua')
local Util = import('/lua/utilities.lua')

#-----------------------------
#   Basic Beam Parameters
#-----------------------------
SCCollisionBeam = Class(CollisionBeam) {
    FxImpactUnit = EffectTemplate.DefaultProjectileLandUnitImpact,
    FxImpactLand = {},#EffectTemplate.DefaultProjectileLandImpact,
    FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactUnderWater = EffectTemplate.DefaultProjectileUnderWaterImpact,
    FxImpactAirUnit = EffectTemplate.DefaultProjectileAirUnitImpact,
    FxImpactProp = {},
    FxImpactShield = {},    
    FxImpactNone = {},
}

#----------------------------------
#   UEF EXPERIMENTAL LIZARD BOT ATOMIC RAY COLLISION BEAM
#----------------------------------
AtomicRayCollisionBeam = Class(SCCollisionBeam) {
    TerrainImpactType = 'LargeBeam02',
    TerrainImpactScale = 1,
        
    FxBeam = {'/effects/emitters/uef_orbital_death_laser_beam_01_emit.bp'},
    FxBeamEndPoint = {
		'/effects/emitters/uef_orbital_death_laser_end_01_emit.bp',			# big glow
		'/effects/emitters/uef_orbital_death_laser_end_02_emit.bp',			# random bright blueish dots
		'/effects/emitters/uef_orbital_death_laser_end_04_emit.bp',			# molecular, small details
		'/effects/emitters/uef_orbital_death_laser_end_05_emit.bp',			# rings
		'/effects/emitters/uef_orbital_death_laser_end_07_emit.bp',			# outward line streaks
		'/effects/emitters/uef_orbital_death_laser_end_08_emit.bp',			# center glow
		'/effects/emitters/uef_orbital_death_laser_end_distort_emit.bp',	# screen distortion
	},
    FxBeamStartPoint = {
		'/effects/emitters/uef_orbital_death_laser_muzzle_01_emit.bp',	# random bright blueish dots
		'/effects/emitters/uef_orbital_death_laser_muzzle_02_emit.bp',	# molecular, small details
		'/effects/emitters/uef_orbital_death_laser_muzzle_05_emit.bp',	# big glow
    },
    
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.5,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 3.5 + (Random() * 3.5) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 250, 15, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 3.2 + (Random() * 3.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,    
}

#----------------------------------
#   UEF Terra X2 REFLECT COLLISION BEAM
#----------------------------------
ReflectCollisionBeam = Class(SCCollisionBeam) {
    TerrainImpactType = 'LargeBeam02',
    TerrainImpactScale = 1,
        
    FxBeam = {'/mods/Future Battlefield Pack New Techs/effects/emitters/uef_reflect_beam_01_emit.bp'},
    FxBeamEndPoint = {
		'/effects/emitters/uef_orbital_death_laser_end_04_emit.bp',			# molecular, small details
		'/effects/emitters/uef_orbital_death_laser_end_05_emit.bp',			# rings
		'/effects/emitters/uef_orbital_death_laser_end_07_emit.bp',			# outward line streaks
		'/effects/emitters/uef_orbital_death_laser_end_distort_emit.bp',	# screen distortion
		'/mods/Future Battlefield Pack New Techs/effects/emitters/uef_reflect_beam_end_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/effects/emitters/uef_reflect_beam_end_02_emit.bp',
	},
    FxBeamStartPoint = {
		'/effects/emitters/uef_orbital_death_laser_muzzle_02_emit.bp',	# molecular, small details
    },
    
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.5,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 3.5 + (Random() * 3.5) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 250, 15, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 3.2 + (Random() * 3.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,    
}

#----------------------------------
#   UEF MINI COLLISION BEAMS
#----------------------------------
MiniBlueCollisionBeam = Class(SCCollisionBeam) {
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/mini_blue_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/mini_blue_beam_end_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/effects/emitters/mini_blue_beam_end_02_emit.bp',
	},
    FxBeamEndPointScale = 1,
}

#----------------------------------
#   UEF MASER COLLISION BEAMS
#----------------------------------

ElectricMaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
		 '/mods/Future Battlefield Pack New Techs/effects/emitters/electric_maser_muzzle_01_emit.bp', 
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/electric_maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

HyperMaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
	     '/effects/emitters/hiro_beam_generator_muzzle_01_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_02_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_03_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_04_emit.bp',
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/hyper_maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
	    '/effects/emitters/hiro_beam_generator_hit_01_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

LightHyperMaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
	     '/effects/emitters/hiro_beam_generator_muzzle_01_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_02_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_03_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_04_emit.bp',
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/light_hyper_maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
	    '/effects/emitters/hiro_beam_generator_hit_01_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

LightMaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
	     '/effects/emitters/hiro_beam_generator_muzzle_01_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_02_emit.bp', 
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/light_maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

MaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
	     '/effects/emitters/hiro_beam_generator_muzzle_01_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_02_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_04_emit.bp',
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

DualMaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
	     '/effects/emitters/hiro_beam_generator_muzzle_01_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_02_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_04_emit.bp',
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/dual_maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

HeavyMaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
	     '/effects/emitters/hiro_beam_generator_muzzle_01_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_02_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_03_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_04_emit.bp',
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/heavy_maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
	    '/effects/emitters/hiro_beam_generator_hit_01_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}

ExperimentalMaserCollisionBeam = Class(CollisionBeam) {

    TerrainImpactType = 'LargeBeam01',
    TerrainImpactScale = 1,
    FxBeamStartPoint = {
	     '/effects/emitters/hiro_beam_generator_muzzle_01_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_02_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_03_emit.bp', 
		 '/effects/emitters/hiro_beam_generator_muzzle_04_emit.bp',
	},
    FxBeam = {
		'/mods/Future Battlefield Pack New Techs/effects/emitters/experimental_maser_beam_01_emit.bp'
	},
    FxBeamEndPoint = {
	    '/effects/emitters/hiro_beam_generator_hit_01_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_02_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_03_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_04_emit.bp',
		'/effects/emitters/hiro_beam_generator_hit_05_emit.bp',
	},
    SplatTexture = 'czar_mark01_albedo',
    ScorchSplatDropTime = 0.25,

    OnImpact = function(self, impactType, targetEntity)
        if impactType == 'Terrain' then
            if self.Scorching == nil then
                self.Scorching = self:ForkThread( self.ScorchThread )   
            end
        elseif not impactType == 'Unit' then
            KillThread(self.Scorching)
            self.Scorching = nil
        end
        CollisionBeam.OnImpact(self, impactType, targetEntity)
    end,
    
    OnDisable = function( self )
        CollisionBeam.OnDisable(self)
        KillThread(self.Scorching)
        self.Scorching = nil   
    end,

    ScorchThread = function(self)
        local army = self:GetArmy()
        local size = 0.75 + (Random() * 0.75) 
        local CurrentPosition = self:GetPosition(1)
        local LastPosition = Vector(0,0,0)
        local skipCount = 1
        while true do
            if Util.GetDistanceBetweenTwoVectors( CurrentPosition, LastPosition ) > 0.25 or skipCount > 100 then
                CreateSplat( CurrentPosition, Util.GetRandomFloat(0,2*math.pi), self.SplatTexture, size, size, 100, 100, army )
                LastPosition = CurrentPosition
                skipCount = 1
            else
                skipCount = skipCount + self.ScorchSplatDropTime
            end
                
            WaitSeconds( self.ScorchSplatDropTime )
            size = 1.2 + (Random() * 1.5)
            CurrentPosition = self:GetPosition(1)
        end
    end,
}