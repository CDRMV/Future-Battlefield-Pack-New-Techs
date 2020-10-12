#
# Terran Gauss Cannon Projectile
#
local TDFGaussCannonProjectile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTprojectiles.lua').TDFGaussCannonProjectile
TDFGaussArtillery01 = Class(TDFGaussCannonProjectile) {
    
    OnCreate = function(self, inWater)
        TDFGaussCannonProjectile.OnCreate(self, inWater)
        if not inWater then
            self:SetDestroyOnWater(true)
        else
            self:ForkThread(self.DestroyOnWaterThread)
        end
    end,
    
    DestroyOnWaterThread = function(self)
        WaitSeconds(0.2)
        self:SetDestroyOnWater(true)
    end,
}
TypeClass = TDFGaussArtillery01

