
local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。我可以为您提供仓库服务，您需要帮助存放或提取物品吗？
    ]]


    local select = {
        "我想要存取物品|OnClickOpenStore",
        "离开|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function  m.OnClickOpenStore(npc, player)
    npc:OpenStore(player)
end


StorerNpc = m
return m