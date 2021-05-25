return Def.ActorFrame {
	LoadActor("bg")..{
		InitCommand=function(self) self:Fullscreen() end;
		OnCommand=function(self) self:rainbow():effectclock('bgm'):effectperiod(24) end;
	};
}