local children = {
	LoadFont("PaneDisplay text") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
		GainFocusCommand=cmd(diffuse,color("#929395");zoom,.34);
		LoseFocusCommand=cmd(diffuse,color("#FFFFFF");zoom,.29);
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	};
};

return Def.ActorFrame { children = children };