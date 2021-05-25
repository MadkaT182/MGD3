local t = Def.ActorFrame {};

--Song Info
t[#t+1] = Def.ActorFrame {
	InitCommand=function(self) c = self:GetChildren(); end;
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

	SetCommand=function(self)
		local course = GAMESTATE:GetCurrentCourse();
		if course then
			--Course
			local title = course:GetDisplayFullTitle();
			c.Title:maxwidth(325);
			c.Title:settext(title);

			local artist = course:GetScripter();
			c.Artist:maxwidth(325);
			c.Artist:settext("Programmed by "..artist);

			c.Title:diffusealpha(1);
			c.Artist:diffusealpha(1);
		else
			--Not Course
			c.Title:diffusealpha(0);
			c.Artist:diffusealpha(0);
		end;
	end;
	--BPM
	Def.BPMDisplay {
		File=THEME:GetPathF("BPM", "Display");
		Name="BPMDisplay";
		InitCommand=function(self) self:x(5):y(133):horizalign(left):zoom(0.62):maxwidth(210) end;-- LEFT
		SetCommand=function(self) self:SetFromGameState() end;
	};

	CurrentSongChangedMessageCommand=function(self) self:playcommand("Set") end;
	CurrentCourseChangedMessageCommand=function(self) self:playcommand("Set") end;
	CurrentStepsP1ChangedMessageCommand=function(self) self:playcommand("Set") end;
	CurrentStepsP2ChangedMessageCommand=function(self) self:playcommand("Set") end;
};

return t;