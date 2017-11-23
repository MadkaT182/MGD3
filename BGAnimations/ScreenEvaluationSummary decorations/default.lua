local t = Def.ActorFrame {};
local Song = GAMESTATE:GetCurrentSong();
local SongTit = Song:GetDisplayMainTitle();
local path = "../ScreenEvaluationNormal decorations/"

if not ThemePrefs.Get("AltResult") then
t[#t+1] = Def.ActorFrame {
	LoadActor("../ball3")..{
		InitCommand=cmd(Center;zoom,14;z,-100;spin;effectmagnitude,44,44,44;diffusealpha,.5);
	};
};
end

t[#t+1] = Def.ActorFrame {
	LoadActor("../_tiledbg")..{};
	Def.Sprite{
		InitCommand=function(self)
			if Song then
				if Song:HasBackground() then
						self:LoadBackground(Song:GetBackgroundPath());
					else
						self:Load(THEME:GetPathG("Common fallback", "background"));
				end;
			end;
		end;
		OnCommand=cmd(FullScreen;diffusealpha,.2);
	};
	LoadActor("../Shared_style")..{
		InitCommand=cmd(diffusealpha,.15);
	};
};

if ThemePrefs.Get("AltResult") then
t[#t+1] = Def.ActorFrame {
	LoadActor("../ball3")..{
		InitCommand=cmd(Center;zoom,14;z,-100;spin;effectmagnitude,44,44,44;diffusealpha,1);
	};
	--Video FX
	LoadActor("../Shared_style")..{
		InitCommand=cmd(z,-100;ztestmode,"WriteOnFail";diffusealpha,.1);
	};
};
end

t[#t+1] = Def.ActorFrame {
	Def.Sprite{
		InitCommand=function(self)
			if Song then
				if Song:HasBackground() then
						self:LoadBackground(Song:GetBackgroundPath());
					else
						self:Load(THEME:GetPathG("Common fallback", "background"));
				end;
				self:setsize(200,150);
			end;
		end;
		OnCommand=cmd(x,SCREEN_CENTER_X-160;y,SCREEN_CENTER_Y+8);
	};
	LoadActor(path.."rankbg")..{
		InitCommand=cmd(Center);
	};
	LoadActor(path.."left")..{
		InitCommand=cmd(x,SCREEN_LEFT+64;y,SCREEN_CENTER_Y);
	};
	LoadActor(path.."right")..{
		InitCommand=cmd(x,SCREEN_RIGHT-64;y,SCREEN_CENTER_Y);
	};
	LoadFont("MusicList titles")..{
		Name="Title";
		--InitCommand=cmd(zoom,.5;Center;queuecommand,"Set";addy,137);
		InitCommand=cmd(zoom,.5;Center;queuecommand,"Set";addy,-117);
		SetCommand=function(self)
			if Song then
				self:settext("Final Result");
			end;
		end;
	};
};

for player in ivalues(GAMESTATE:GetEnabledPlayers()) do
t[#t+1] = Def.ActorFrame {
	--Notes Hit
	LoadFont("Combo numbers")..{
		InitCommand=function(self)
			if Song then
				local TotalStep=STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W1") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W2") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W3") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W4") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W5");
				self:settext(TotalStep);
				self:horizalign(right);
				self:zoom(.7);
				if player == player then
					self:y(SCREEN_CENTER_Y+20);
					self:x(SCREEN_CENTER_X+107);
				else
					self:y(SCREEN_CENTER_Y+120);
					self:x(SCREEN_CENTER_X+107);
				end;
			end;
		end;
	};
	--Total notes
	LoadFont("Combo numbers")..{
		InitCommand=function(self)
			if Song then
				self:settext(STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W1") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W2") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W3") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W4") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W5") + STATSMAN:GetAccumPlayedStageStats():GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_Miss"));
				self:horizalign(left);
				self:zoom(.7);
				if player == player then
					self:y(SCREEN_CENTER_Y+20);
					self:x(SCREEN_CENTER_X+138);
				else
					self:y(SCREEN_CENTER_Y+120);
					self:x(SCREEN_CENTER_X+138);
				end;
			end;
		end;
	};
};
end;

return t;