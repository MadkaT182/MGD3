return Def.ActorFrame {
	LoadActor("shared_main")..{
		InitCommand=cmd(FullScreen);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,.6);
	};
}