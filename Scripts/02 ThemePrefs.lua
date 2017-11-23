local function OptionNameString(str)
	return THEME:GetString('OptionNames',str)
end

local Prefs =
{
	SongOpt =
	{
		Default = false,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
	AltResult =
	{
		Default = false,
		Choices = { OptionNameString('Off'), OptionNameString('On') },
		Values = { false, true }
	},
}

ThemePrefs.InitAll(Prefs)