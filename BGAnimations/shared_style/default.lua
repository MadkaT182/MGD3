return Def.ActorFrame {
	LoadActor("shared_style")..{
		InitCommand=function(self) self:FullScreen() end;
	};
}