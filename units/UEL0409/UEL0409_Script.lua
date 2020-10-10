#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0303/UEL0303_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Siege Assault Bot Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TerranWeaponFile = import('/lua/terranweapons.lua')
local FBPNTWeaponFile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua')
local TWalkingLandUnit = import('/lua/terranunits.lua').TWalkingLandUnit
local TIFCruiseMissileUnpackingLauncher = TerranWeaponFile.TIFCruiseMissileUnpackingLauncher
local TDFGaussCannonWeapon = TerranWeaponFile.TDFGaussCannonWeapon
local TSAMLauncher = TerranWeaponFile.TSAMLauncher
local TDFHeavyPlasmaCannonWeapon = TerranWeaponFile.TDFHeavyPlasmaCannonWeapon
local TAAFlakArtilleryCannon = TerranWeaponFile.TAAFlakArtilleryCannon
local TAtomicRayBeamWeapon = FBPNTWeaponFile.TAtomicRayBeamWeapon
local THyperMaserBeamWeapon = FBPNTWeaponFile.THyperMaserBeamWeapon
local TLightHyperMaserBeamWeapon = FBPNTWeaponFile.TLightHyperMaserBeamWeapon

UEL0409 = Class(TWalkingLandUnit) {

    Weapons = {
        AntiAirMissiles = Class(TSAMLauncher) {},
		HeavyPlasma01 = Class(TDFHeavyPlasmaCannonWeapon) {},
		AAHGun = Class(TAAFlakArtilleryCannon) {
            PlayOnlyOneSoundCue = true,
        },	
		MissileWeapon = Class(TIFCruiseMissileUnpackingLauncher) 
        {
            FxMuzzleFlash = {'/effects/emitters/terran_mobile_missile_launch_01_emit.bp'},
            
            
            OnLostTarget = function(self)
                self:ForkThread( self.LostTargetThread )
            end,
            
            RackSalvoFiringState = State(TIFCruiseMissileUnpackingLauncher.RackSalvoFiringState) {
                OnLostTarget = function(self)
                    self:ForkThread( self.LostTargetThread )
                end,            
            },            

            LostTargetThread = function(self)
                while not self.unit:IsDead() and self.unit:IsUnitState('Busy') do
                    WaitSeconds(2)
                end

                if self.unit:IsDead() then
                    return
                end
                
                local bp = self:GetBlueprint()

                if bp.WeaponUnpacks then
                    ChangeState(self, self.WeaponPackingState)
                else
                    ChangeState(self, self.IdleState)
                end
            end,
        },
		FrontTurret01 = Class(TDFGaussCannonWeapon) {},
		FrontTurret02 = Class(TDFGaussCannonWeapon) {},
        AtomicRayWeapon = Class(TAtomicRayBeamWeapon){},
		HyperMaserWeapon = Class(THyperMaserBeamWeapon) {},
		LightHyperMaserWeapon = Class(TLightHyperMaserBeamWeapon) {},
		
		OnKilled = function(self)
            local wep1 = self:GetWeaponByLabel('HyperMaserWeapon')
            local bp1 = wep1:GetBlueprint()
            if bp1.Audio.BeamStop then
                wep1:PlaySound(bp1.Audio.BeamStop)
            end
            if bp1.Audio.BeamLoop and wep1.Beams[1].Beam then
                wep1.Beams[1].Beam:SetAmbientSound(nil, nil)
            end
            for k, v in wep1.Beams do
                v.Beam:Disable()
            end     
                  
            TWalkingLandUnit.OnKilled(self)
        end, 
		
		OnKilled = function(self)
            local wep1 = self:GetWeaponByLabel('LightHyperMaserWeapon')
            local bp1 = wep1:GetBlueprint()
            if bp1.Audio.BeamStop then
                wep1:PlaySound(bp1.Audio.BeamStop)
            end
            if bp1.Audio.BeamLoop and wep1.Beams[1].Beam then
                wep1.Beams[1].Beam:SetAmbientSound(nil, nil)
            end
            for k, v in wep1.Beams do
                v.Beam:Disable()
            end     
                  
            TWalkingLandUnit.OnKilled(self)
        end, 
    },
	
	OnStopBeingBuilt = function(self,builder,layer)
        TWalkingLandUnit.OnStopBeingBuilt(self,builder,layer)
        # If created with F2 on land, then play the transform anim.
        if(self:GetCurrentLayer() == 'Land') then
            self.AT1 = self:ForkThread(self.TransformThread, false)
        end
    end,

    OnLayerChange = function(self, new, old)
        TWalkingLandUnit.OnLayerChange(self, new, old)
        if( old != 'None' ) then
            if( self.AT1 ) then
                self.AT1:Destroy()
                self.AT1 = nil
            end
            local myBlueprint = self:GetBlueprint()
            if( new == 'Land' ) then
                self.AT1 = self:ForkThread(self.TransformThread, false)
            elseif( new == 'Water' ) then
                self.AT1 = self:ForkThread(self.TransformThread, true)
            end
        end
    end,

    TransformThread = function(self, land)
        if( not self.AnimManip ) then
            self.AnimManip = CreateAnimator(self)
        end
        local bp = self:GetBlueprint()
        local scale = bp.Display.UniformScale or 1

        if( land ) then
            # Change movement speed to the multiplier in blueprint
            self:SetSpeedMult(bp.Physics.LandSpeedMultiplier)
            self:SetImmobile(true)
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetRate(0.5)
            self.IsWaiting = true
            WaitFor(self.AnimManip)
            self:SetCollisionShape( 'Box', bp.CollisionOffsetX or 0,(bp.CollisionOffsetY + (bp.SizeY*1.0)) or 0,bp.CollisionOffsetZ or 0, bp.SizeX * scale, bp.SizeY * scale, bp.SizeZ * scale )
            self.IsWaiting = false
            self:SetImmobile(false)
            self.SwitchAnims = true
            self.Walking = true
            self.Trash:Add(self.AnimManip)
        else
            self:SetImmobile(true)
            # Revert speed to maximum speed
            self:SetSpeedMult(1)
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetAnimationFraction(1)
            self.AnimManip:SetRate(-0.5)
            self.IsWaiting = true
            WaitFor(self.AnimManip)
            self:SetCollisionShape( 'Box', bp.CollisionOffsetX or 0,(bp.CollisionOffsetY + (bp.SizeY * 0.5)) or 0,bp.CollisionOffsetZ or 0, bp.SizeX * scale, bp.SizeY * scale, bp.SizeZ * scale )
            self.IsWaiting = false
            self.AnimManip:Destroy()
            self.AnimManip = nil
            self:SetImmobile(false)
            self.Walking = false
        end
    end,
    
}

TypeClass = UEL0409