local t = Def.ActorFrame {};
local file1 = "selmnormal song.png";
local file2 = "selmnormal folder.png";

if IsUsingWideScreen() == true then
	file1 = "selmwide song.png";
	file2 = "selmwide folder.png";
end

t[#t+1] = Def.ActorFrame {
	InitCommand=function(self) c = self:GetChildren(); end;
	LoadActor(file1)..{
		Name="BG1";
		InitCommand=cmd(Center);
	};
	LoadActor(file2)..{
		Name="BG2";
		InitCommand=cmd(Center);
	};
	LoadActor("difflist")..{
		InitCommand=cmd(Center;addx,40;addy,-140);
	};
	LoadActor("scoring")..{
		InitCommand=cmd(Center;addx,180;addy,-117);
	};
	LoadActor("data")..{
		InitCommand=cmd(Center;addx,106;addy,-12);
	};
	LoadActor("accel");
	SetCommand=function(self)
		local song = GAMESTATE:GetCurrentSong();
		if song then
			--Song
			c.BG1:diffusealpha(1);
			c.BG2:diffusealpha(0);
		else
			--Folder
			c.BG1:diffusealpha(0);
			c.BG2:diffusealpha(1);
		end;
	end;
	
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
};

return t;