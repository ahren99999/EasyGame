
local m = {}

function m.OnClickMain(npc, player)
    local content = [[此处封印着强力怪物！|害怕的话现在放弃吧。
    ]]

    local select = {
        "移动|OnClickMapMove(精灵地宫)",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickMapMove(npc, player, args)
    local pointName = args[1]
    local mapPoint = MapPointConfig[pointName]
    local z = mapPoint.PosZ == nil and 0 or mapPoint.PosZ
    player:MapMoveEx("Main_Scene", mapPoint.PosX, mapPoint.PosY, z)
end



LuoLanNpc = m
return m
