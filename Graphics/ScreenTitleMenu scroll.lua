local children = {
	LoadFont("PaneDisplay text") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
		GainFocusCommand=function(self) self:stoptweening():linear(0.2):diffuseshift():effectcolor1(color("#929395")):effectcolor2(color("#FFFFFF")):effectclock('beat'):effectperiod(1):zoom(0.34) end;
		LoseFocusCommand=function(self) self:stoptweening():stopeffect():linear(0.2):diffuse(color("#FFFFFF")):zoom(0.29) end;
		DisabledCommand=function(self) self:diffuse(0.5,0.5,0.5,1) end;
	};
};

return Def.ActorFrame { children = children };