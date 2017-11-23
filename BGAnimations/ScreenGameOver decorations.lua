return Def.ActorFrame {
	LoadActor("ScreenMDCredits decorations/solong")..{
		InitCommand=cmd(Center;blend,'BlendMode_Add';diffusealpha,.5);
	};
	LoadFont("MusicList titles")..{
		Text="GAME OVER";
		InitCommand=cmd(x,SCREEN_CENTER_X-130;y,SCREEN_CENTER_Y+70;diffusealpha,0;sleep,1;linear,2;diffusealpha,.75)
	};
}