local t = Def.ActorFrame {};

if GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame {
		Def.Sprite{
			BeginCommand=cmd(scale_or_crop_background);
			InitCommand=function(self)
				self:Load(THEME:GetPathG("Common fallback", "background"));
			end;
			OnCommand=cmd(diffusecolor,1,0.3,0.3,1;diffusealpha,1;sleep,0.2;decelerate,0.88;diffusealpha,0);
		};
		LoadActor( "../border" )..{
			BeginCommand=cmd(Center);
			OnCommand=cmd(diffusealpha,0.8;zoomy,1;accelerate,0.8;zoomy,2.4);
		};
	};
else
	--Regular play
	local Song = GAMESTATE:GetCurrentSong();
	local SongTit = Song:GetDisplayMainTitle();

	t[#t+1] = Def.ActorFrame {
		InitCommand=cmd(sleep,4);
		Def.Sprite{
			BeginCommand=cmd(scale_or_crop_background);
			InitCommand=function(self)
				if Song then
					if Song:HasBackground() then
							self:LoadBackground(Song:GetBackgroundPath());
						else
							self:Load(THEME:GetPathG("Common fallback", "background"));
					end;
				end;
			end;
			OnCommand=cmd(diffusealpha,1;sleep,0.2;decelerate,0.88;diffusealpha,0);
		};
	};

	if IsSongBoss(SongTit) then
		t[#t+1] = Def.ActorFrame {
			Def.Sprite{
				BeginCommand=cmd(scale_or_crop_background);
				InitCommand=function(self)
					if Song then
						if Song:HasBackground() then
								self:LoadBackground(Song:GetBackgroundPath());
							else
								self:Load(THEME:GetPathG("Common fallback", "background"));
						end;
					end;
				end;
				OnCommand=cmd(diffusecolor,1,0.3,0.3,1;diffusealpha,1;sleep,0.2;decelerate,0.88;diffusealpha,0);
			};
		};
	end

	if IsSongDash(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "../dash-bg" )..{
				BeginCommand=cmd(scale_or_crop_background);
				OnCommand=cmd(diffusealpha,1;sleep,0.2;decelerate,0.88;diffusealpha,0);
			};
		};
	end

	if IsSongLife(SongTit) then
		t[#t+1] = Def.ActorFrame {
			Def.Sprite{
				BeginCommand=cmd(scale_or_crop_background);
				InitCommand=function(self)
					if Song then
						if Song:HasBackground() then
								self:LoadBackground(Song:GetBackgroundPath());
							else
								self:Load(THEME:GetPathG("Common fallback", "background"));
						end;
					end;
				end;
				OnCommand=cmd(diffusealpha,1;sleep,0.2;decelerate,0.88;diffusealpha,0);
			};
		};
	end

	--Frames
	if IsSongBoss(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "../border" )..{
				BeginCommand=cmd(Center);
				OnCommand=cmd(diffusealpha,0.8;zoomy,1;accelerate,0.8;zoomy,2.4);
			};
		};
	end
	if IsSongEx(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "../exborder" )..{
				BeginCommand=cmd(Center);
				OnCommand=cmd(diffusealpha,0.8;zoomy,1;accelerate,0.8;zoomy,2.4);
			};
		};
	end
	if IsSongLife(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "../lifeborder" )..{
				BeginCommand=cmd(Center);
				OnCommand=cmd(diffusealpha,0.8;zoomy,1;accelerate,0.8;zoomy,2.4);
			};
		};
	end;
end;

return t;