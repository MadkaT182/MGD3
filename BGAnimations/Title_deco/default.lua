return Def.ActorFrame {
	LoadActor("menu_bg")..{
		OnCommand=function(self) self:Center():addy(126) end;
	};
	LoadActor("monakai")..{
		OnCommand=function(self) self:x(SCREEN_RIGHT-72):y(SCREEN_BOTTOM-25) end;
	};
	LoadActor("vulp_logo")..{
		OnCommand=function(self) self:x(SCREEN_LEFT+69):y(SCREEN_BOTTOM-18) end;
	};
}