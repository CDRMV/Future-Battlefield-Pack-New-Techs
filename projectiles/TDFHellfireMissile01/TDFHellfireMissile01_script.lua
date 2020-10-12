#****************************************************************************
#**
#**  File     :  /data/projectiles/TDFFragmentationGrenade01/TDFFragmentationGrenade01_script.lua
#**  Author(s):  Matt Vainio
#**
#**  Summary  :  UEF Fragmentation Shells, DEL0204
#**
#**  Copyright © 2007 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************
local THellfireMissile = import('/mods/Future Battlefield Pack New Techs/lua/FBPNTprojectiles.lua').THellfireMissile
local EffectTemplate = import('/lua/EffectTemplates.lua')

TDFHellfireMissile01 = Class(THellfireMissile) {
}

TypeClass = TDFHellfireMissile01