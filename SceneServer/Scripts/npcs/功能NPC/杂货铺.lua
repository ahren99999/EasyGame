

local m = {}

function m.OnClickMain(npc, player)

    local content = [[你好呀！%s 
    欢迎来到%s。作为这里的杂货铺老板，我可以为您提供各种各样
    的商品和服务，您需要什么帮助吗？
    ]]

    local select = {
        "我想要购买杂货|OnClickOpenShop",
        "取消|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end
ZaHuoNpc = m
return m