-----------------------------------------------------------------
-- File     : /cdimage/lua/FBPNTProjectiles.lua
-- Author(s): CDRMV 
-- Summary  :
-- Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local Projectile = import('/lua/sim/projectile.lua').Projectile
local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local EmitterProjectile = DefaultProjectileFile.EmitterProjectile
local OnWaterEntryEmitterProjectile = DefaultProjectileFile.OnWaterEntryEmitterProjectile
local SingleBeamProjectile = DefaultProjectileFile.SingleBeamProjectile
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
local MultiPolyTrailProjectile = DefaultProjectileFile.MultiPolyTrailProjectile
local SingleCompositeEmitterProjectile = DefaultProjectileFile.SingleCompositeEmitterProjectile
local NullShell = DefaultProjectileFile.NullShell
local EffectTemplate = import('/lua/EffectTemplates.lua')
local FBPEffectTemplate = '/mods/Future Battlefield Pack New Techs/lua/FBPNTEffectTemplates.lua'
local util = import('/lua/utilities.lua')
local NukeProjectile = DefaultProjectileFile.NukeProjectile

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
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblue001_emit.bp',
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblue001_emit.bp',
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
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblue01_emit.bp',
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblue01_emit.bp',
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
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblue01_emit.bp',
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblue01_emit.bp',
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

BlueLaserProjectileLong = Class(MultiPolyTrailProjectile) {

    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblueLong_emit.bp',
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/MobileLaserblueLong_emit.bp',
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

#------------------------------------------------------------------------
#  TERRAN Maser CANNON PROJECTILES
#------------------------------------------------------------------------
TLightMaserCannonProjectile = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_light_cannon_polytrail_01_emit.bp',
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_light_cannon_polytrail_01_emit.bp',
	},
	PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactProp = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactLand = EffectTemplate.TPlasmaCannonHeavyHit01,
}

TMediumMaserCannonProjectile = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_medium_cannon_polytrail_01_emit.bp',
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_medium_cannon_polytrail_01_emit.bp',
	},
	PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactProp = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactLand = EffectTemplate.TPlasmaCannonHeavyHit01,
}

TMediumMaserCannonProjectile2 = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_medium_cannon_polytrail_02_emit.bp',
    		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_medium_cannon_polytrail_02_emit.bp',
	},
	PolyTrailOffset = {0,0},
    FxImpactUnit = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactProp = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactLand = EffectTemplate.TPlasmaCannonHeavyHit01,
}

THeavyMaserCannonProjectile2 = Class(MultiPolyTrailProjectile) {
    PolyTrails = {
		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_heavy_cannon_polytrail_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/effects/Emitters/maser_heavy_cannon_polytrail_01_emit.bp',
	},
    PolyTrailOffset = {0,0}, 

    FxTrails = 
	{
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_02_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_03_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrail_04_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrails_01_emit.bp',
		'/mods/Future Battlefield Pack New Techs/Effects/Emitters/maser_heavy_cannon_fxtrails_02_emit.bp',
	},
	FxTrailScale = 0.7,
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
   	FxTrailScale = 0.7,
    FxImpactTrajectoryAligned = false,
    FxImpactUnit = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactProp = EffectTemplate.TPlasmaCannonHeavyHitUnit01,
    FxImpactLand = EffectTemplate.TPlasmaCannonHeavyHit01,
    FxImpactUnderWater = {},
}

