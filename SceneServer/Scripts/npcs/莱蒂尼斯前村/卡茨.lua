

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s|欢迎来到%s。
    作为这里的店主，我为您提供最锋利、最强大的武器选择。无论
    您是新手还是经验丰富的勇士，我们都能找到适合您的武器。来
    看看我们的货品吧，我保证您会找到心仪的战斗利器！
    ]]

    local select = {
        "我想要购买武器|OnClickOpenShop",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


KaCiNpc = m
return m