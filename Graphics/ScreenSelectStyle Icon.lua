local gc = Var("GameCommand");
local t = Def.ActorFrame {};

t[#t+1] = Def.ActorFrame {
	GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","BGGainFocusCommand");
	LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","BGLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectIcon",gc:GetName() .. " icon")) .. {
		OnCommand=function(self) self:Center():diffusealpha(0):linear(0.5):diffusealpha(1) end;
		OffCommand=function(self) self:diffusealpha(1):linear(0.5):diffusealpha(0) end;
	};
};

t[#t+1] = Def.ActorFrame {
	GainFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconGainFocusCommand");
	LoseFocusCommand=THEME:GetMetric(Var "LoadingScreen","IconLoseFocusCommand");
	LoadActor(THEME:GetPathG("_SelectIcon",gc:GetName() .. " bg")) .. {
		OnCommand=function(self) self:Center():diffusealpha(0):linear(0.5):diffusealpha(1) end;
		OffCommand=function(self) self:diffusealpha(1):linear(0.5):diffusealpha(0) end;
		GainFocusCommand=function(self) self:diffusealpha(0):linear(0.5):diffusealpha(1) end;
		LoseFocusCommand=function(self) self:stoptweening():diffusealpha(0) end;
	};
};

return t