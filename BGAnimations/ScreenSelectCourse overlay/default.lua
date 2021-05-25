local t = Def.ActorFrame {};
local file = "selcnormal";

if IsUsingWideScreen() == true then
	file = "selcwide";
end

t[#t+1] = Def.ActorFrame {
	LoadActor( "../ball2mod" )..{
		OnCommand=function(self) self:x(SCREEN_CENTER_X+110):y(SCREEN_CENTER_Y):blend('BlendMode_Add'):diffusealpha(0.5):zoom(6):spin():effectmagnitude(44,67,37) end;
	};
	LoadActor( "../ball2mod" )..{
		OnCommand=function(self) self:Center():z(30):blend('BlendMode_Add'):diffusealpha(0.1):zoom(18):spin():effectmagnitude(0,44,0) end;
	};
	LoadActor( "../sphere_back" )..{
		OnCommand=function(self) self:Center():zoom(7):spin():effectmagnitude(0,124,0):diffusealpha(0.5) end;
	};
	LoadActor( "tile" )..{
		OnCommand=function(self) self:blend('BlendMode_Add'):diffusealpha(0.2) end;
	};
	LoadActor(file)..{
		InitCommand=function(self) self:Center() end;
	};
	LoadActor("data")..{
		InitCommand=function(self) self:Center():addx(106):addy(-12) end;
	};
	LoadActor("accel");
};

return t;