#****************************************************************************
#**
#**  File     :  /cdimage/units/UEA0203/UEA0203_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix, Gordon Duclos
#**
#**  Summary  :  UEF Gunship Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local FBPNTWeaponFile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua')
local TDFRiotWeapon = WeaponsFile.TDFRiotWeapon
local TIFFragLauncherWeapon = WeaponsFile.TIFFragLauncherWeapon
local TSAMLauncher = WeaponsFile.TSAMLauncher
local TMiniBlueBeamWeapon = FBPNTWeaponFile.TMiniBlueBeamWeapon

UEA0110 = Class(TAirUnit) {

    Weapons = {
        Turret01 = Class(TDFRiotWeapon) {},
		Grenade = Class(TIFFragLauncherWeapon) {},
        Missile_Pod = Class(TSAMLauncher) {}, 
		BlueBeam = Class(TMiniBlueBeamWeapon) {},
    },
	
	OnStopBeingBuilt = function(self,builder,layer)
        TAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner', 'y', nil, 360, 0, 180))
        self.Trash:Add(CreateRotator(self, 'Spinner_L', 'y', nil, 360, 0, 180))
		self.Trash:Add(CreateRotator(self, 'Spinner_R', 'y', nil, 360, 0, 180))
			self.Effect2 = CreateAttachedEmitter(self,'Spinner',self:GetArmy(), '/effects/emitters/tt_water_hover01_01_emit.bp'):ScaleEmitter(0.5)
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'Spinner_L',self:GetArmy(), '/effects/emitters/tt_water_hover01_01_emit.bp'):ScaleEmitter(0.5)
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'Spinner_R',self:GetArmy(), '/effects/emitters/tt_water_hover01_01_emit.bp'):ScaleEmitter(0.5)
            self.Trash:Add(self.Effect2)
		ChangeState(self, self.IdleState)
    end,
}

TypeClass = UEA0110