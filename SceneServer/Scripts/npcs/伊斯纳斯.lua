

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s |欢迎来到%s。
    在这里我负责为勇士们提供神奇的传送服务。只要您需要前往其他地方，我可以将您瞬间送往目的地。无论是远行探险还是快速返回家园，都让我来为您打开传送之门吧。请问您想去哪个地方？我会帮助您完成旅程。
    ]]

    local select = {
        "我想要移动到港口|OnClickMapMove(港口)",
        "我想要移动到水上村|OnClickMapMove(水上村)",
        "我想要移动到萨洛茨|OnClickMapMove(萨洛茨)",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickMapMove(npc, player, args)
    local pointName = args[1]
    local mapPoint = MapPointConfig[pointName]
    player:MapMove("Main_Scene", mapPoint.PosX, mapPoint.PosY)
end


YiSiNaSi = m
return m