return Def.ActorFrame {
	OnCommand=cmd(Center);
	Def.Quad{
		OnCommand=cmd(FullScreen;x,0;y,0;diffusecolor,Color.Black;draworder,1;diffusealpha,0;linear,1;diffusealpha,1);
	};
	LoadActor( "x" )..{
		OnCommand=cmd(blend,'BlendMode_Add';zoom,5;rotationz,290;diffusealpha,0;sleep,0.1;decelerate,0.6;zoom,1;rotationz,0;diffusealpha,1;sleep,0.1;linear,0.8;diffusealpha,0);
	};
	LoadActor( "failed_shadow" )..{
		OnCommand=cmd(diffusealpha,0;zoom,4;sleep,0.6;diffusealpha,1;decelerate,0.25;zoom,1;sleep,0.1;linear,0.8;zoom,1.5;diffusealpha,0);
	};
	LoadActor( "failed_over" )..{
		OnCommand=cmd(diffusealpha,0;sleep,0.7;decelerate,0.12;diffusealpha,1;sleep,1;linear,0.9;diffusealpha,0);
	};
	LoadActor("failed_sound") .. {
		StartTransitioningCommand=cmd(play);
	};
}