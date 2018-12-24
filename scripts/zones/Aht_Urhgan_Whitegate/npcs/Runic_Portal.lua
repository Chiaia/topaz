-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Runic Portal
-- Aht Urhgan Teleporter to Other Areas
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/teleports")
require("scripts/globals/besieged")
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local hasAssault, keyitem = hasAssaultOrders(player)
    local points = player:getCurrency("imperial_standing")
    local Teleport = player:getNationTeleport(AHTURHGAN)

    if hasAssault > 0 then
        player:messageSpecial(ID.text.RUNIC_PORTAL + 9, keyitem)
        player:startEvent(hasAssault)
    else
        if player:hasKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT) then
            player:messageSpecial(ID.text.RUNIC_PORTAL + 2,dsp.ki.RUNIC_PORTAL_USE_PERMIT)
            player:startEvent(101,0,Teleport)
        elseif points >= 200 then
            player:messageSpecial(ID.text.RUNIC_PORTAL + 3)
            player:startEvent(101,0,Teleport,9,points,0,1,0,0)
        else
            player:messageSpecial(ID.text.RUNIC_PORTAL)
        end
    end

end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if csid == 101 then
        if option == 101 then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
            dsp.teleport.to(player, dsp.teleport.id.AZOUPH_SP)
        elseif option == 102 then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
            dsp.teleport.to(player, dsp.teleport.id.DVUCCA_SP)
        elseif option == 103 then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
            dsp.teleport.to(player, dsp.teleport.id.MAMOOL_SP)
        elseif option == 104 then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
            dsp.teleport.to(player, dsp.teleport.id.HALVUNG_SP)
        elseif option == 105 then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
            dsp.teleport.to(player, dsp.teleport.id.ILRUSI_SP)
        elseif option == 106 then
            player:delKeyItem(dsp.ki.RUNIC_PORTAL_USE_PERMIT)
            dsp.teleport.to(player, dsp.teleport.id.NYZUL_SP)
        elseif option == 1001 then
            player:delCurrency("imperial_standing",200)
            dsp.teleport.to(player, dsp.teleport.id.AZOUPH_SP)
        elseif option == 1002 then
            player:delCurrency("imperial_standing",200)
            dsp.teleport.to(player, dsp.teleport.id.DVUCCA_SP)
        elseif option == 1003 then
            player:delCurrency("imperial_standing",200)
            dsp.teleport.to(player, dsp.teleport.id.MAMOOL_SP)
        elseif option == 1004 then
            player:delCurrency("imperial_standing",200)
            dsp.teleport.to(player, dsp.teleport.id.HALVUNG_SP)
        elseif option == 1005 then
            player:delCurrency("imperial_standing",200)
            dsp.teleport.to(player, dsp.teleport.id.ILRUSI_SP)
        elseif option == 1006 then
            player:delCurrency("imperial_standing",200)
            dsp.teleport.to(player, dsp.teleport.id.NYZUL_SP)
        end
    elseif csid == 120 and option == 1 then -- dsp.ki.LEUJAOAM_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.AZOUPH_SP)
    elseif csid == 121 and option == 1 then -- MAMMOOL_JA_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.MAMOOL_SP)
    elseif csid == 122 and option == 1 then -- dsp.ki.LEBROS_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.HALVUNG_SP)
    elseif csid == 123 and option == 1 then -- dsp.ki.PERIQIA_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.DVUCCA_SP)
    elseif csid == 124 and option == 1 then -- dsp.ki.ILRUSI_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.ILRUSI_SP)
    elseif csid == 125 and option == 1 then -- dsp.ki.NYZUL_ISLE_ASSAULT_ORDERS
        dsp.teleport.to(player, dsp.teleport.id.NYZUL_SP)
    end
end