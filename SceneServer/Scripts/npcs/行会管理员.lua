


local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。我可以为您提供行会服务！
    ]]

    local select = {
        "创建行会|/ClanCreate",
        "申请攻城|Exit",
        "离开|Exit"
    }

    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end


GuildNpc = m
return m