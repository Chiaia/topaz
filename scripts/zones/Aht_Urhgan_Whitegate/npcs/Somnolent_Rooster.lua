-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Somnolent Rooster
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(231);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

