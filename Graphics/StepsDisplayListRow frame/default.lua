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
		InitCommand=function(self) self:x(31.5):horizalign(center):zoom(0.36) end;
	};

	LoadFont("Panedisplay Text")..{
		Name="dname";
		InitCommand=function(self) self:x(-68):horizalign(left):zoom(0.36):maxwidth(170) end;
	};

	SetCommand=function(self, param)
		local tmeter = self:GetChild('tmeter');
		local dname = self:GetChild('dname');
		local song = GAMESTATE:GetCurrentSong();
		local step;
		local meter;
		local cdiff;
		self:stoptweening();
		dname:visible(false);
		tmeter:visible(false);
		if song then
			step = param.Steps;
			meter = param.Meter;
			cdiff = param.CustomDifficulty;
			dname:visible(true);
			dname:settext(CustomDifficultyToState[cdiff]);
			if cdiff == "Challenge" then
				dname:diffuse(Color("Red"));
				tmeter:diffuse(Color("Red"));
			else
				dname:diffuse(Color("White"));
				tmeter:diffuse(Color("White"));
			end;

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