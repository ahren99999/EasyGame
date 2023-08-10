

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。我是这家防具商店的店主。
    如果您需要购买一些优质的防具来保护自己，我将非常乐意为您
    提供帮助。
    ]]

    local select = {
        "我想要购买防具|OnClickOpenShop",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


JieKeNpc = m
return m