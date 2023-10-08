

local m = {}

function m.OnClickMain(npc, player)

    local content = [[你好呀！%s 
    欢迎来到%s。下次回到城时，想到我面前来吗？
    ]]

    local select = {
        "好的|OnClickSetGoHome",
        "取消|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

---@param npc Npc
---@param player Player
function m.OnClickSetGoHome(npc, player)
    player:SetGomePos(player:PosX(), player:PosY(), player:PosZ())
    player:SendMsg(3, "提示：您设置了新的回城坐标！")
end
GoHomeNpc = m
return m