#
# Aeon laser 'bolt'
#
local DefaultProjectileFile = import('/lua/sim/defaultprojectiles.lua')
local SinglePolyTrailProjectile = DefaultProjectileFile.SinglePolyTrailProjectile
local EffectTemplate = import('/lua/EffectTemplates.lua')

local TurboLaserblueProjectile = Class(SinglePolyTrailProjectile) {

    FxTrails = {

    },
    PolyTrail = '/mods/Future Battlefield Pack/effects/Emitters/TurboLasergreen01_emit.bp',

    # Hit Effects
    FxImpactUnit = EffectTemplate.TRiotGunHitUnit01,
    FxImpactProp = EffectTemplate.TRiotGunHitUnit01,
    FxImpactLand = EffectTemplate.TRiotGunHit01,
    FxImpactAirUnit = EffectTemplate.FireCloudSml03,
    FxImpactNone = EffectTemplate.FireCloudSml03, 
    FxImpactWater = EffectTemplate.WaterSplash01,
    FxImpactUnderWater = {},
}

ADFLaserLight01 = Class(TurboLaserblueProjectile) {}

TypeClass = ADFLaserLight01