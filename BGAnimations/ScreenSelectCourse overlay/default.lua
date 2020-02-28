local t = Def.ActorFrame {};
local file = "selcnormal";

if IsUsingWideScreen() == true then
	file = "selcwide";
end

t[#t+1] = Def.ActorFrame {
	LoadActor( "../ball2mod" )..{
		OnCommand=cmd(x,SCREEN_CENTER_X+110;y,SCREEN_CENTER_Y;blend,'BlendMode_Add';diffusealpha,.5;zoom,6;spin;effectmagnitude,44,67,37;);
	};
	LoadActor( "../ball2mod" )..{
		OnCommand=cmd(Center;z,30;blend,'BlendMode_Add';diffusealpha,.1;zoom,18;spin;effectmagnitude,0,44,0;);
	};
	LoadActor( "../sphere_back" )..{
		OnCommand=cmd(Center;zoom,7;spin;effectmagnitude,0,124,0;diffusealpha,1);
	};
	LoadActor( "tile" )..{
		OnCommand=cmd(blend,'BlendMode_Add';diffusealpha,0.2);
	};
	LoadActor(file)..{
		InitCommand=cmd(Center);
	};
	LoadActor("data")..{
		InitCommand=cmd(Center;addx,106;addy,-12);
	};
	LoadActor("accel");
};

return t;