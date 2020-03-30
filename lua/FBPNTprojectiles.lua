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

