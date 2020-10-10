#****************************************************************************
#**
#**  File     :  /data/projectiles/TDFFragmentationGrenade01/TDFFragmentationGrenade01_script.lua
#**  Author(s):  Matt Vainio
#**
#**  Summary  :  UEF Fragmentation Shells, DEL0204
#**
#**  Copyright � 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local TFreezerGrenade = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTProjectiles.lua').TFreezerGrenade
local EffectTemplate = import('/lua/EffectTemplates.lua')

TDFFreezerGrenade01 = Class(TFreezerGrenade) {
}

TypeClass = TDFFreezerGrenade01