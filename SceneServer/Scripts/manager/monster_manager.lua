

local m = {
    ---怪物死亡事件
    MonsterDiedEvent = Event:newEvent()
}


---怪物死亡事件
---@param killer Player 击杀玩家对象(可能为nil)
---@param monster Monster 怪物对象
function m.OnMonsterDiedEvent(killer , monster)
    m.MonsterDiedEvent:trigger(killer, monster)
end


MonsterManager = m
return m