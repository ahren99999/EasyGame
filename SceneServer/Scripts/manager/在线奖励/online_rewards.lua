

local m = {}





---在线奖励
---@param spirit Spirit
function m.OnlineReward_Timer1001(spirit)
    if not spirit:IsPlayer() then
        return
    end
    local player = spirit:ToPlayer()

    if player:Level() >= 400 then
        player:UnRegisterTimer(1001)
        return
    end

    player:IncExp(100000000)
    --player:SendMsg(3, "提示：恭喜您获得在线奖励 经验*20000！")
end







OnlineRewards = m
return m