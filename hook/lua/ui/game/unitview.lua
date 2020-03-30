local version = tonumber( (string.gsub(string.gsub(GetVersion(), '1.5.', ''), '1.6.', '')) )

if version < 3652 then -- All versions below 3652 don't have buildin global icon support, so we need to insert the icons by our own function
	LOG('Future Battlefield Pack New Techs: [unitview.lua '..debug.getinfo(1).currentline..'] - Gameversion is older then 3652. Hooking "UpdateWindow" to add our own unit icons')

local MyUnitIdTable = {
   ues0101=true, -- Redima Class - (Torpedo Boat)
   ues0209=true, -- Taragrey Class - (Medium Artilleryship)
   ues0208=true, -- Execter Class - (Heavy Cruiser)
   uel0213=true, -- Metal Omega - (Hover Artillery Tank)
   ues0100=true, -- Norway Class - (Corvette)
   uel0300=true, -- Vesker Mark III - (Heavy Laser Assault Bot)
   uel0217=true, -- Iron MKIII - (Heavy Hover Attack Tank)
   uel0207=true, -- Vesker Mark II - (Medium Laser Assault Bot)
   uel0103b=true, -- TML MK1 Samy - (Light Mobile Missile Launcher)
   uel0112=true, -- Vesker - (Light Laser Assault Bot)
   uel0211=true, -- Iron MK1 - (Light Hover Attack Tank)
   uel0209=true, -- SWM 20 Marksman - (Walker)
   urs0204=true, -- Tronic Class - (Attack Ship)
   urs0102=true, -- Metallonic Class - (Destroyer)
   uel0216=true, -- Iron MKII - (Medium Hover Attack Tank)
   uea0303b=true, -- Jeager - (Multi-Role Fighter)
   uel0212=true, -- Punisher - (Hover Gatling Tank)
   uel0110=true, -- SW 100 Prequest - (Walker)
}

	local IconPath = "/Mods/Future Battlefield Pack New Techs"

	local oldUpdateWindow = UpdateWindow
	function UpdateWindow(info)
		oldUpdateWindow(info)
		if MyUnitIdTable[info.blueprintId] then
			controls.icon:SetTexture(IconPath .. '/icons/units/' .. info.blueprintId .. '_icon.dds')
		end
	end

else
	LOG('Future Battlefield Pack: [unitview.lua '..debug.getinfo(1).currentline..'] - Gameversion is 3652 or newer. No need to insert the unit icons by our own function.')
end -- All versions below 3652 don't have buildin global icon support, so we need to insert the icons by our own function