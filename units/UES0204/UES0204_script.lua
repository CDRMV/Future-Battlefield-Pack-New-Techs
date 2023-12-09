#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0103/UES0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Frigate Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TMobileFactoryUnit = import('/lua/terranunits.lua').TMobileFactoryUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun
local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon

UES0204 = Class(TMobileFactoryUnit) {

    Weapons = {
	    MainGun = Class(TDFGaussCannonWeapon) {},
        AAGun = Class(TAALinkedRailgun) {},
		AAHGun = Class(TAAFlakArtilleryCannon) {},	
    },

	BuildAttachBone = 'Build',
	
	OnCreate = function(self)
        TMobileFactoryUnit.OnCreate(self)
		self:ForkThread(self.RadarThread)
        self.Trash:Add(CreateRotator(self, 'Spinner03', 'y', nil, 45, 0, 0))
        ChangeState(self, self.IdleState)
    end,

    OnStopBeingBuilt = function(self,builder,layer)
        TMobileFactoryUnit.OnStopBeingBuilt(self,builder,layer)
		self:ForkThread(self.RadarThread)
        self.Trash:Add(CreateRotator(self, 'Spinner03', 'y', nil, 45, 0, 0))
        ChangeState(self, self.IdleState)
    end,

    OnFailedToBuild = function(self)
        TMobileFactoryUnit.OnFailedToBuild(self)
        ChangeState(self, self.IdleState)
    end,

    IdleState = State {
        Main = function(self)
            self:DetachAll(self.BuildAttachBone)
            self:SetBusy(false)
        end,

        OnStartBuild = function(self, unitBuilding, order)
            TMobileFactoryUnit.OnStartBuild(self, unitBuilding, order)
            self.UnitBeingBuilt = unitBuilding
            ChangeState(self, self.BuildingState)
        end,
    },

    BuildingState = State {
        Main = function(self)
            local unitBuilding = self.UnitBeingBuilt
            self:SetBusy(true)
            local bone = self.BuildAttachBone
            self:DetachAll(bone)
            if not self.UnitBeingBuilt:IsDead() then
                unitBuilding:AttachBoneTo( 0, self, bone )
                if EntityCategoryContains( categories.ENGINEER + categories.uel0203 + categories.uel0203a + categories.uel0211 + categories.uel0212, unitBuilding ) then
                    unitBuilding:SetParentOffset( {0,0,0} )
                elseif EntityCategoryContains( categories.TECH2 - categories.ENGINEER, unitBuilding ) then
                    unitBuilding:SetParentOffset( {0,0,0} )
                elseif EntityCategoryContains( categories.uel0216, unitBuilding ) then
                    unitBuilding:SetParentOffset( {0,0,0} )
                else
                    unitBuilding:SetParentOffset( {0,0,0} )
                end
            end
            self.UnitDoneBeingBuilt = false
        end,

        OnStopBuild = function(self, unitBeingBuilt)
            TMobileFactoryUnit.OnStopBuild(self, unitBeingBuilt)
            ChangeState(self, self.FinishedBuildingState)
        end,
    },

    FinishedBuildingState = State {
        Main = function(self)
		    if( not self.AnimManip ) then
				self.AnimManip = CreateAnimator(self)
			end
			self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationFinishBuild)
            self.AnimManip:SetAnimationFraction(2)
            self.AnimManip:SetRate(0.2)
			self.IsWaiting = true
            self:SetBusy(true)
            local unitBuilding = self.UnitBeingBuilt
            unitBuilding:DetachFrom(true)
            self:DetachAll(self.BuildAttachBone)
            local worldPos = self:CalculateWorldPositionFromRelative({0, 0, -20})
            IssueMoveOffFactory({unitBuilding}, worldPos)
            self:SetBusy(false)
            ChangeState(self, self.IdleState)		
			self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationFinishBuild)
            self.AnimManip:SetAnimationFraction(2)
            self.AnimManip:SetRate(-0.2)
        end,
    },

    RadarThread = function(self)
        local spinner = CreateRotator(self, 'Spinner01', 'x', nil, 0, 90, -90)
        self.Trash:Add(spinner)
        while true do
            WaitFor(spinner)
            spinner:SetTargetSpeed(90)
            WaitFor(spinner)
            spinner:SetTargetSpeed(-90)
        end
    end,
}
TypeClass = UES0204