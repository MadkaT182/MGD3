local t = Def.ActorFrame {
	Def.Quad{
		OnCommand=function(self) self:FullScreen():diffusecolor(Color.Black):diffusealpha(0):linear(0.5):diffusealpha(1) end;
	};
};
return t;