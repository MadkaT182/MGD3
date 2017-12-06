local t = Def.ActorFrame {};

--Song Info
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self) s = self:GetChildren(); end;
	--Steps
	LoadFont("Combo numbers")..{
		Name="Data";
		InitCommand=cmd(zoom,.38;addy,-15);
	};
	--Possible
	LoadFont("Combo numbers")..{
		Name="Possible";
		InitCommand=cmd(zoom,.38;addy,12);
	};

	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			--Song
			steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
			if song and steps ~=nil then
				local GetRadar = steps:GetRadarValues(PLAYER_1);
				--HighScore Data
				local hsData = PROFILEMAN:GetProfile(PLAYER_1):GetHighScoreList(song, steps):GetHighScores();
				local gScore = hsData[1];
				if gScore then
					s.Data:settext(gScore:GetRadarValues(PLAYER_1):GetValue('RadarCategory_TapsAndHolds'));
				else
					s.Data:settext("");
				end
				--Possible steps
				s.Possible:settext(GetRadar:GetValue('RadarCategory_TapsAndHolds'));
			end;
		else
			--Not Song
			s.Data:settext("");
			s.Possible:settext("");
		end;
	end;

	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
};

return t;