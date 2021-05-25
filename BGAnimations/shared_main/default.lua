return Def.ActorFrame {
	LoadActor("shared_main")..{
		InitCommand=function(self) self:FullScreen() end;
	};
--	Def.Quad{
--		OnCommand=function(self) self:FullScreen():diffusecolor(Color.Black):diffusealpha(0.6) end;
--	};
}