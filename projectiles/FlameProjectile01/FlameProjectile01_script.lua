-- Flamethrower Projectile

local FlameProjectile01 = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTProjectiles.lua').Flamethrower02
local RandomFloat = import('/lua/utilities.lua').GetRandomFloat

Flamethrower = Class(FlameProjectile01) {
    OnImpact = function(self, TargetType, targetEntity)
		if TargetType != 'Water' then 
			local rotation = RandomFloat(0,2*math.pi)
			local size = RandomFloat(3.75,5.0)
	        
			CreateDecal(self:GetPosition(), rotation, 'scorch_001_albedo', '', 'Albedo', size, size, 150, 15, self:GetArmy())
		end	 
		FlameProjectile01.OnImpact( self, TargetType, targetEntity )
    end,
}

TypeClass = Flamethrower
