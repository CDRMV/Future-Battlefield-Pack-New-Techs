#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0103/UES0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Frigate Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TConstructionUnit = import('/lua/terranunits.lua').TConstructionUnit
local CSeaUnit = import('/lua/cybranunits.lua').CSeaUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local Entity = import('/lua/sim/Entity.lua').Entity

UES0012 = Class(TConstructionUnit, CSeaUnit) {

	IsWaiting = false,

    Weapons = {
        AAGun = Class(TAALinkedRailgun) {
        },
		MainGun = Class(TDFGaussCannonWeapon) {
        },
    },	
	
	OnStopBeingBuilt = function(self,builder,layer)
        TConstructionUnit.OnStopBeingBuilt(self,builder,layer)
        LOG('*ATTACHING UNITS TO TRANS!!')
        local position = self:GetPosition()
		
		self.Station02 = CreateUnitHPR('uel0201', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station02:AttachBoneTo(0, self, 'Attachpoint02')
		self.Station03 = CreateUnitHPR('uel0201', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station03:AttachBoneTo(0, self, 'Attachpoint03')
		self.Station04 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station04:AttachBoneTo(0, self, 'Attachpoint04')
		self.Station05 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station05:AttachBoneTo(0, self, 'Attachpoint05')
		self.Station06 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station06:AttachBoneTo(0, self, 'Attachpoint06')
		self.Station07 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station07:AttachBoneTo(0, self, 'Attachpoint07')
		self.Station08 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station08:AttachBoneTo(0, self, 'Attachpoint08')
		self.Station09 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station09:AttachBoneTo(0, self, 'Attachpoint09')
		self.Station10 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station10:AttachBoneTo(0, self, 'Attachpoint10')
		self.Station11 = CreateUnitHPR('uel0106', self:GetArmy(), position.x, position.y, position.z, 0, 0, 0)
		self.Station11:AttachBoneTo(0, self, 'Attachpoint11')
		TConstructionUnit.OnStopBeingBuilt(self,builder,layer)
    end,
	
    OnLayerChange = function(self, new, old)
        CSeaUnit.OnLayerChange(self, new, old)
        if( old != 'None' ) then
            if( self.AT1 ) then
                self.AT1:Destroy()
                self.AT1 = nil
            end
            local myBlueprint = self:GetBlueprint()
            if( new == 'Land' ) then
                self.AT1 = self:ForkThread(self.TransformThread, true)
            elseif( new == 'Water' ) then
                self.AT1 = self:ForkThread(self.TransformThread, false)
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
            self.AnimManip:SetRate(2)
            self.IsWaiting = true
            WaitFor(self.AnimManip)
            self:SetCollisionShape( 'Box', bp.CollisionOffsetX or 0,(bp.CollisionOffsetY + (bp.SizeY*1.0)) or 0,bp.CollisionOffsetZ or 0, bp.SizeX * scale, bp.SizeY * scale, bp.SizeZ * scale )
            self.IsWaiting = false
            self:SetImmobile(false)
            self.SwitchAnims = true
            self.Walking = true
            self.Trash:Add(self.AnimManip)
            self:RemoveCommandCap('RULEUCC_Move')
			self:RemoveCommandCap('RULEUCC_Patrol')
			self:RemoveCommandCap('RULEUCC_Guard')
        else
            self:SetImmobile(true)
            # Revert speed to maximum speed
            self:SetSpeedMult(1)
            self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationTransform)
            self.AnimManip:SetAnimationFraction(1)
            self.AnimManip:SetRate(-2)
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

TypeClass = UES0012