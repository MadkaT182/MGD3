local children = {
	LoadFont("PaneDisplay text") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
		GainFocusCommand=function(self) self:diffuse(color("#929395")):zoom(0.34) end;
		LoseFocusCommand=function(self) self:diffuse(color("#FFFFFF")):zoom(0.29) end;
		DisabledCommand=function(self) self:diffuse(0.5,0.5,0.5,1) end;
	};
};

return Def.ActorFrame { children = children };