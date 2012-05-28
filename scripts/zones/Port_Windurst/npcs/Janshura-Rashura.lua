-----------------------------------
--	Area: Port Windurst
--	NPC:  Janshura Rashura
--	Starts Windurst Missions
--	@pos 
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
package.loaded["scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getNation() ~= WINDURST) then
		player:startEvent(0x004c); -- for other nation
	else
		CurrentMission = player:getCurrentMission(WINDURST);
		MissionStatus = player:getVar("MissionStatus");
		pRank = player:getRank();
		cs, p, offset = getMissionOffset(player,3,CurrentMission,MissionStatus);
		
		if(CurrentMission <= 15 and (cs ~= 0 or offset ~= 0 or (CurrentMission == 0 and offset == 0))) then
			if(cs == 0) then
				player:showText(npc,ORIGINAL_MISSION_OFFSET + offset); -- dialog after accepting mission
			else
				player:startEvent(cs,p[1],p[2],p[3],p[4],p[5],p[6],p[7],p[8]);
			end
		elseif(CurrentMission ~= 255) then
			player:startEvent(0x006e);
		elseif(player:hasCompletedMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT) == false) then
			player:startEvent(0x0053);
		elseif(player:hasCompletedMission(WINDURST,THE_HEART_OF_THE_MATTER) == false) then
			player:startEvent(0x0068);
		elseif(player:hasCompletedMission(WINDURST,THE_PRICE_OF_PEACE) == false) then
			player:startEvent(0x006d);
		else
			flagMission, repeatMission = getMissionMask(player);
			player:startEvent(0x004e,flagMission,0,0,0,0,repeatMission);
		end
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if(csid == 0x0076 and option == 1) then
		player:setVar("Mission_started_from",2); -- Port Windurst Guard
	end
	
	finishMissionTimeline(player,3,csid,option);
	
end;