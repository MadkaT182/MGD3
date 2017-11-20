function GroupBanner(grouptit)

--Custom group banners
local GroupTable = {
	["The Seven Gates"] = true,
	["Cubed"] = true,
	["Happiness"] = true,
	["Relation"] = true,
	["Another Run"] = true,
	["Floridian Love Scene"] = true,
	["Freak Empire"] = true,
	["Rotterdom Nation 94.5"] = true,
	["Something Dreamy"] = true,
	["The Moon Breaks My Day"] = true
}

local GroupVal = GroupTable[grouptit] or "Fallback"
return GroupVal;

end;