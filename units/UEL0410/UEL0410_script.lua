#****************************************************************************
#**
#**  File     :  /data/units/XEL0306/XEL0306_script.lua
#**  Author(s):  Jessica St. Croix, Dru Staltman
#**
#**  Summary  :  UEF Mobile Missile Platform Script
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local TDFHiroPlasmaCannon = WeaponsFile.TDFHiroPlasmaCannon
local TIFFragLauncherWeapon = WeaponsFile.TIFFragLauncherWeapon
local FBPNTWeaponFile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua')
local TElectricMaserBeamWeapon = FBPNTWeaponFile.TElectricMaserBeamWeapon
local TExperimentalMaserCannonWeapon = FBPNTWeaponFile.TExperimentalMaserCannonWeapon
local TMaserBeamWeapon = FBPNTWeaponFile.TMaserBeamWeapon
local TLightMaserBeamWeapon = FBPNTWeaponFile.TLightMaserBeamWeapon
local TDualMaserBeamWeapon = FBPNTWeaponFile.TDualMaserBeamWeapon

UEL0410 = Class(TLandUnit) {
    Weapons = {
		ElectricMaserWeapon = Class(TElectricMaserBeamWeapon) {
        },
		
		ExperimentalMaserWeapon = Class(TExperimentalMaserCannonWeapon) {
        },
		
		DualMaserWeapon = Class(TDualMaserBeamWeapon) {
        },
		
        MaserWeapon = Class(TMaserBeamWeapon) {
        },
		
		LightMaserWeapon = Class(TLightMaserBeamWeapon) {
        },
		
		Grenade = Class(TIFFragLauncherWeapon) {},
		
		OnKilled = function(self)
            local wep1 = self:GetWeaponByLabel('LightMaserWeapon')
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
                  
            TLandUnit.OnKilled(self)
        end,  
		
		OnKilled = function(self)
            local wep1 = self:GetWeaponByLabel('DualMaserWeapon')
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
                  
            TLandUnit.OnKilled(self)
        end,  
		
		OnKilled = function(self)
            local wep1 = self:GetWeaponByLabel('MaserWeapon')
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
                  
            TLandUnit.OnKilled(self)
        end,  

		OnKilled = function(self)
            local wep1 = self:GetWeaponByLabel('ElectricMaserWeapon')
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
                  
            TLandUnit.OnKilled(self)
        end,  

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
                  
            TLandUnit.OnKilled(self)
        end, 		
    },  

}

TypeClass = UEL0410