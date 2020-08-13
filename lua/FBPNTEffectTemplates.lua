----------------------------------------------------------------------
-- File     :  /data/lua/EffectTemplates.lua
-- Author(s):  Gordon Duclos, Greg Kohne, Matt Vainio, Aaron Lundquist
-- Summary  :  Generic templates for commonly used effects
-- Copyright © 2006 Gas Powered Games, Inc.  All rights reserved.
----------------------------------------------------------------------

EmtBpPath = '/effects/emitters/'
EmtBpPathAlt = '/mods/Future Battlefield Pack New Techs/effects/emitters/'
EmitterTempEmtBpPath = '/effects/emitters/temp/'

FlameThrowerHitLand01 = {
    EmtBpPathAlt .. 'flamerthrower_flash_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_thick_smoke_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_thin_smoke_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_01_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_02_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_03_emit.bp',
}

FlameThrowerHitWater01 = {
    EmtBpPathAlt .. 'flamerthrower_waterflash_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_water_smoke_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_oilslick_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_lines_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_water_ripples_emit.bp',
    EmtBpPathAlt .. 'flamerthrower_water_dots_emit.bp',    
}


#------------------------------------------------------------------------
#  TERRAN LIGHT MASER CANNON EMITTERS
#------------------------------------------------------------------------
TMaserCannonLightMuzzleFlash = {
    '/effects/emitters/plasma_cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/plasma_cannon_muzzle_flash_02_emit.bp',
    '/effects/emitters/cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/heavy_plasma_cannon_hitunit_05_emit.bp',
}
TMaserCannonLightHit02 = {
    EmtBpPath .. 'heavy_plasma_cannon_hit_01_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_02_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_03_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_04_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_05_emit.bp',
}
TMaserCannonLightHit03 = {
    EmtBpPath .. 'heavy_plasma_cannon_hit_05_emit.bp',
}
TMaserCannonLightHit04 = {
    EmtBpPath .. 'heavy_plasma_cannon_hitunit_05_emit.bp',
}
TMaserCannonLightHit01 = TableCat( TPlasmaCannonHeavyHit02, TPlasmaCannonHeavyHit03 )
TMaserCannonLightHitUnit01 = TableCat( TPlasmaCannonHeavyHit02, TPlasmaCannonHeavyHit04, UnitHitShrapnel01 )

TMaserCannonLightMunition = {
    EmtBpPathAlt .. 'maser_light_cannon_trail_02_emit.bp',
}
TMaserCannonLightMunition02 = {
    EmtBpPathAlt .. 'maser_light_cannon_trail_03_emit.bp',
}
TMaserCannonLightPolyTrails = {
    EmtBpPathAlt .. 'maser_light_cannon_polytrail_01_emit.bp',
}

#------------------------------------------------------------------------
#  TERRAN Medium MASER CANNON EMITTERS
#------------------------------------------------------------------------
TMaserCannonMediumMuzzleFlash = {
    '/effects/emitters/plasma_cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/plasma_cannon_muzzle_flash_02_emit.bp',
    '/effects/emitters/cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/heavy_plasma_cannon_hitunit_05_emit.bp',
}
TMaserCannonMediumHit02 = {
    EmtBpPath .. 'heavy_plasma_cannon_hit_01_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_02_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_03_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_04_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_05_emit.bp',
}
TMaserCannonMediumHit03 = {
    EmtBpPath .. 'heavy_plasma_cannon_hit_05_emit.bp',
}
TMaserCannonMediumHit04 = {
    EmtBpPath .. 'heavy_plasma_cannon_hitunit_05_emit.bp',
}
TMaserCannonMediumHit01 = TableCat( TPlasmaCannonHeavyHit02, TPlasmaCannonHeavyHit03 )
TMaserCannonMediumHitUnit01 = TableCat( TPlasmaCannonHeavyHit02, TPlasmaCannonHeavyHit04, UnitHitShrapnel01 )

TMaserCannonMediumMunition = {
    EmtBpPathAlt .. 'maser_medium_cannon_trail_02_emit.bp',
}
TMaserCannonMediumMunition02 = {
    EmtBpPathAlt .. 'maser_medium_cannon_trail_03_emit.bp',
}
TMaserCannonMediumPolyTrails = {
    EmtBpPathAlt .. 'maser_medium_cannon_polytrail_01_emit.bp',
}
TMaserCannonMediumPolyTrails2 = {
    EmtBpPathAlt .. 'maser_medium_cannon_polytrail_02_emit.bp',
}

#------------------------------------------------------------------------
#  TERRAN Heavy Maser EMITTERS
#------------------------------------------------------------------------

TMaserCannonHeavyMuzzleFlash = {
    '/effects/emitters/plasma_cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/plasma_cannon_muzzle_flash_02_emit.bp',
    '/effects/emitters/cannon_muzzle_flash_01_emit.bp',
    '/effects/emitters/heavy_plasma_cannon_hitunit_05_emit.bp',
}
TMaserCannonHeavyHit02 = {
    EmtBpPath .. 'heavy_plasma_cannon_hit_01_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_02_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_03_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_04_emit.bp',
    EmtBpPath .. 'heavy_plasma_cannon_hit_05_emit.bp',
}
TMaserCannonHeavyHit03 = {
    EmtBpPath .. 'heavy_plasma_cannon_hit_05_emit.bp',
}
TMaserCannonHeavyHit04 = {
    EmtBpPath .. 'heavy_plasma_cannon_hitunit_05_emit.bp',
}
TMaserCannonHeavyHit01 = TableCat( TPlasmaCannonHeavyHit02, TPlasmaCannonHeavyHit03 )
TMaserCannonHeavyHitUnit01 = TableCat( TPlasmaCannonHeavyHit02, TPlasmaCannonHeavyHit04, UnitHitShrapnel01 )

TMaserCannonHeavyFxTrails = {
    EmtBpPathAlt .. 'maser_heavy_cannon_fxtrail_02_emit.bp',
}

TMaserCannonHeavyPolyTrails1 = {
    EmtBpPathAlt .. 'maser_heavy_cannon_trail_01_emit.bp',
}
TMaserCannonHeavyPolyTrails2 = {
    EmtBpPathAlt .. 'maser_heavy_cannon_polytrail_01_emit.bp',
}

TMaserCannonHeavyFxTrails2 = {
	 EmtBpPathAlt .. 'maser_heavy_cannon_munition_02_emit.bp',
	 EmtBpPathAlt .. 'maser_heavy_cannon_fxtrail_01_emit.bp',
     EmtBpPathAlt .. 'maser_heavy_cannon_munition_01_emit.bp',
	 
	EmtBpPathAlt .. 'maser_heavy_cannon_fxtrails_01_emit.bp',
    EmtBpPathAlt .. 'maser_heavy_cannon_fxtrails_02_emit.bp',
    EmtBpPathAlt .. 'maser_heavy_cannon_fxtrail_03_emit.bp',	##after cloud
    EmtBpPathAlt .. 'maser_heavy_cannon_fxtrail_04_emit.bp',	##after cloud
}



