local t = Def.ActorFrame{
	Def.Sprite{
		SetMessageCommand=function(self,params)
			local Song = params.Song;
			if Song then
				if params.Song:HasBackground() then
						--Verify BG
						self:LoadBackground(params.Song:GetBackgroundPath());
						self:setsize(170,128);
					else
						--Fallback
						self:Load(THEME:GetPathG("Common fallback", "banner"));
						self:setsize(170,128);
				end;
			end;
		end;
	};
};

return t;