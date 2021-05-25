return Def.ActorFrame {
	LoadActor("logo")..{
		InitCommand=function(self) self:FullScreen() end;
	};
	LoadActor("rating")..{
		InitCommand=function(self) self:FullScreen() end;
		OnCommand=function(self) self:diffusealpha(0):sleep(5):linear(1):diffusealpha(1) end;
	};
}