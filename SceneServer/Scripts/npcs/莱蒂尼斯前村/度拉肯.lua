

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s |欢迎来到%s。
    我是这家店的老板，在这里，您能找到各式各样的头盔，无论您
    是在冒险、战斗或者只是想增添风采，我们都有合适的头盔选择
    请随意试戴和比较，我相信您会找到适合您的理想头盔！
    ]]

    local select = {
        "我想要购买头盔|OnClickOpenShop",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


DuLaKenNpc = m
return m