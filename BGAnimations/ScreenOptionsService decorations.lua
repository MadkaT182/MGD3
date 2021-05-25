return Def.ActorFrame {
	LoadActor("Logo/mgdlogo")..{
		InitCommand=function(self) self:Center():blend('BlendMode_Add'):diffusealpha(0.25) end;
	};
	Def.Quad{
		OnCommand=function(self) self:FullScreen():diffusecolor(Color.Black):diffusealpha(0.7) end;
	};
	LoadActor("ScreenEvaluationNormal decorations/left")..{
		InitCommand=function(self) self:x(SCREEN_LEFT+64):y(SCREEN_CENTER_Y) end;
	};
	LoadActor("ScreenEvaluationNormal decorations/right")..{
		InitCommand=function(self) self:x(SCREEN_RIGHT-64):y(SCREEN_CENTER_Y) end;
	};
}