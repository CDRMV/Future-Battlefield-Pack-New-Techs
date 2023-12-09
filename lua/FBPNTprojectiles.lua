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
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
local EffectTemplate = import('/lua/EffectTemplates.lua')
local ModEffectTemplate = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTEffectTemplates.lua')

TCobraMissileProjectile = Class(SingleBeamProjectile) {
    BeamName = '/effects/emitters/missile_exhaust_fire_beam_02_emit.bp',
    FxTrails = EffectTemplate.TMissileExhaust03,

    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxImpactProjectile = EffectTemplate.TMissileHit01,
    FxProjectileHitScale = 5,
    FxImpactUnderWater = {},
}

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
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/Laserblue001_emit.bp',
	},
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = ModEffectTemplate.FireCloudSml04,
    FxImpactNone = ModEffectTemplate.FireCloudSml04, 
    FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactUnderWater = {},
}

BlueLaserProjectile01 = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/Laserblue01_emit.bp',
	},
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = ModEffectTemplate.FireCloudSml04,
    FxImpactNone = ModEffectTemplate.FireCloudSml04, 
    FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactUnderWater = {},
}

BlueLaserProjectile02 = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/Laserblue02_emit.bp',
	},
	PolyTrailOffset = {0,0},

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = ModEffectTemplate.FireCloudSml04,
    FxImpactNone = ModEffectTemplate.FireCloudSml04, 
    FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactUnderWater = {},
}


TFreezerGrenade = Class(MultiPolyTrailProjectile) {
    FxTrails= EffectTemplate.THeavyFragmentationGrenadeFxTrails,
    PolyTrails = EffectTemplate.TGaussCannonPolyTrail,
    PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TGaussCannonHitUnit01,
    FxImpactProp = EffectTemplate.TGaussCannonHitUnit01,
	FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactLand = EffectTemplate.CArtilleryHit01,
    FxTrailOffset = 0,
    FxImpactUnderWater = {},
}

THellfireMissile = Class(SingleBeamProjectile) {
    BeamName = '/mods/Future Battlefield Pack New Techs/Effects/Emitters/missile_exhaust_fire_beam_07_emit.bp',
    FxTrails = EffectTemplate.TMissileExhaust03,

    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
	FxImpactWater = EffectTemplate.DefaultProjectileWaterImpact,
    FxImpactProjectile = EffectTemplate.TMissileHit01,
    FxProjectileHitScale = 5,
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

TDFCargoProjectile = Class(SinglePolyTrailProjectile) {
    DestroyOnImpact = false,
    FxTrails = EffectTemplate.TMissileExhaust02,
    FxTrailOffset = -1,
    BeamName = '/effects/emitters/missile_munition_exhaust_beam_01_emit.bp',

    FxImpactUnit = EffectTemplate.TMissileHit01,
    FxImpactLand = EffectTemplate.TMissileHit01,
    FxImpactProp = EffectTemplate.TMissileHit01,
    FxImpactUnderWater = {},

    OnImpact = function(self, targetType, targetEntity)
        local army = self:GetArmy()
        SingleBeamProjectile.OnImpact(self, targetType, targetEntity)
    end,
}


