return Def.ActorFrame {
	LoadActor( "bg" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+1680;y,SCREEN_CENTER_Y;blend,'BlendMode_Add';linear,120;x,SCREEN_CENTER_X-2920);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,.5);
	};
	LoadActor( "credits" )..{
		OnCommand=cmd(diffuse,color("0,0,0,0.5");y,SCREEN_CENTER_Y+8;x,SCREEN_CENTER_X+2290;linear,60;x,SCREEN_CENTER_X-2930);
	};
	LoadActor( "credits" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+2280;y,SCREEN_CENTER_Y+8;linear,60;x,SCREEN_CENTER_X-2920);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,0;sleep,50;linear,2;diffusealpha,1);
	};
	LoadActor( "solong" )..{
		OnCommand=cmd(Center;diffusealpha,0;sleep,52;linear,2.5;diffusealpha,1;sleep,2;linear,2.5;diffusealpha,0);
	};
}