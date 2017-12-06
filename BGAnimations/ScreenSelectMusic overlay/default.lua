local t = Def.ActorFrame {};
local file = "selmnormal";

if IsUsingWideScreen() == true then
	file = "selmwide";
end

t[#t+1] = Def.ActorFrame {
	LoadActor(file)..{
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
};

return t;