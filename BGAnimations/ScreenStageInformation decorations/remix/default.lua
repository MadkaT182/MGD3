local Song = GAMESTATE:GetCurrentSong();
local SongTit = Song:GetDisplayMainTitle();
local t = Def.ActorFrame {
	Def.Sprite{
		BeginCommand=function(self) self:scale_or_crop_background() end;
		InitCommand=function(self)
			if Song then
				if Song:HasBackground() then
						self:LoadBackground(Song:GetBackgroundPath());
					else
						self:Load(THEME:GetPathG("Common fallback", "background"));
				end;
			end;
		end;
		OnCommand=function(self) self:zoom(3):diffusealpha(0):decelerate(2):scale_or_crop_background():diffusealpha(1) end;
	};
	Def.Quad{
		OnCommand=function(self) self:FullScreen():diffusecolor(Color.White):rainbow():diffusealpha(1):linear(1):diffusealpha(0) end;
	};
	LoadActor( "../../lifeborder" )..{
		BeginCommand=function(self) self:Center() end;
		OnCommand=function(self) self:diffusealpha(0.8):zoomy(2.4):decelerate(0.8):zoomy(1) end;
	};
	Def.Quad{
		OnCommand=function(self) self:FullScreen():diffusecolor(Color.White):zoomy(SCREEN_HEIGHT):decelerate(0.34):zoomy(0.013):sleep(0.1):accelerate(0.35):diffusealpha(0):zoomx(0) end;
	};
	LoadActor( "../../select" )..{
		BeginCommand=function(self) self:Center() end;
		OnCommand=function(self) self:sleep(0.5):linear(0.4):diffusealpha(0) end;
	};
	LoadActor( "../../spin" )..{
		BeginCommand=function(self) self:scale_or_crop_background() end;
		OnCommand=function(self) self:diffusealpha(0.6):zoom(0.2):accelerate(0.6):zoom(1):diffusealpha(0):rotationz(250) end;
	};
	LoadActor( "../../spin" )..{
		BeginCommand=function(self) self:scale_or_crop_background() end;
		OnCommand=function(self) self:diffusealpha(0.6):zoom(0.2):accelerate(0.8):zoom(1):diffusealpha(0):rotationz(-250) end;
	};
	LoadActor( "../../spin" )..{
		BeginCommand=function(self) self:scale_or_crop_background() end;
		OnCommand=function(self) self:diffusealpha(0.6):zoom(0.2):accelerate(1):zoom(1):diffusealpha(0):rotationz(250) end;
	};
};
return t;