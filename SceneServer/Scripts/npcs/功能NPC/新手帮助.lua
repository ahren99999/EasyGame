local m = {}

function m.OnClickMain(npc, player)

    local content = [[你好呀！%s 
    我是新手助手，可以给予你一些帮助，80级之后就不能再次领取了哦！
    ]]

    local select = {
        "我想要得到移动速度加成|OnClickAddMoveSpeed",
        "我想要得到攻击速度加成|OnClickAddAttackSpeed"
    }
    content = string.format(content, player:Name())
    npc:Say(player, content, select)
end

---@param npc Npc
---@param player Player
function m.OnClickAddMoveSpeed(npc, player)
    if player:Level() > 80 then
        player:SendMsg(3, "提示：您的等级已超过80级了，无法使用帮助！")
        return
    end
    player:AddBuffByIdx(1, 7200, false);
end

---@param npc Npc
---@param player Player
function m.OnClickAddAttackSpeed(npc, player)
    if player:Level() > 80 then
        player:SendMsg(3, "提示：您的等级已超过80级了，无法使用帮助！")
        return
    end
    player:AddBuffByIdx(2, 7200, false);
end


HelpNpc = m
return m