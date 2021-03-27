return Def.ActorFrame {
	LoadActor("bg")..{
		InitCommand=cmd(scale_or_crop_background);
		OnCommand=cmd(rainbow;effectclock,'bgm';effectperiod,24);
	};
}