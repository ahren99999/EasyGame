---怪物对象
---@class Monster:Spirit
local Monster

--- 获取当前HP
--- @return int32_t
function Monster:HP()
end

--- 扣除血量并返回实际扣除的血量
--- @param val uint32_t
--- @return int32_t
function Monster:SubHP(val)
end

--- 获取警卫范围
--- @return int8_t
function Monster:GuardRange()
end

--- 检查是否死亡时触发
--- @return bool
function Monster:IsIsDeathTrigger()
end

--- 设置是否死亡时触发
--- @param val bool
function Monster:SetIsIsDeathTrigger(val)
end