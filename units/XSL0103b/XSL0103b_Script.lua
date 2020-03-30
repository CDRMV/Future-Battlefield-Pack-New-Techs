#****************************************************************************
#**
#**  File     :  /cdimage/units/XSL0103/XSL0103_script.lua
#**  Author(s):  John Comes, David Tomandl, Jessica St. Croix, Aaron Lundquist
#**
#**  Summary  :  Seraphim Mobile Light Artillery Script
#**
#**  Copyright © 2005 Gas Powered Games, Inc.  All rights reserved.
#****************************************************************************

local SHoverLandUnit = import('/lua/seraphimunits.lua').SHoverLandUnit
local SAALosaareAutoCannonWeapon = import('/lua/seraphimweapons.lua').SAALosaareAutoCannonWeapon

XSL0103b = Class(SHoverLandUnit) {
    Weapons = {
        MainGun = Class(SAALosaareAutoCannonWeapon) {}
    },
}

TypeClass = XSL0103b