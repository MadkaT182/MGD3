local t = Def.ActorFrame {
	LoadActor( "evaluation" )..{
		OnCommand=cmd(play);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,1;sleep,1.2;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.White;diffusealpha,0;sleep,1.2;diffusealpha,1;decelerate,1.0;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.White;diffusealpha,1;decelerate,0.8;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.White;zoomy,6.5;decelerate,0.34;zoomy,0.013;sleep,0.1;accelerate,0.35;diffusealpha,0;zoomx,0);
	};
	LoadActor( "../select" )..{
		BeginCommand=cmd(Center);
		OnCommand=cmd(sleep,0.5;linear,0.4;diffusealpha,0);
	};
};
return t;