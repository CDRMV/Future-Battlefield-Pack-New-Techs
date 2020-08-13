#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0201/UES0201_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  Terran Destroyer Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TConstructionUnit = import('/lua/terranunits.lua').TConstructionUnit
local WeaponFile = import('/lua/terranweapons.lua')
local TAALinkedRailgun = WeaponFile.TAALinkedRailgun
local TDFGaussCannonWeapon = WeaponFile.TDFGaussCannonWeapon
local TANTorpedoAngler = WeaponFile.TANTorpedoAngler
local TIFSmartCharge = WeaponFile.TIFSmartCharge
local TIFArtilleryWeapon = import('/lua/terranweapons.lua').TIFArtilleryWeapon

UES0306 = Class(TConstructionUnit) {
    DestructionTicks = 200,

    Weapons = {
        FrontTurret01 = Class(TDFGaussCannonWeapon) {},
        BackTurret01 = Class(TDFGaussCannonWeapon) {},
        FrontTurret02 = Class(TAALinkedRailgun) {},
		Art = Class(TIFArtilleryWeapon) {},
        Torpedo01 = Class(TANTorpedoAngler) {},
        AntiTorpedo = Class(TIFSmartCharge) {},
    },
	
	OnStopBeingBuilt = function(self,builder,layer)
        TConstructionUnit.OnStopBeingBuilt(self,builder,layer)
		self:ForkThread(self.RadarThread)
    end,

    RadarThread = function(self)
        local spinner1 = CreateRotator(self, 'Spinner1', 'y', nil, 180, 0, 180)
		local spinner2 = CreateRotator(self, 'Spinner2', 'y', nil, 180, 0, 180)
        self.Trash:Add(spinner1)
		self.Trash:Add(spinner2)
        while true do
            WaitFor(spinner1)
            spinner1:SetTargetSpeed(90)
            WaitFor(spinner1)
            spinner1:SetTargetSpeed(-90)
			WaitFor(spinner2)
            spinner2:SetTargetSpeed(90)
            WaitFor(spinner2)
            spinner2:SetTargetSpeed(-90)
        end
    end,
}

TypeClass = UES0306