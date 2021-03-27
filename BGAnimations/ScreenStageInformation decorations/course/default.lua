local t = Def.ActorFrame {
	LoadActor( THEME:GetPathG("Common fallback", "background") )..{
		BeginCommand=cmd(Center);
		OnCommand=cmd(diffusecolor,1,0.3,0.3,1);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.White;diffusealpha,1;linear,1;diffusealpha,0);
	};
	LoadActor( "../../exborder" )..{
		BeginCommand=cmd(Center);
		OnCommand=cmd(diffusealpha,0.8;zoomy,2.4;decelerate,0.8;zoomy,1);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.White;zoomy,6.5;decelerate,0.34;zoomy,0.013;sleep,0.1;accelerate,0.35;diffusealpha,0;zoomx,0);
	};
	LoadActor( "../../select" )..{
		BeginCommand=cmd(Center);
		OnCommand=cmd(sleep,0.5;linear,0.4;diffusealpha,0);
	};
	LoadActor( "../../spin" )..{
		BeginCommand=cmd(scale_or_crop_background);
		OnCommand=cmd(diffusealpha,0.6;zoom,0.2;accelerate,0.6;zoom,1;diffusealpha,0;rotationz,250);
	};
	LoadActor( "../../spin" )..{
		BeginCommand=cmd(scale_or_crop_background);
		OnCommand=cmd(diffusealpha,0.6;zoom,0.2;accelerate,0.8;zoom,1;diffusealpha,0;rotationz,-250);
	};
	LoadActor( "../../spin" )..{
		BeginCommand=cmd(scale_or_crop_background);
		OnCommand=cmd(diffusealpha,0.6;zoom,0.2;accelerate,1;zoom,1;diffusealpha,0;rotationz,250);
	};
};
return t;