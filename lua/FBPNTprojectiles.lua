-----------------------------------------------------------------
-- File     : /cdimage/lua/FBPNTProjectiles.lua
-- Author(s): CDRMV 
-- Summary  :
-- Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local Projectile = import('/lua/sim/projectile.lua').Projectile
local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local EmitterProjectile = DefaultProjectileFile.EmitterProjectile
local SingleBeamProjectile = DefaultProjectileFile.SingleBeamProjectile
local MultiPolyTrailProjectile = DefaultProjectileFile.MultiPolyTrailProjectile
local EffectTemplate = import('/lua/EffectTemplates.lua')

Flamethrower01 = Class(EmitterProjectile) {
    FxTrails = {'/mods/Future Battlefield Pack New Techs/Effects/Emitters/FlamerthrowerTrailFX.bp',},
    
    FxImpactTrajectoryAligned = false,

    FxImpactUnit = EffectTemplate.TNapalmCarpetBombHitLand01,
    FxImpactProp = EffectTemplate.TNapalmCarpetBombHitLand01,
    FxImpactLand = EffectTemplate.TNapalmCarpetBombHitLand01,
    FxImpactWater = EffectTemplate.TNapalmCarpetBombHitWater01,
    FxImpactUnderWater = {},
}

Flamethrower02 = Class(EmitterProjectile) {
    FxTrails = {'/mods/Future Battlefield Pack New Techs/Effects/Emitters/FlamerthrowerTrailFX.bp',},
       FxTrailScale = 0.5,
    
    FxImpactTrajectoryAligned = false,

    FxImpactUnit = EffectTemplate.TNapalmCarpetBombHitLand01,
    FxImpactProp = EffectTemplate.TNapalmCarpetBombHitLand01,
    FxImpactLand = EffectTemplate.TNapalmCarpetBombHitLand01,
    FxImpactWater = EffectTemplate.TNapalmCarpetBombHitWater01,
    FxImpactUnderWater = {},
    FxLandHitScale = 0.5,
    FxPropHitScale = 0.5,
    FxUnitHitScale = 0.5,
    FxNoneHitScale = 0.5,
}

BlueLightLaserProjectile = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/Laserblue001_emit',
	},
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = EffectTemplate.FireCloudSml04,
    FxImpactNone = EffectTemplate.FireCloudSml04, 
    FxImpactWater = EffectTemplate.WaterSplash01,
    FxImpactUnderWater = {},
}

BlueLaserProjectile01 = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/Laserblue01_emit',
	},
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = EffectTemplate.FireCloudSml04,
    FxImpactNone = EffectTemplate.FireCloudSml04, 
    FxImpactWater = EffectTemplate.WaterSplash01,
    FxImpactUnderWater = {},
}

BlueLaserProjectile02 = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/Laserblue02_emit',
	},
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = EffectTemplate.FireCloudSml04,
    FxImpactNone = EffectTemplate.FireCloudSml04, 
    FxImpactWater = EffectTemplate.WaterSplash01,
    FxImpactUnderWater = {},
}

TFreezerGrenade = Class(MultiPolyTrailProjectile) {
    FxTrails= EffectTemplate.THeavyFragmentationGrenadeFxTrails,
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TGaussCannonHitUnit01,
    FxImpactProp = EffectTemplate.TGaussCannonHitUnit01,
	FxImpactWater = EffectTemplate.WaterSplash01,
    FxImpactLand = EffectTemplate.CArtilleryHit01,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

THellfireMissile = Class(SingleBeamProjectile) {
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',
    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
	FxImpactWater = EffectTemplate.WaterSplash01,
    FxTrails = EffectTemplate.TMissileExhaust03,
    FxTrailOffset = -1,
    FxImpactUnderWater = {},
}

THeavyMaserCannonProjectile = Class(EmitterProjectile) {
    FxTrails = 
	{
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_02_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_03_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_04_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrails_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrails_02_emit.bp',
	},
   	FxTrailScale = 0.5,
    FxImpactTrajectoryAligned = false,
    FxImpactUnit = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactProp = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactLand = EffectTemplate.TPlasmaCannonHeavyHit01,
    FxImpactUnderWater = {},
    FxLandHitScale = 0.7,
    FxPropHitScale = 0.7,
    FxUnitHitScale = 0.7,
    FxNoneHitScale = 0.7,
    FxTrailOffset = 0,
}

TExperimentalMaserCannonProjectile = Class(EmitterProjectile) {
    FxTrails = 
	{
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_02_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_03_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_04_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrails_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrails_02_emit.bp',
	},
   	FxTrailScale = 0.5,
    FxImpactTrajectoryAligned = false,
    FxImpactUnit = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactProp = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactLand = EffectTemplate.TPlasmaCannonHeavyHit01,
    FxImpactUnderWater = {},
    FxLandHitScale = 0.7,
    FxPropHitScale = 0.7,
    FxUnitHitScale = 0.7,
    FxNoneHitScale = 0.7,
    FxTrailOffset = 0,
}

