return Def.ActorFrame {
	LoadActor("logo_deco")..{
		OnCommand=cmd(y,-85);
	};
	LoadActor("copy")..{
		OnCommand=cmd(y,222);
	};
	LoadActor( "effect" )..{
		OnCommand=cmd(diffusealpha,0;y,-35;sleep,0.349;blend,'BlendMode_Add';diffusealpha,0.4;zoom,0.88;decelerate,1.08;diffusealpha,0;zoom,1;queuecommand,"Repeat");
		RepeatCommand=cmd(sleep,.4;queuecommand,"On");
	};
	LoadActor( "effect" )..{
		OnCommand=cmd(diffusealpha,0;y,-35;sleep,0.449;blend,'BlendMode_Add';diffusealpha,0.2;zoom,0.88;decelerate,0.98;diffusealpha,0;zoom,1;queuecommand,"Repeat");
		RepeatCommand=cmd(sleep,.4;queuecommand,"On");
	};
	LoadActor( "effect" )..{
		OnCommand=cmd(diffusealpha,0;y,-35;sleep,0.549;blend,'BlendMode_Add';diffusealpha,0.1;zoom,0.88;decelerate,0.88;diffusealpha,0;zoom,1;queuecommand,"Repeat");
		RepeatCommand=cmd(sleep,.4;queuecommand,"On");
	};
	LoadActor( "mgdlogo" )..{
		OnCommand=cmd(y,-35;zoom,0.88);
	};
}