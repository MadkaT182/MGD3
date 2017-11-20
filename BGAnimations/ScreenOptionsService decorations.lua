return Def.ActorFrame {
	LoadActor("Logo/mgdlogo")..{
		InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y;blend,'BlendMode_Add';diffusealpha,.25);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,.7);
	};
	LoadActor("ScreenEvaluationNormal decorations/left")..{
		InitCommand=cmd(x,SCREEN_LEFT+64;y,SCREEN_CENTER_Y);
	};
	LoadActor("ScreenEvaluationNormal decorations/right")..{
		InitCommand=cmd(x,SCREEN_RIGHT-64;y,SCREEN_CENTER_Y);
	};
}