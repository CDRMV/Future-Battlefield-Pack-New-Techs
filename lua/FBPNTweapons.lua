-----------------------------------------------------------------
-- File     : /cdimage/lua/FBPNTProjectiles.lua
-- Author(s): CDRMV 
-- Summary  :
-- Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local WeaponFile = import('/lua/sim/DefaultWeapons.lua')
local BareBonesWeapon = WeaponFile.BareBonesWeapon
local DefaultProjectileWeapon = WeaponFile.DefaultProjectileWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')

TDFLightMaserCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
}

TDFMediumMaserCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
}

TDFMediumMaserCannonWeapon2 = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
}

TDFHeavyMaserCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
}

TDFHeavyMaserCannonWeapon2 = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = EffectTemplate.TPlasmaGatlingCannonMuzzleFlash,
}

