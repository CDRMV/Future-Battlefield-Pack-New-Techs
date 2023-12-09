#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0103/UES0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Frigate Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TAirUnit = import('/lua/terranunits.lua').TAirUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun
local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local Entity = import('/lua/sim/Entity.lua').Entity
local EffectTemplate = import('/lua/effecttemplates.lua')

UES0307b = Class(TAirUnit) {

    Weapons = {
        MainGun = Class(TDFGaussCannonWeapon) {
        },
        AAGun = Class(TAALinkedRailgun) {
        },
		AAHGun = Class(TAAFlakArtilleryCannon) {
            PlayOnlyOneSoundCue = true,
        },	
    },

    OnStopBeingBuilt = function(self,builder,layer)
        TAirUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner1', 'y', nil, 360, 0, 180))
        self.Trash:Add(CreateRotator(self, 'L_Propeller1', 'y', nil, 360, 0, 180))
		self.Trash:Add(CreateRotator(self, 'L_Propeller2', 'y', nil, 360, 0, 180))
		self.Trash:Add(CreateRotator(self, 'R_Propeller1', 'y', nil, 360, 0, 180))
		self.Trash:Add(CreateRotator(self, 'R_Propeller2', 'y', nil, 360, 0, 180))
        self.RadarEnt = Entity {}
        self.Trash:Add(self.RadarEnt)
        self.RadarEnt:InitIntel(self:GetArmy(), 'Radar', self:GetBlueprint().Intel.RadarRadius or 75)
        self.RadarEnt:EnableIntel('Radar')
        self.RadarEnt:AttachBoneTo(-1, self, 0)
			self.Effect2 = CreateAttachedEmitter(self,'L_Propeller_Exhaust1',self:GetArmy(), '/effects/emitters/tt_water_hover01_01_emit.bp')
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'L_Propeller_Exhaust2',self:GetArmy(), '/effects/emitters/tt_water_hover01_01_emit.bp')
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'R_Propeller_Exhaust1',self:GetArmy(), '/effects/emitters/tt_water_hover01_01_emit.bp')
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'R_Propeller_Exhaust2',self:GetArmy(), '/effects/emitters/tt_water_hover01_01_emit.bp')
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'L_Propeller_Exhaust3',self:GetArmy(), '/effects/emitters/dirty_exhaust_smoke_01_emit.bp')
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'L_Propeller_Exhaust4',self:GetArmy(), '/effects/emitters/dirty_exhaust_smoke_01_emit.bp')
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'R_Propeller_Exhaust3',self:GetArmy(), '/effects/emitters/dirty_exhaust_smoke_01_emit.bp')
            self.Trash:Add(self.Effect2)
			self.Effect2 = CreateAttachedEmitter(self,'R_Propeller_Exhaust4',self:GetArmy(), '/effects/emitters/dirty_exhaust_smoke_01_emit.bp')
            self.Trash:Add(self.Effect2)
		ChangeState(self, self.IdleState)
    end,
	
	BuildAttachBone = 'UES0103',

    OnFailedToBuild = function(self)
        TAirUnit.OnFailedToBuild(self)
        ChangeState(self, self.IdleState)
    end,

    IdleState = State {
        Main = function(self)
            self:DetachAll(self.BuildAttachBone)
            self:SetBusy(false)
        end,

        OnStartBuild = function(self, unitBuilding, order)
            TAirUnit.OnStartBuild(self, unitBuilding, order)
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
            unitBuilding:HideBone(0, true)
            self.UnitDoneBeingBuilt = false
        end,

        OnStopBuild = function(self, unitBeingBuilt)
            TAirUnit.OnStopBuild(self, unitBeingBuilt)
            ChangeState(self, self.FinishedBuildingState)
        end,
    },

    FinishedBuildingState = State {
        Main = function(self)
            self:SetBusy(true)
            local unitBuilding = self.UnitBeingBuilt
            unitBuilding:DetachFrom(true)
            self:DetachAll(self.BuildAttachBone)
            if self:TransportHasAvailableStorage() then
                self:AddUnitToStorage(unitBuilding)
            else
                local worldPos = self:CalculateWorldPositionFromRelative({0, 0, -20})
                IssueMoveOffFactory({unitBuilding}, worldPos)
                unitBuilding:ShowBone(0,true)
            end
            self:SetBusy(false)
            self:RequestRefreshUI()
            ChangeState(self, self.IdleState)
        end,
    },
	
	OnCreate = function(self, builder, layer)
        TAirUnit. OnCreate(self,builder,layer)
		self.AnimManip = CreateAnimator(self)
        self.AnimManip:SetPrecedence(0)
        self.Trash:Add(self.AnimManip)
        self.AnimManip:PlayAnim(self:GetBlueprint().Display.AnimationXformFly, false):SetRate(0.5)
        ### Create the takeoff special effects
        self.FxGroundEffect = EffectTemplate.CDisruptorGroundEffect       
 	    for k, v in self.FxGroundEffect do
            CreateAttachedEmitter(self, 'L_Propeller1', self:GetArmy(), v):ScaleEmitter(0.25)
			CreateAttachedEmitter(self, 'L_Propeller2', self:GetArmy(), v):ScaleEmitter(0.25)
			CreateAttachedEmitter(self, 'R_Propeller1', self:GetArmy(), v):ScaleEmitter(0.25)
			CreateAttachedEmitter(self, 'R_Propeller2', self:GetArmy(), v):ScaleEmitter(0.25)
        end             
    end,                          
	
	OnDamage = function(self, instigator, amount, vector, damagetype)
        local damageReduction = 8
        amount = math.ceil(amount * damageReduction)
        TAirUnit.OnDamage(self, instigator, amount, vector, damagetype)
    end,
    
    ReceiveKills = function(self, unitKills)
        if not self:IsDead() then
            self.AddKills(self, unitKills) 
        end   
    end,    		
}

TypeClass = UES0307b