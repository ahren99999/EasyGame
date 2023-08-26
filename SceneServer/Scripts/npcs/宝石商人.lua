
local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。作为这里的宝石商人老板，我可以为您提供各种各样
    的稀有宝石，您需要什么帮助吗？
    ]]

    local select = {
        "我想要购买宝石|OnClickOpenShop",
        "开启超级技能|OnClickTest1",
        "开启觉醒技能|OnClickTest2",
        "取消|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end

function m.OnClickTest1(npc, player)
    player:SetAwakeningStage(1)
    player:SendMsg(3 ,"提示：您完成了变身任务！")
end

function m.OnClickTest2(npc, player)
    player:SetAwakeningStage(2)
    player:SendMsg(3 ,"提示：您完成了觉醒任务！")
end


BaoShiNpc = m
return m
