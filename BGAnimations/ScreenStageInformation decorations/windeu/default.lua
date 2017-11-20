local Song = GAMESTATE:GetCurrentSong();
local SongTit = Song:GetDisplayMainTitle();
local t = Def.ActorFrame {
	LoadActor( "../../shared_main" )..{
		OnCommand=cmd(rainbow;diffusealpha,1;linear,2;diffusealpha,0);
	};
	Def.Sprite{
		BeginCommand=cmd(FullScreen);
		InitCommand=function(self)
			if Song then
				if Song:HasBackground() then
						self:LoadBackground(Song:GetBackgroundPath());
					else
						self:Load(THEME:GetPathG("Common fallback", "background"));
				end;
			end;
		end;
		OnCommand=cmd(blend,'BlendMode_Add';zoom,3;zoomx,1.34*3;diffusealpha,0;decelerate,2;FullScreen;diffusealpha,1);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.White;rainbow;diffusealpha,1;linear,1;diffusealpha,0);
	};
	Def.Quad{
		OnCommand=cmd(FullScreen;diffusecolor,Color.White;zoomy,6.5;decelerate,0.34;zoomy,0.013;sleep,0.1;accelerate,0.35;diffusealpha,0;zoomx,0);
	};
	LoadActor( "../../select" )..{
		BeginCommand=cmd(Center);
		OnCommand=cmd(sleep,0.5;linear,0.4;diffusealpha,0);
	};
	LoadActor( "../../spin" )..{
		BeginCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0.6;zoom,0.2;accelerate,0.6;zoom,1;diffusealpha,0;rotationz,250);
	};
	LoadActor( "../../spin" )..{
		BeginCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0.6;zoom,0.2;accelerate,0.8;zoom,1;diffusealpha,0;rotationz,-250);
	};
	LoadActor( "../../spin" )..{
		BeginCommand=cmd(FullScreen);
		OnCommand=cmd(diffusealpha,0.6;zoom,0.2;accelerate,1;zoom,1;diffusealpha,0;rotationz,250);
	};
};
return t;