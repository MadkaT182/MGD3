return Def.ActorFrame {
	Def.Quad{
		OnCommand=function(self) self:FullScreen():diffusecolor(Color.Black):draworder(1):diffusealpha(0):linear(2):diffusealpha(1) end;
	};
}