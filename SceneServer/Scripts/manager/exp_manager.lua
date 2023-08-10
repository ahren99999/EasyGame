

local m = {}

---获取经验倍率
---@param player Player
---@return number exp 经验倍率
function m.GetExpMultiplier(player)
    return player:GetNumber('角色经验倍率', 1)
end

---初始化角色经验倍率
---@param player Player
function m.InitExpMultiplier(player)
    local level = player:Level()
    local val = 1;
    if level < 60 then
        val = 10
    elseif level < 80  then
        val = 8
    elseif level < 100  then
        val = 6
    elseif level < 120  then
        val = 4
    elseif level < 140  then
        val = 2
    end
    val = val + player:GetNumber('角色附加经验倍率', 0)
    player:SetNumber('角色经验倍率', val, false)
    player:SendMsg(3, string.format("提示：受生命之树成长进度影响，您当前的经验倍率为: %s", m.GetExpMultiplier(player)))
end




ExpManager = m
return m