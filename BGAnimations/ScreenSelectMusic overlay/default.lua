local t = Def.ActorFrame {};
local file = "selmnormal";

if IsUsingWideScreen() == true then
	file = "selmwide";
end

t[#t+1] = Def.ActorFrame {
	LoadActor(file)..{
		InitCommand=cmd(Center);
	};
	LoadActor("data")..{
		InitCommand=cmd(Center;addx,106;addy,-12);
	};
};

return t;