local m = {}

function m.OnClickMain(npc, player)
    local content = [[您好呀！尊贵的莱蒂尼斯成员!|
    我是城堡的管理人员，您需要什么服务尽管跟我！
    ]]

    local select = {
        "我要使用传送服务|OnClickMainMapMove",
        "我要设置回城点|OnClickSetGoHome",
        "离开|Exit"
    }
    content = string.format(content)
    npc:Say(player, content, select)
end



function m.OnClickMainMapMove(npc, player)
    local content = [[您好呀！尊贵的莱蒂尼斯成员!|
    我是城堡的管理人员，您需要什么服务尽管跟我！
    ]]

    local select = {
        "我想要移动到莱蒂尼斯|OnClickMapMove(莱蒂尼斯)",
        "我想要移动到港口|OnClickMapMove(港口)",
        "我想要移动到水上村|OnClickMapMove(水上村)",
        "我想要移动到萨洛茨|OnClickMapMove(萨洛茨)",
        "返回|OnClickMain"
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


---@param npc Npc
---@param player Player
function m.OnClickSetGoHome(npc, player)
    player:SetGomePos(player:PosX(), player:PosY(), player:PosZ())
    player:SendMsg(3, "提示：您设置了新的回城点！")
end


CastleNpc = m
return m