return Def.ActorFrame {
	LoadActor("shared_style")..{
		InitCommand=cmd(FullScreen);
	};
}