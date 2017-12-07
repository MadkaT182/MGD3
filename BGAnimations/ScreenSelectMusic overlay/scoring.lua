local t = Def.ActorFrame {};

-- --Song Info
-- t[#t+1] = Def.ActorFrame {
-- 	InitCommand=function(self) s = self:GetChildren(); end;
-- 	--Steps
-- 	LoadFont("Combo numbers")..{
-- 		Name="Data";
-- 		InitCommand=cmd(zoom,.38;addy,-15);
-- 	};
-- 	--Possible
-- 	LoadFont("Combo numbers")..{
-- 		Name="Possible";
-- 		InitCommand=cmd(zoom,.38;addy,12);
-- 	};

-- 	SetCommand=function(self)
-- 		local song = GAMESTATE:GetCurrentSong();
-- 		if song then
-- 			--Song
-- 			steps = GAMESTATE:GetCurrentSteps(PLAYER_1);
-- 			if song and steps ~=nil then
-- 				local GetRadar = steps:GetRadarValues(PLAYER_1);

-- 				--HighScore Data
-- 				local profile, scorelist;
-- 				if PROFILEMAN:IsPersistentProfile(PLAYER_1) then
-- 					profile = PROFILEMAN:GetProfile(PLAYER_1);
-- 				else
-- 					profile = PROFILEMAN:GetMachineProfile();
-- 				end

-- 				scorelist = profile:GetHighScoreList(song, steps);

-- 				if scorelist then
-- 					local scores = scorelist:GetHighScores()[1];

-- 					if scores then
-- 						local radars = scores:GetRadarValues(PLAYER_1):GetValue('RadarCategory_TapsAndHolds');
-- 						s.Data:settext(radars);
-- 					else
-- 						s.Data:settext("");
-- 					end
-- 				end

-- 				--Possible steps
-- 				s.Possible:settext(GetRadar:GetValue('RadarCategory_TapsAndHolds'));
-- 			end;
-- 		else
-- 			--Not Song
-- 			s.Data:settext("");
-- 			s.Possible:settext("");
-- 		end;
-- 	end;

-- 	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
-- 	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
-- 	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
-- };

for player in ivalues( GAMESTATE:GetHumanPlayers() ) do
    t[#t+1] = Def.BitmapText{
        Font="Common normal",
        InitCommand=function(self) self:diffuse( Color.White ):Center() end,

        CurrentSongChangedMessageCommand=cmd(playcommand,   "Set"),
        CurrentCourseChangedMessageCommand=cmd(playcommand, "Set"),
        ["CurrentSteps" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=cmd(playcommand,"Set"),
        ["CurrentTrail" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=cmd(playcommand,"Set"),
    
        SetMessageCommand=function(self)
            self:settext("")
            
            local song = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse()) or GAMESTATE:GetCurrentSong()
            local steps = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(player)) or GAMESTATE:GetCurrentSteps(player)
            local profile = (PROFILEMAN:IsPersistentProfile(player) and PROFILEMAN:GetProfile(player)) or PROFILEMAN:GetMachineProfile()
            
            if song and steps then
                local score_list = profile:GetHighScoreList(song,steps)
                local scores = score_list:GetHighScores()
                local top_score = scores[1]

                if top_score then
                    local taps = top_score:GetRadarValues():GetValue("RadarCategory_TapsAndHolds")
                    SM(taps)
                    self:settext(taps)
                end
            end
        end,
    }
end

return t;