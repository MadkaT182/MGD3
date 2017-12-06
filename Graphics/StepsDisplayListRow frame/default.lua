
local t = Def.ActorFrame{};

local CustomDifficultyToState = {
	Beginner	= "EASY",
	Easy		= "MED",
	Medium		= "HARD",
	Hard		= "PRO",
	Challenge	= "INSANE",
	Edit		= "ANOTHER",
};

t[#t+1] = Def.ActorFrame{

	LoadFont("Panedisplay Text")..{
		Name="tmeter";
		InitCommand=cmd(x,42;horizalign,right;zoom,.36);
	};

	LoadFont("Panedisplay Text")..{
		Name="dname";
		InitCommand=cmd(x,-68;horizalign,left;zoom,.36;maxwidth,170);
	};

	SetCommand=function(self, param)
		local tmeter = self:GetChild('tmeter');
		local dname = self:GetChild('dname');
		local song = "";
		local step;
		local meter;
		local cdiff = param.CustomDifficulty;
		self:stoptweening();
		dname:visible(false);
		tmeter:visible(false);
		if cdiff then
			step = param.Steps;
			meter = param.Meter;
			dname:visible(true);
			dname:settext(CustomDifficultyToState[cdiff]);

			if getenv("wheelstop") == 1 then
				song = GAMESTATE:GetCurrentSong();
				if GetAdhocPref("UserMeterType") == "CSStyle" then
					if song then
						if cdiff ~= "Edit" then
							meter = GetConvertDifficulty(song,"Difficulty_"..cdiff);
						else
							meter = GetConvertDifficulty(song,"Difficulty_Edit",step);
						end;
					else
						meter = "";
					end;
				end;
			else
				song = "";
			end;
			if meter then
				tmeter:visible(true);
				tmeter:settextf("%d",meter);
			end;
		end;
	end;
};

return t;
