return Def.ActorFrame {
	LoadActor( "shared_main" )..{
		OnCommand=cmd(zoom,1.3;addx,-20;diffusealpha,.7);
	};
}