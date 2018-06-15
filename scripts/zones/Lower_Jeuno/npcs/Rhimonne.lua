-----------------------------------
-- Area: Lower Jeuno
--  NPC: Rhimonne
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,RHIMONNE_SHOP_DIALOG);

    local stock =
    {
        0x11C1,62,    --Gysahl Greens
     0x0348,4,    --Chocobo Feather
     0x439B,9}    --Dart

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

