

local m = {}

local lua

local luaConfig = LuaConfig

---重新加载脚本事件
function m.Init()
    luaConfig = LuaConfig
    
 end
 GameManager.ScriptLoadedEvent:addAction(m.Init)

---获取基础buff技能随机值、持续时长
---@param idx any
local function GetRandomNum(idx, level)
    local min = luaConfig.skillConfig[idx].min[1]
    local max = luaConfig.skillConfig[idx].max[1]
    local num = math.floor(min + (max - min) * level / 100)
    local duration = luaConfig.skillConfig[idx].buff_duration[1]
    return num, duration
end

---命中热情
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitWarm(player, hitPlayer, skill, skillName_US)
    ---热情只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())

    local varName = string.format("BUFF技能_%s", skillName_US)

    player:SetNumber("BUFF技能_热情", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中热情光环
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitFireWarm(player, hitPlayer, skill, skillName_US)
    ---热情光环只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_热情光环", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中心灵之火
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitWarmOther(player, hitPlayer, skill, skillName_US)
    ---只能给其他玩家使用
    if player:Id() == hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    hitPlayer:SetNumber("BUFF技能_心灵之火", num, false)
    hitPlayer:AddBuffByName_US(skillName_US, duration, false);
end

---命中自然抵抗
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitResistNature(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_自然抵抗", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中疾风烈火
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitWindOfFire(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_疾风烈火", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中冰神(todo)
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitUndine(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    hitPlayer:SetNumber("BUFF技能_冰神", num, false)
    hitPlayer:AddBuffByName_US(skillName_US, duration, false);
end

---命中风神
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitSylph(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_风神", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中火神
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitSpiritSalamander(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_火神", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中大地神
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitGnome(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_大地神", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中树神
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitDryad(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_树神", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中蛇女
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitNaiad(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_蛇女", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中蓝色妖姬
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitNereid(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_蓝色妖姬", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中幽灵公主
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitOread(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_幽灵公主", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中圣之召唤
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitAlseide(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_圣之召唤", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中冰冻
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitColdEnemy(player, hitPlayer, skill, skillName_US)
    ---只能给别人使用
    if player:Id() == hitPlayer:Id() then
        return
    end
    -- ---自己没开PK无法使用
    -- if player:IsPK() then
    --     return
    -- end
    -- ---目标在安全区无法使用
    -- if not hitPlayer:IsInSafe()then
    --     return
    -- end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    hitPlayer:SetNumber("BUFF技能_冰冻", num, false)
    hitPlayer:AddBuffByName_US(skillName_US, duration, false);
end

---命中冰风
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitWindOfIce(player, hitPlayer, skill, skillName_US)
    ---只能给别人使用
    if player:Id() == hitPlayer:Id() then
        return
    end
    -- ---自己没开PK无法使用
    -- if player:IsPK() then
    --     return
    -- end
    -- ---目标在安全区无法使用
    -- if not hitPlayer:IsInSafe()then
    --     return
    -- end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    hitPlayer:SetNumber("BUFF技能_冰风", num, false)
    hitPlayer:AddBuffByName_US(skillName_US, duration, false);
end

---命中强化冰冻
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitFrostEnemy(player, hitPlayer, skill, skillName_US)
    ---只能给别人使用
    if player:Id() == hitPlayer:Id() then
        return
    end
    -- ---自己没开PK无法使用
    -- if player:IsPK() then
    --     return
    -- end
    -- ---目标在安全区无法使用
    -- if not hitPlayer:IsInSafe()then
    --     return
    -- end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    hitPlayer:SetNumber("BUFF技能_强化冰冻", num, false)
    hitPlayer:AddBuffByName_US(skillName_US, duration, false);
end

---命中强化冰风
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitWaveOfIce(player, hitPlayer, skill, skillName_US)
    ---只能给别人使用
    if player:Id() == hitPlayer:Id() then
        return
    end
    -- ---自己没开PK无法使用
    -- if player:IsPK() then
    --     return
    -- end
    -- ---目标在安全区无法使用
    -- if not hitPlayer:IsInSafe()then
    --     return
    -- end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    hitPlayer:SetNumber("BUFF技能_强化冰风", num, false)
    hitPlayer:AddBuffByName_US(skillName_US, duration, false);
end

---命中火焰抵抗
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitResistFire(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local num, duration = GetRandomNum(skill:Idx(), skill:Level())
    player:SetNumber("BUFF技能_火焰抵抗", num, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中魔法屏障
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitManaBarrier(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    ---伤害减免
    local num1 = skillDB.min[skill:Level()]
    ---MP抵抗
    local num2 = skillDB.max[skill:Level()]
    ---持续时间
    local duration = skillDB.buff_duration[skill:Level()]

    player:SetNumber("BUFF技能_魔法屏障_伤害减免", num1, false)
    player:SetNumber("BUFF技能_魔法屏障_MP抵抗", num2, false)
    player:AddBuffByName_US(skillName_US, duration, false);
end

---命中变身技能
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitTransformation(player, hitPlayer, skill, skillName_US)
    ---只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end
    player:AddBuffByName_US(skillName_US, 120, false);
end

---使用字典存储函数指针
local mapHitBuffEvent = {
    ["Warm"] = HitWarm,
    ["FireWarm"] = HitFireWarm,
    ["WarmOther"] = HitWarmOther,
    ["ResistNature"] = HitResistNature,
    ["WindOfFire"] = HitWindOfFire,
    ["Sylph"] = HitSylph,
    ["SpiritSalamander"] = HitSpiritSalamander,
    ["Gnome"] = HitGnome,
    ["Dryad"] = HitDryad,
    ["Naiad"] = HitNaiad,
    ["Nereid"] = HitNereid,
    ["Oread"] = HitOread,
    ["Alseide"] = HitAlseide,
    ["ColdEnemy"] = HitColdEnemy,
    ["WindOfIce"] = HitWindOfIce,
    ["FrostEnemy"] = HitFrostEnemy,
    ["WaveOfIce"] = HitWaveOfIce,
    ["ResistFire"] = HitResistFire,
    ["ManaBarrier"] = HitManaBarrier,
    ["Transformation"] = HitTransformation
}

---当玩家命中buff
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skillName_US string 技能名称
function m.HandleSkillBuff(player, hitPlayer, skillName_US)
    local skill = player:GetSkillByName_US(skillName_US)

    ---使用了未实现的buff技能
    if mapHitBuffEvent[skillName_US] == nil then
        return
    end
    ---使用策略模式分发函数
    mapHitBuffEvent[skillName_US](player, hitPlayer, skill, skillName_US)
end




SkillBuff = m
return m