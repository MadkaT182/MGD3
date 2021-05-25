local t = Def.ActorFrame {};
local batLives = ThemePrefs.Get("DefLives");

for pn in ivalues(GAMESTATE:GetEnabledPlayers()) do
	if batLives == 123456 then
		batLives = GetLives(pn);
	end

	--Mod definer
	GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):LifeSetting('LifeType_Battery');
	GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):BatteryLives(batLives);
	GAMESTATE:GetPlayerState(pn):GetPlayerOptions('ModsLevel_Preferred'):FailSetting('FailType_Immediate');
end;

if GAMESTATE:IsCourseMode() then
		t[#t+1] = Def.ActorFrame {
			LoadActor("course");
		};
else
	--Regular play
	local Song = GAMESTATE:GetCurrentSong();
	local SongTit = Song:GetDisplayMainTitle();
	if SongTit == "I'm an Idiot" then
		t[#t+1] = Def.ActorFrame {
			LoadActor("windeu");
		};
	elseif SongTit == "What Do You Really Want" or SongTit == "What Do You Really Want EX" then
		t[#t+1] = Def.ActorFrame {
			LoadActor("crash");
		};
	elseif IsSongBoss(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor("boss");
		};
	elseif IsSongEx(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor("ex");
		};
	elseif IsSongDash(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor("dash");
		};
	elseif IsSongNonstop(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor("nonstop");
		};
	elseif IsSongRemix(SongTit) then
		t[#t+1] = Def.ActorFrame {
			LoadActor("remix");
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