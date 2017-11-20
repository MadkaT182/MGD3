return Def.ActorFrame {
	LoadActor("menu_bg")..{
		OnCommand=cmd(Center;addy,126);
	};
	LoadActor("monakai")..{
		OnCommand=cmd(x,SCREEN_RIGHT-72;y,SCREEN_BOTTOM-25);
	};
	LoadActor("vulp_logo")..{
		OnCommand=cmd(x,SCREEN_LEFT+69;y,SCREEN_BOTTOM-18);
	};
}