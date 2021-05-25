return Def.ActorFrame {
	LoadActor("bg")..{
		InitCommand=function(self) self:FullScreen() end;
		OnCommand=function(self) self:rainbow():effectclock('bgm'):effectperiod(24) end;
	};
}