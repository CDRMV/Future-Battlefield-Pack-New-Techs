#****************************************************************************
#**
#**  File     :  /cdimage/units/UEL0111/UEL0111_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Mobile Missile Launcher Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local TLandUnit = import('/lua/terranunits.lua').TLandUnit
local WeaponsFile = import('/lua/terranweapons.lua')
local FBPNTWeaponFile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTweapons.lua')
local TMaserBeamWeapon = FBPNTWeaponFile.TMaserBeamWeapon
local TIFFragLauncherWeapon = WeaponsFile.TIFFragLauncherWeapon

UEL0214 = Class(TLandUnit) {

    Weapons = {
        MaserWeapon = Class(TMaserBeamWeapon) {
        },
		
		Grenade = Class(TIFFragLauncherWeapon) {},
		
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
    },  
}

TypeClass = UEL0214