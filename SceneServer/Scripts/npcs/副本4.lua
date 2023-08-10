

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。你想挑战副本地图吗？
    ]]

    local select = {
        "我要挑战副本4|OnClickEnterCopy",
        "离开|Exit"
    }

    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickEnterCopy(npc, player)
    local scene = Game:CreateScene("Copy_Map4");
    if scene == nil  then
        player:SendMsg(3, string.format("提示：创建副本失败，未获取到地图 %s 配置...", Copy_Map4))
    end

    player:MapMove(scene:Name(), 26467, 25141);
end




CopyMap4Npc = m
return m