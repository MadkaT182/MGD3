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
	InitCommand=function(self) c = self:GetChildren(); end;
	--Title
	LoadFont("MusicList titles")..{
		Name="Title";
		InitCommand=cmd(horizalign,left;zoom,.41;x,-134;y,2);
	};
	--Artist
	LoadFont("MusicList titles")..{
		Name="Artist";
		InitCommand=cmd(horizalign,left;zoom,.41;x,-134;y,24);
	};
	--Time
	LoadFont("ScreenSelectMusic total time")..{
		Name="Time";
		InitCommand=cmd(horizalign,center;y,88;x,69);
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
			c.Title:maxwidth(650);
			c.Title:settext(title);

			local artist = song:GetDisplayArtist();
			c.Artist:maxwidth(650);
			c.Artist:settext(artist);

			local seconds = song:MusicLengthSeconds();
			c.Time:settext(SecondsToMMSSMsMs(seconds));

			c.Title:diffusealpha(1);
			c.Artist:diffusealpha(1);
			c.Time:diffusealpha(1);

		else
			--Not Song
			c.Title:diffusealpha(0);
			c.Artist:diffusealpha(0);
			c.Time:diffusealpha(0);
		end;
	end;
	--BPM
	Def.BPMDisplay {
		File=THEME:GetPathF("BPM", "Display");
		Name="BPMDisplay";
		InitCommand=cmd(x,38;y,132;horizalign,center;zoom,.62);
		SetCommand=function(self) self:SetFromGameState() end;
	};

	-- difficulty icons
	DifficultyIcons(PLAYER_1) .. {
		BeginCommand=cmd(x,76;y,-52;zoom,.8);
		SetCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then self:visible(false)
			else self:visible(true)
			end
		end;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_1);
	};
	DifficultyIcons(PLAYER_2) .. {
		BeginCommand=cmd(x,172;y,-52;zoom,.8);
		SetCommand=function(self)
			if not GAMESTATE:GetCurrentSong() then self:visible(false);
			else self:visible(true);
			end
		end;
		Condition=GAMESTATE:IsHumanPlayer(PLAYER_2);
	};

--Panel Values
	LoadFont("Panedisplay Text")..{
		InitCommand=cmd(zoom,.36;horizalign,right;y,70;x,-11);
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_TapsAndHolds'));
		    end;
		end;
	};
	LoadFont("Panedisplay Text")..{
		InitCommand=cmd(zoom,.36;horizalign,right;y,91;x,-11);
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_Jumps'));
		    end;
		end;
	};
	LoadFont("Panedisplay Text")..{
		InitCommand=cmd(zoom,.36;horizalign,right;y,112;x,-11);
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_Hands'));
		    end;
		end;
	};
	LoadFont("Panedisplay Text")..{
		InitCommand=cmd(zoom,.36;horizalign,right;y,133;x,-11);
		SetCommand=function(self)
		    steps = GAMESTATE:GetCurrentSteps(PLAYER_1)
		    local song = GAMESTATE:GetCurrentSong();
		    if song and steps ~=nil then
				local GetRadar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1);
				self:settext(GetRadar:GetValue('RadarCategory_Holds'));
		    end;
		end;
	};

	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
};

return t;