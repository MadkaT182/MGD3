return Def.ActorFrame {
	LoadActor("logo")..{
		InitCommand=cmd(FullScreen);
	};
	LoadActor("rating")..{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0;sleep,5;linear,1;diffusealpha,1);
	};
}