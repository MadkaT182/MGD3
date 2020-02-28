function GetLives(player)
	local song = GAMESTATE:GetCurrentSong();
	local steps = GAMESTATE:GetCurrentSteps(player);
	local lives = 1;

	if song and steps ~=nil then
		local GetRadar = GAMESTATE:GetCurrentSteps(player):GetRadarValues(player);
		lives = math.floor(GetRadar:GetValue('RadarCategory_TapsAndHolds') * .02);
	end

	return lives;
end;