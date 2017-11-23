local children = {
	LoadFont("PaneDisplay text") ..{
		Text=THEME:GetString( 'ScreenTitleMenu', Var("GameCommand"):GetText() );
		InitCommand=cmd();
		GainFocusCommand=cmd(diffuse,color("#929395");zoom,.33);
		LoseFocusCommand=cmd(diffuse,color("#FFFFFF");zoom,.29);
		DisabledCommand=cmd(diffuse,0.5,0.5,0.5,1);
	};
};

return Def.ActorFrame { children = children };