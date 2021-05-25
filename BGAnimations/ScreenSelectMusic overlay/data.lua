local t = Def.ActorFrame {};

local function DifficultyIcons(pn)
	local function set(self, player)
		if player and player ~= pn then return end
		local Selection = GAMESTATE:GetCurrentSteps(pn) or GAMESTATE:GetCurrentTrail(pn)

		if not Selection then
			self:Unset();
			return
		end
		local dc = Selection:GetDifficulty()
		self:SetFromDifficulty( dc );
	end

	local t = Def.DifficultyIcon {
		File="diff 1x6";
		InitCommand=function(self)
			self:player( pn );
			self:SetPlayer( pn );
		end;

		CurrentStepsP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentStepsP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
		CurrentTrailP1ChangedMessageCommand=function(self) set(self, PLAYER_1); end;
		CurrentTrailP2ChangedMessageCommand=function(self) set(self, PLAYER_2); end;
	};
	return t;
end

--Song Info
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self) cs = self:GetChildren(); end;
	--Title
	LoadFont("MusicList titles")..{
		Name="Title";
		InitCommand=function(self) self:horizalign(left):zoom(0.82):x(-134):y(2) end;
	};
	--Artist
	LoadFont("MusicList titles")..{
		Name="Artist";
		InitCommand=function(self) self:horizalign(left):zoom(0.82):x(-134):y(24) end;
	};
	--Time
	LoadFont("ScreenSelectMusic total time")..{
		Name="Time";
		InitCommand=function(self) self:horizalign(center):y(88):x(69) end;
	};

	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			--Song
			local title;
			if song:GetDisplaySubTitle() == "" then
				title = song:GetDisplayMainTitle();
			else
				title = song:GetDisplayFullTitle();
			end;
			cs.Title:maxwidth(325);
			cs.Title:settext(title);

			local artist = song:GetDisplayArtist();
			cs.Artist:maxwidth(325);
			cs.Artist:settext(artist);

			local seconds = song:MusicLengthSeconds();
			cs.Time:settext(SecondsToMMSSMsMs(seconds));
			cs.Artist:diffusealpha(1);
			cs.Time:diffusealpha(1);

			--Insane
			local insane = song:HasStepsTypeAndDifficulty(0,4);
			if insane then
				cs.Title:diffuse(Color("Red"));
			else
				cs.Title:diffuse(Color("White"));
			end;

		else
			--Not Song
			cs.Title:settext("No Song Selected");
			cs.Title:diffuse(Color("White"));
			cs.Artist:diffusealpha(0);
			cs.Time:diffusealpha(0);
		end;
	end;
	--BPM
	Def.BPMDisplay {
		File=THEME:GetPathF("BPM", "Display");
		Name="BPMDisplay";
		InitCommand=function(self) self:x(5):y(133):horizalign(left):zoom(0.62):maxwidth(210) end;-- LEFT
		SetCommand=function(self) self:SetFromGameState() end;
	};

	-- difficulty icons
	DifficultyIcons(PLAYER_1) .. {
		BeginCommand=function(self) self:x(76):y(-52):zoom(0.8) end;
		SetCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then self:visible(false)
			else self:visible(true)
			end
		end;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
	};
	DifficultyIcons(PLAYER_2) .. {
		BeginCommand=function(self) self:x(172):y(-52):zoom(0.8) end;
		SetCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then self:visible(false);
			else self:visible(true);
			end
		end;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
	};

--Panel Values
	LoadFont("Panedisplay Text")..{
		InitCommand=function(self) self:zoom(0.36):horizalign(right):y(70):x(-11) end;
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_TapsAndHolds'));
			else
				self:settext("");
		    end;
		end;
	};
	LoadFont("Panedisplay Text")..{
		InitCommand=function(self) self:zoom(0.36):horizalign(right):y(91):x(-11) end;
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_Jumps'));
			else
				self:settext("");
		    end;
		end;
	};
	LoadFont("Panedisplay Text")..{
		InitCommand=function(self) self:zoom(0.36):horizalign(right):y(112):x(-11) end;
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_Hands'));
			else
				self:settext("");
		    end;
		end;
	};
	LoadFont("Panedisplay Text")..{
		InitCommand=function(self) self:zoom(0.36):horizalign(right):y(133):x(-11) end;
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_Holds'));
			else
				self:settext("");
		    end;
		end;
	};

	CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end;
	CurrentCourseChangedMessageCommand=function(self) self:playcommand("Set") end;
	CurrentStepsP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
	CurrentStepsP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
};

return t;