#****************************************************************************
#**
#**  File     :  /cdimage/units/UES0103/UES0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix
#**
#**  Summary  :  UEF Frigate Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TSeaUnit = import('/lua/terranunits.lua').TSeaUnit
local TAALinkedRailgun = import('/lua/terranweapons.lua').TAALinkedRailgun
local TAAFlakArtilleryCannon = import('/lua/terranweapons.lua').TAAFlakArtilleryCannon
local TDFGaussCannonWeapon = import('/lua/terranweapons.lua').TDFGaussCannonWeapon
local Entity = import('/lua/sim/Entity.lua').Entity

UES0307a = Class(TSeaUnit) {

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
        TSeaUnit.OnStopBeingBuilt(self,builder,layer)
        self.Trash:Add(CreateRotator(self, 'Spinner1', 'y', nil, 360, 0, 180))
        self.RadarEnt = Entity {}
        self.Trash:Add(self.RadarEnt)
        self.RadarEnt:InitIntel(self:GetArmy(), 'Radar', self:GetBlueprint().Intel.RadarRadius or 75)
        self.RadarEnt:EnableIntel('Radar')
        self.RadarEnt:AttachBoneTo(-1, self, 0)
		ChangeState(self, self.IdleState)
    end,
	
	BuildAttachBone = 'UES0103',

    OnFailedToBuild = function(self)
        TSeaUnit.OnFailedToBuild(self)
        ChangeState(self, self.IdleState)
    end,

    IdleState = State {
        Main = function(self)
            self:DetachAll(self.BuildAttachBone)
            self:SetBusy(false)
        end,

        OnStartBuild = function(self, unitBuilding, order)
            TSeaUnit.OnStartBuild(self, unitBuilding, order)
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
            TSeaUnit.OnStopBuild(self, unitBeingBuilt)
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
        TSeaUnit. OnCreate(self,builder,layer)
        self.MotionStatus = nil
    end,     
        
    OnScriptBitSet = function(self, bit)
        TSeaUnit.OnScriptBitSet(self, bit)
        if bit == 1 then    	    
    	    self:ForkThread(self.SpawnHeliCarrierAir)    	    
    	end
    end,
    
    ReceiveKills = function(self, unitKills)
        if not self:IsDead() then
            self.AddKills(self, unitKills) 
        end   
    end,  
    
    OnMotionHorzEventChange = function(self, new, old) 
        TSeaUnit.OnMotionHorzEventChange(self, new, old)     
        if not self:IsDead() and new != old then
            self.MotionStatus = new
        end                
    end,      
    
    SpawnHeliCarrierAir = function(self)
       if not self:IsDead() then  
                
           ### Disables user control and weapons 
           self:SetUnSelectable(false) 
           self:SetWeaponEnabledByLabel('ArmCannonTurret', false)
           
           ### Removes the toggle after activation 
           self:RemoveToggleCap('RULEUTC_WeaponToggle')                                 
           
           ### Removes all commands
           IssueClearCommands({self}) 
           
           ### Forces the land bot to stop
           IssueStop({self})
           
           ### Waits for the bot to come to a complete stop before transforming
           while not self:IsDead() and self.MotionStatus != 'Stopped' and self.MotionStatus != nil  do          
               WaitSeconds(0.1)
           end                    
                                
           ### Spawns the flying bot                  
           local myOrientation = self:GetOrientation()
           local location = self:GetPosition()
           local health = self:GetHealth()
           local unitKills = self:GetStat('KILLS', 0).Value        
           local flyingBot = CreateUnit('UES0307b', self:GetArmy(), location[1], location[2], location[3], myOrientation[1], myOrientation[2], myOrientation[3], myOrientation[4], 'Air')
           
           ### Update Stats and veterancy
           if unitKills > 0 then
               flyingBot.ReceiveKills(flyingBot, unitKills) 
           end  
           flyingBot:SetHealth(self,health)                
                    
           ### Remove the old unit
           flyingBot = nil
           self:Destroy()
       end
   end, 
}

TypeClass = UES0307a