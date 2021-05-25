return Def.ActorFrame {
	LoadActor("../Logo")..{
		OnCommand=function(self) self:Center() end;
	};
	LoadActor("../Title_deco")..{};
}