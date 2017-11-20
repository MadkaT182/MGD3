local player = Var "Player"

local t = Def.ActorFrame{
	LoadFont("Combo numbers")..{
		BeginCommand=function(self)
			local screen = SCREENMAN:GetTopScreen();
			local glifemeter = screen:GetLifeMeter(player);
			if glifemeter:GetTotalLives() <= 5 then
				self:diffuseshift();
				self:effectcolor1(1,1,1,1);
				self:effectcolor2(1,0,0,1);
			end;
			self:settext(glifemeter:GetTotalLives());
			self:zoom(.6);
			self:horizalign(center);
		end;
		LifeChangedMessageCommand=function(self,params)
			if params.Player == player then
				self:settext(params.LivesLeft);
				if params.LivesLeft <= 5 then
					self:diffuseshift();
					self:effectcolor1(1,1,1,1);
					self:effectcolor2(1,0,0,1);
				else
					self:stopeffect();
				end;
			end;
		end;
	};
};

return t;