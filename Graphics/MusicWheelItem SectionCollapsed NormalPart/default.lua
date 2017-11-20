return Def.ActorFrame {
	Def.Banner{
		InitCommand=cmd();
		SetMessageCommand=function(self,params)
			local so = GAMESTATE:GetSortOrder();
			local group = params.Text;
			if group then
				if group ~= "" and group ~= "- EMPTY -" then
					self:LoadFromSongGroup(group);
				else
					self:Load(THEME:GetPathG("Common fallback","group"));
				end;
			else
				self:Load(THEME:GetPathG("Common fallback","group"));
			end;
			--self:Load(THEME:GetPathG("Common fallback","group"));
			self:setsize(170,128);
		end;
	};
};