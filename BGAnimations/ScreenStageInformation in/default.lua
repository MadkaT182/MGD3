local t = Def.ActorFrame {};

if GAMESTATE:IsCourseMode() then
	t[#t+1] = Def.ActorFrame {
		LoadActor( "boss" )..{
			OnCommand=cmd(play);
		};
	};
else
	--Regular play
	local Song = GAMESTATE:GetCurrentSong();
	local SongTit = Song:GetDisplayMainTitle();
	if SongTit == "I'm an Idiot" then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "windeu" )..{
				OnCommand=cmd(play);
			};
		};
	elseif SongTit == "What Do You Really Want" or SongTit == "What Do You Really Want EX" then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "crash" )..{
				OnCommand=cmd(play);
			};
		};
	elseif IsSongBoss(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "boss" )..{
				OnCommand=cmd(play);
			};
		};
	elseif IsSongEx(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "ex" )..{
				OnCommand=cmd(play);
			};
		};
	elseif IsSongDash(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "dash" )..{
				OnCommand=cmd(play);
			};
		};
	elseif IsSongNonstop(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "nonstop" )..{
				OnCommand=cmd(play);
			};
		};
	elseif IsSongRemix(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor( "remix" )..{
				OnCommand=cmd(play);
			};
		};
	else
		t[#t+1] = Def.ActorFrame {
			LoadActor( "normal" )..{
				OnCommand=cmd(play);
			};
		};
	end
end

return t;