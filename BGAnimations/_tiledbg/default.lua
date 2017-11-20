local t = Def.ActorFrame{
	LoadActor("1")..{
		InitCommand=cmd(FullScreen;);
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w,h);
			self:texcoordvelocity(-.2,0);
			self:diffusealpha(.95);
		end;
	};
}
return t;