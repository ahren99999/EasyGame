local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！尊贵的莱蒂尼斯成员!|
    作为这里的杂货铺老板，我可以为您提供各种各样的商品和服务，您需要什么帮助吗？
    ]]

    local select = {
        "我想要购买杂货|OnClickOpenShop",
        "离开|Exit"
    }
    content = string.format(content)
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


NeiChengNpc = m
return m