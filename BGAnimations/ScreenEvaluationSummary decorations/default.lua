local t = Def.ActorFrame {};
local Song = GAMESTATE:GetCurrentSong();
local SongTit = Song:GetDisplayMainTitle();
local pStages = STATSMAN:GetStagesPlayed();
local path = "../ScreenEvaluationNormal decorations/"
local sIndex = 1;
local tSongName = {};
local tSongBg = {};

--Songs data
for i = 1, pStages do
	local pStats = STATSMAN:GetPlayedStageStats(i);
	local pSong = pStats:GetPlayedSongs()[1];
	local pBg = THEME:GetPathG("Common fallback", "background");
	if pSong:HasBackground() then
		pBg = pSong:GetBackgroundPath();
	end
	table.insert(tSongName, pSong:GetDisplayMainTitle());
	table.insert(tSongBg, pBg);
end

if not ThemePrefs.Get("AltResult") then
t[#t+1] = Def.ActorFrame {
	LoadActor("../ball3")..{
		InitCommand=function(self) self:Center():zoom(14):z(-100):spin():effectmagnitude(44,44,44):diffusealpha(0.5) end;
	};
};
end

--Controller
t[#t+1] = Def.ActorFrame {
	CodeMessageCommand = function (self, params)
		if params.Name == 'PrevStat' then
			sIndex = sIndex - 1;
			if sIndex < 1 then
				sIndex = pStages;
			end
			self:GetParent():playcommand("Item");
		elseif params.Name == 'NextStat' then
			sIndex = sIndex + 1;
			if sIndex > pStages then
				sIndex = 1;
			end
			self:GetParent():playcommand("Item");
		end
	end
};

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
		OnCommand=function(self) self:FullScreen():diffusealpha(0.2) end;
		ItemCommand=function(self)
			self:LoadBackground(tSongBg[sIndex]);
			self:FullScreen();
		end
	};
	LoadActor("../Shared_style")..{
		InitCommand=function(self) self:diffusealpha(0.15) end;
	};
};

if ThemePrefs.Get("AltResult") then
t[#t+1] = Def.ActorFrame {
	LoadActor("../ball3")..{
		InitCommand=function(self) self:Center():zoom(14):z(-100):spin():effectmagnitude(44,44,44):diffusealpha(1) end;
	};
	--Video FX
	LoadActor("../Shared_style")..{
		InitCommand=function(self) self:z(-100):ztestmode("WriteOnFail"):diffusealpha(0.1) end;
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
		OnCommand=function(self) self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y+8) end;
		ItemCommand=function(self)
			self:LoadBackground(tSongBg[sIndex]);
			self:setsize(200,150);
		end
	};
	LoadActor(path.."rankbg")..{
		InitCommand=function(self) self:Center() end;
	};
	LoadActor(path.."left")..{
		InitCommand=function(self) self:x(SCREEN_LEFT+64):y(SCREEN_CENTER_Y) end;
	};
	LoadActor(path.."right")..{
		InitCommand=function(self) self:x(SCREEN_RIGHT-64):y(SCREEN_CENTER_Y) end;
	};
	LoadFont("MusicList titles")..{
		Name="SongTit";
		InitCommand=function(self) self:zoom(0.5):Center():queuecommand("Set"):addy(137) end;
		SetCommand=function(self)
			if Song then
				self:settext(Song:GetDisplayFullTitle());
			end;
		end;
		ItemCommand=function(self)
			self:settext(tSongName[sIndex]);
		end
	};
	LoadFont("MusicList titles")..{
		Name="Title";
		InitCommand=function(self) self:zoom(0.5):Center():queuecommand("Set"):addy(-117) end;
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
				self:settext(STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W1") + STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W2") + STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W3") + STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W4"));
				self:horizalign(right);
				self:zoom(0.7);
				if player == player then
					self:y(SCREEN_CENTER_Y+20);
					self:x(SCREEN_CENTER_X+107);
				else
					self:y(SCREEN_CENTER_Y+120);
					self:x(SCREEN_CENTER_X+107);
				end;
			end;
		end;
		ItemCommand=function(self)
			self:settext(STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W1") + STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W2") + STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W3") + STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetTapNoteScores("TapNoteScore_W4"));
		end
	};
	--Total notes
	LoadFont("Combo numbers")..{
		InitCommand=function(self)
			if Song then
				self:settext(STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetRadarPossible():GetValue('RadarCategory_TapsAndHolds'));
				self:horizalign(left);
				self:zoom(0.7);
				if player == player then
					self:y(SCREEN_CENTER_Y+20);
					self:x(SCREEN_CENTER_X+138);
				else
					self:y(SCREEN_CENTER_Y+120);
					self:x(SCREEN_CENTER_X+138);
				end;
			end;
		end;
		ItemCommand=function(self)
			self:settext(STATSMAN:GetPlayedStageStats(sIndex):GetPlayerStageStats(player):GetRadarPossible():GetValue('RadarCategory_TapsAndHolds'));
		end
	};
};
end;

return t;