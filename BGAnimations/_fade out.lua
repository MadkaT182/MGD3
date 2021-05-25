return Def.ActorFrame {
	Def.Quad{
		OnCommand=function(self) self:FullScreen():diffusecolor(Color.Black):draworder(1):diffusealpha(0):linear(0.3):diffusealpha(1) end;
	};
}