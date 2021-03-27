function GetLives(player)
	local song = GAMESTATE:GetCurrentSong();
	local steps = GAMESTATE:GetCurrentSteps(player);
	local lives = 1;

	if song and steps ~=nil then
		-- Insane
		if steps:GetDifficulty() == "Difficulty_Challenge" then
			lives = 70;
		end;
		-- Nonstop
		if steps:GetDescription() == 'Nonstop' then
			lives = 5;
		end;
		if lives == 1 then
			local GetRadar = steps:GetRadarValues(player);
			local calc = GetRadar:GetValue('RadarCategory_TapsAndHolds') * .02;
			lives = math.ceil( calc / 5 ) * 5;
			if lives <= 5 then
				lives = 10;
			end;
			if lives >= 65 then
				lives = 60;
			end;
		end;
	end;

	return lives;
end;