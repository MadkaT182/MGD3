local t = Def.ActorFrame {};

if GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame {
		LoadActor( "boss" )..{
			OnCommand=function(self) self:play() end;
		};
	};
else
	--Regular play
	local Song = GAMESTATE:GetCurrentSong();
	local SongTit = Song:GetDisplayMainTitle();
	if SongTit == "I'm an Idiot" then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "windeu" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	elseif SongTit == "What Do You Really Want" or SongTit == "What Do You Really Want EX" then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "crash" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	elseif IsSongBoss(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "boss" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	elseif IsSongEx(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "ex" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	elseif IsSongDash(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "dash" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	elseif IsSongNonstop(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "nonstop" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	elseif IsSongRemix(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "remix" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	else
		t[#t+1] = Def.ActorFrame {
			LoadActor( "normal" )..{
				OnCommand=function(self) self:play() end;
			};
		};
	end
end

return t;