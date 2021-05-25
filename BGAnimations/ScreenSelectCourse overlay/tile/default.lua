local t = Def.ActorFrame{
	LoadActor("micro")..{
		InitCommand=function(self) self:FullScreen() end;
		OnCommand=function(self)
			local w = DISPLAY:GetDisplayWidth() / self:GetWidth();
			local h = DISPLAY:GetDisplayHeight() / self:GetHeight();
			self:customtexturerect(0,0,w,h);
			self:texcoordvelocity(0,-.2);
		end;
	};
}
return t;