local t = Def.ActorFrame {
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.Black;diffusealpha,0;linear,0.5;diffusealpha,1);
	};
};
return t;