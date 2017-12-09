local af = Def.ActorFrame{
	PlayerJoinedMessageCommand=function(self, params) self:queuecommand("Init") end,
	PlayerUnjoinedMessageCommand=function(self, params) self:queuecommand("Init") end,

    CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end,
    CurrentCourseChangedMessageCommand=function(self) self:playcommand("Set") end,
}

for player in ivalues( {PLAYER_1, PLAYER_2} ) do

	af[#af+1] = Def.BitmapText{
		Name="Actual",
		Font="Combo numbers",
		InitCommand=function(self)
			self:visible( GAMESTATE:IsHumanPlayer(player) )
				:zoom( #GAMESTATE:GetHumanPlayers()==2 and 0.2 or 0.38 )
				:x( (#GAMESTATE:GetHumanPlayers()==2 and (player==PLAYER_1 and -30 or 30)) or 0  )
				:y(-15)
		end,

        ["CurrentSteps" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=function(self) self:playcommand("Set") end,
        ["CurrentTrail" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=function(self) self:playcommand("Set") end,

        SetMessageCommand=function(self)
            self:settext("")

            local song = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentCourse()) or GAMESTATE:GetCurrentSong()
            local steps = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(player)) or GAMESTATE:GetCurrentSteps(player)
            local profile = (PROFILEMAN:IsPersistentProfile(player) and PROFILEMAN:GetProfile(player)) or PROFILEMAN:GetMachineProfile()

            if song and steps and profile then
                local score_list = profile:GetHighScoreList(song,steps)
                local scores = score_list:GetHighScores()
                local top_score = scores[1]

                if top_score then
                    local taps = top_score:GetRadarValues():GetValue("RadarCategory_TapsAndHolds")
                    self:settext(taps)
                end
            end
        end,
    }

	af[#af+1] = Def.BitmapText{
		Name="Possible",
		Font="Combo numbers",
		InitCommand=function(self)
			self:visible( GAMESTATE:IsHumanPlayer(player) )
				:zoom( #GAMESTATE:GetHumanPlayers()==2 and 0.2 or 0.38 )
				:x( (#GAMESTATE:GetHumanPlayers()==2 and (player==PLAYER_1 and -30 or 30)) or 0  )
				:y(12)
		end,

        ["CurrentSteps" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=function(self) self:playcommand("Set") end,
        ["CurrentTrail" .. ToEnumShortString(player) .. "ChangedMessageCommand"]=function(self) self:playcommand("Set") end,

        SetMessageCommand=function(self)
            self:settext("")

            local steps = (GAMESTATE:IsCourseMode() and GAMESTATE:GetCurrentTrail(player)) or GAMESTATE:GetCurrentSteps(player)

            if steps then
  			  	local taps = steps:GetRadarValues(player):GetValue("RadarCategory_TapsAndHolds")
                self:settext(taps)
            end
        end,
    }
end

return af