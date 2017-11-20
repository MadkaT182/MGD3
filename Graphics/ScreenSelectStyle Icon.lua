local gc = Var("GameCommand");
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","BGGainFocusCommand");
	LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","BGLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectIcon",gc:GetName() )) .. {
		OnCommand=cmd(Center;diffusealpha,0;linear,0.5;diffusealpha,1;);
		OffCommand=cmd(diffusealpha,1;linear,0.5;diffusealpha,0);
	};
};

t[#t+1] = Def.ActorFrame {
	GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconGainFocusCommand");
	LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectIcon",gc:GetName() )) .. {
		OnCommand=cmd(Center;diffusealpha,0;linear,0.5;diffusealpha,1;);
		OffCommand=cmd(diffusealpha,1;linear,0.5;diffusealpha,0);
	};
};

return t