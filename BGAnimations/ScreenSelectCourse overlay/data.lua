local t = Def.ActorFrame {};

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

	SetCommand=function(self)
		local course = GAMESTATE:GetCurrentCourse();
		if course then
			--Course
			local title = course:GetDisplayFullTitle();
			c.Title:maxwidth(650);
			c.Title:settext(title);

			local artist = course:GetDescription();
			c.Artist:maxwidth(650);
			c.Artist:settext(artist);

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
		InitCommand=cmd(x,38;y,132;horizalign,center;zoom,.62);
		SetCommand=function(self) self:SetFromGameState() end;
	};

	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP1ChangedMessageCommand=cmd(playcommand,"Set");
	CurrentStepsP2ChangedMessageCommand=cmd(playcommand,"Set");
};

return t;