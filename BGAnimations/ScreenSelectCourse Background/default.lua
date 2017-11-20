return Def.ActorFrame {
	LoadActor("bg")..{
		InitCommand=cmd(FullScreen);
		OnCommand=cmd(rainbow;effectclock,'bgm';effectperiod,24);
	};
}