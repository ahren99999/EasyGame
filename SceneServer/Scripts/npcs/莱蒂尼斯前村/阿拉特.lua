

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。我是这家防具商店的店主。
    在这里，我们提供各类护腿，无论您是冒险者还是战士，我们都
    有适合您的护腿选择。请随意浏览我们的商品，试试看哪款最适
    合您。如果您有任何疑问或需要帮助，都请告诉我，我会尽心尽
    力为您提供帮助。祝您在我们的商店找到满意的护腿！
    ]]

    local select = {
        "我想要购买护腿|OnClickOpenShop",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


ALaTeNpc = m
return m