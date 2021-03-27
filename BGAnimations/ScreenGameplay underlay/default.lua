local t = Def.ActorFrame{};
local Center1Player = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();
local st = GAMESTATE:GetCurrentStyle():GetStepsType();
local Song = GAMESTATE:GetCurrentSong();

local function GetPosition(pn)
	if st == "StepsType_Dance_Double" or st == "StepsType_Dance_Solo" or Center1Player then return SCREEN_WIDTH/2;
	else
		local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
		local strSide = (NumSides == 1) and "OneSide" or "TwoSides";
		return THEME:GetMetric("ScreenGameplay","Player".. ToEnumShortString(pn) .. strPlayer .. strSide .."X");
	end;
end;

if Song then
	if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'StaticBG') or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'StaticBG') or Song:HasBGChanges() then
	else
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
				OnCommand=cmd(diffusealpha,.5);
			};
		};
	end;
end;

for player in ivalues(GAMESTATE:GetHumanPlayers()) do
	t[#t+1] = LoadActor("playerfilter")..{
		InitCommand=function(self)
			self:x(GetPosition(player));
			self:y(SCREEN_CENTER_Y);
		end;
	}
end

return t;