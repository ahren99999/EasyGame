

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s |欢迎来到%s。
    作为护具专业店，我们提供最舒适、最可靠的护臂选择。无论您
    是需要保护手臂，还是寻找时尚又实用的护臂，我们都能满足您
    的需求。请随意浏览我们的护臂系列，若有需要，我将竭诚为您
    服务。
    ]]

    local select = {
        "我想要购买护臂|OnClickOpenShop",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


TuLuPuNpc = m
return m