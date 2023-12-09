-----------------------------------------------------------------
-- File     : /cdimage/lua/FBPNTProjectiles.lua
-- Author(s): CDRMV 
-- Summary  :
-- Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
-----------------------------------------------------------------

local WeaponFile = import('/lua/sim/DefaultWeapons.lua')
local FBPNTCollisionBeams = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTcollisionbeams.lua')
local BareBonesWeapon = WeaponFile.BareBonesWeapon
local DefaultBeamWeapon = WeaponFile.DefaultBeamWeapon
local DefaultProjectileWeapon = WeaponFile.DefaultProjectileWeapon
local EffectTemplate = import('/lua/EffectTemplates.lua')
local AtomicRayCollisionBeam = FBPNTCollisionBeams.AtomicRayCollisionBeam
local ReflectCollisionBeam = FBPNTCollisionBeams.ReflectCollisionBeam
local MiniBlueCollisionBeam = FBPNTCollisionBeams.MiniBlueCollisionBeam
local ElectricMaserCollisionBeam = FBPNTCollisionBeams.ElectricMaserCollisionBeam
local HeavyMaserCollisionBeam = FBPNTCollisionBeams.HeavyMaserCollisionBeam
local ExperimentalMaserCollisionBeam = FBPNTCollisionBeams.ExperimentalMaserCollisionBeam
local LightMaserCollisionBeam = FBPNTCollisionBeams.LightMaserCollisionBeam
local MaserCollisionBeam = FBPNTCollisionBeams.MaserCollisionBeam
local HyperMaserCollisionBeam = FBPNTCollisionBeams.HyperMaserCollisionBeam
local DualMaserCollisionBeam = FBPNTCollisionBeams.DualMaserCollisionBeam
local LightHyperMaserCollisionBeam = FBPNTCollisionBeams.LightHyperMaserCollisionBeam
local TLightningCollisionBeam = FBPNTCollisionBeams.TLightningCollisionBeam

TMiniBlueBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = MiniBlueCollisionBeam,
    FxMuzzleFlash = {'/mods/Future Battlefield Pack New Techs/effects/emitters/mini_blue_beam_muzzle_01_emit.bp'},
}

TLightningWeapon01 = Class(DefaultBeamWeapon) {
    BeamType = TLightningCollisionBeam,
    FxMuzzleFlash = {'/effects/emitters/cannon_muzzle_flash_01_emit.bp',},
}

TDFLaserArtWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {'/effects/emitters/flash_02_emit.bp' },
}

TDFLaserLightWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {'/effects/emitters/flash_02_emit.bp' },
    PolyTrail = {'/effects/emitters/aeon_laser_trail_01_emit.bp'},
}

TDFLaserTurboLightWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {'/effects/emitters/flash_02_emit.bp' },
}

TArtilleryAntiMatterProjectile = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {'/effects/emitters/antiair_muzzle_fire_02_emit.bp',},
}

TAtomicRayBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = AtomicRayCollisionBeam,
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        local army = self.unit:GetArmy()
        local bp = self:GetBlueprint()
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
            end
        end
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

TReflectBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = ReflectCollisionBeam,
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        local army = self.unit:GetArmy()
        local bp = self:GetBlueprint()
        for k, v in self.FxUpackingChargeEffects do
            for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
            end
        end
        DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
    end,
}

TElectricMaserBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = ElectricMaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

THyperMaserBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = HyperMaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

TLightHyperMaserBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = LightHyperMaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

TLightMaserBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = LightMaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

TMaserBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = MaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

TDualMaserBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = DualMaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

THeavyMaserBeamWeapon = Class(DefaultBeamWeapon) {
    BeamType = HeavyMaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

TDFHeavyMaserCannonWeapon = Class(DefaultProjectileWeapon) {
    FxMuzzleFlash = {'/mods/Future Battlefield Pack New Techs/effects/emitters/mini_blue_beam_muzzle_01_emit.bp'},
}

TExperimentalMaserCannonWeapon = Class(DefaultBeamWeapon) {
    BeamType = ExperimentalMaserCollisionBeam,
    FxMuzzleFlash = {},
    FxChargeMuzzleFlash = {},
    FxUpackingChargeEffects = {},
    FxUpackingChargeEffectScale = 1,

    PlayFxWeaponUnpackSequence = function( self )
        if not self.ContBeamOn then
            local army = self.unit:GetArmy()
            local bp = self:GetBlueprint()
            for k, v in self.FxUpackingChargeEffects do
                for ek, ev in bp.RackBones[self.CurrentRackSalvoNumber].MuzzleBones do
                    CreateAttachedEmitter(self.unit, ev, army, v):ScaleEmitter(self.FxUpackingChargeEffectScale)
                end
            end
            DefaultBeamWeapon.PlayFxWeaponUnpackSequence(self)
        end
    end,
}

