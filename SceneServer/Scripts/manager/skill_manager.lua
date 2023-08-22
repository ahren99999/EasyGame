
---@class SkillManager
local m = {}

local luaConfig

---重新加载脚本事件
function m.Init()
    luaConfig = LuaConfig
    PlayerManager.RefreshAttributeEvent:addAction(m.OnSkillRefreshAttribute)
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

--使用剑气
local function UseSoulBlade(player, spirit, skill, skillDB)
    local maxDc = player:GetAttr(emBaseAttr.MinDC)
    
    return math.floor(maxDc + (maxDc * skill:Level() * 0.2))
end

--使用雷电拳
local function UseSoulFist(player, spirit, skill, skillDB)
    local maxDc = player:GetAttr(emBaseAttr.MinDC)
    
    return math.floor(maxDc + (maxDc * skill:Level() * 0.2))
end

--使用愤怒之火
local function UseFireFury(player, spirit, skill, skillDB)
    local maxDc = player:GetAttr(emBaseAttr.MinMC)
    
    return math.floor(maxDc + (maxDc * skill:Level() * 0.2))
end

--使用致命一击
local function UseDeadlyCount(player, spirit, skill, skillDB)
    local maxDc = player:GetAttr(emBaseAttr.MinDC)
    
    return math.floor(maxDc + (maxDc * skill:Level() * 0.2))
end

--使用霜之新星
local function UseIceFury(player, spirit, skill, skillDB)
    local maxDc = player:GetAttr(emBaseAttr.MinMC)
    
    return math.floor(maxDc + (maxDc * skill:Level() * 0.2))
end

---玩家使用技能攻击
---@param player Player 发起攻击的玩家
---@param spirit Spirit 被攻击的对象基类
---@param skill Skill 使用的技能
---@param skill_Idx number 使用的技能配置
---@param x number 坐标x
---@param y number 坐标y
---@return number atkNum 返回伤害值
function m.HandlePlayerAttack(player, spirit, skill, skill_Idx, x, y)
    local atk = 0
    local skillDB = luaConfig.skillConfig[skill_Idx]
    if skillDB.skill_type == 0 then
        atk = player:GetAttr(emBaseAttr.MinDC)
    elseif skillDB.skill_type == 1 then
        atk = player:GetAttr(emBaseAttr.MaxDC)
    elseif skillDB.skill_type == 2 then
        atk = player:GetAttr(emBaseAttr.MinMC)
    end

    if skillDB.english_name == "SoulBlade" then
        return UseSoulBlade(player, spirit, skill, skillDB)
    end

    if skillDB.english_name == "SoulFist" then
        return UseSoulFist(player, spirit, skill, skillDB)
    end

    if skillDB.english_name == "FireFury" then
        return UseFireFury(player, spirit, skill, skillDB)
    end

    if skillDB.english_name == "DeadlyCount" then
        return UseDeadlyCount(player, spirit, skill, skillDB)
    end

    if skillDB.english_name == "IceFury" then
        return UseIceFury(player, spirit, skill, skillDB)
    end

    return atk
end

---玩家刷新附加属性事件
---处理体力强化
---@param player Player
local function OnHandle_Endure(player)
    local skill = player:GetSkillByName_US("Endure")
    if skill == nil then
        return
    end
    local num = 100
    if player:ProfessionIndex() == emProfession.OneHand then
        num = 200
    end
    player:IncAttr(emBaseAttr.MaxHP, math.floor(num * skill:Level()))
end

---玩家刷新附加属性事件
---处理加强伤害
---@param player Player
local function OnHandle_Might(player)
    local skill = player:GetSkillByName_US("Might")
    if skill == nil then
        return
    end
    local num = 80
    player:IncAttr(emBaseAttr.MinDC, math.floor(num * skill:Level()))
    player:IncAttr(emBaseAttr.MaxDC, math.floor(2 * num * skill:Level()))

end

---玩家刷新附加属性事件
---处理快速攻击
---@param player Player
local function OnHandle_Fanatical(player)
    local skill = player:GetSkillByName_US("Fanatical")
    if skill == nil then
        return
    end
    local num = 0.25 * skill:Level() / 10
    if player:ProfessionIndex() == emProfession.Bare then
        num = 0.3 * skill:Level() / 10
    end
    local speed = player:GetAttr(emBaseAttr.AttackSpeed)
    player:IncAttr(emBaseAttr.AttackSpeed, math.floor(speed + speed *num))
end

---玩家刷新附加属性事件
---处理魔法防护
---@param player Player
local function OnHandle_GuardianProtection(player)
    local skill = player:GetSkillByName_US("GuardianProtection")
    if skill == nil then
        return
    end
    local num = 10
    --魔法防御千分比
    player:IncAttr(emBaseAttr.PerMilMAC, math.floor(skill:Level() *num))
end

---玩家刷新附加属性事件
---处理幻影迷踪
---@param player Player
local function OnHandle_Illusion(player)
    local skill = player:GetSkillByName_US("Illusion")
    if skill == nil then
        return
    end
    local num = 0.15 * skill:Level() / 10
    local blockRate = player:GetAttr(emBaseAttr.BlockRate)
    --魔法防御千分比
    player:IncAttr(emBaseAttr.BlockRate, math.floor(blockRate + blockRate *num))
end

---玩家刷新附加属性事件
---处理法力强化
---@param player Player
local function OnHandle_MentalCommand(player)
    local skill = player:GetSkillByName_US("MentalCommand")
    if skill == nil then
        return
    end
    local num = 300
    player:IncAttr(emBaseAttr.MaxHP, math.floor(num * skill:Level()))
end

---玩家刷新附加属性事件
---处理基础技能
---@param player Player
local function OnHandle_BasicSkill(player)
    ---@type Skill 物理技能
    local physSkill = player:GetSkillByName_US(player:CurrentPhysSkill())
    ---@type Skill 物理魔法技能
    local physMagSkill = player:GetSkillByName_US(player:CurrentPhysMagSkill())
    ---@type Skill 魔法技能
    local magicSkill = player:GetSkillByName_US(player:CurrentMagicSkill())

    ---基础技能加成计算 技能成长属性 * 技能等级
    if physSkill ~= nil then
        local growth = luaConfig.skillConfig[physSkill:Idx()].growth_attr
        player:IncAttr(emBaseAttr.MinDC,  math.floor(growth * physSkill:Level()))
    end

    if physMagSkill ~= nil then
        local growth = luaConfig.skillConfig[physMagSkill:Idx()].growth_attr
        player:IncAttr(emBaseAttr.MaxDC, math.floor(growth * physMagSkill:Level()))
    end

    if magicSkill ~= nil then
        local growth = luaConfig.skillConfig[magicSkill:Idx()].growth_attr
        player:IncAttr(emBaseAttr.MinMC, math.floor(growth * magicSkill:Level()))
        player:IncAttr(emBaseAttr.MaxMC, math.floor(growth * magicSkill:Level()))
    end
end



---玩家刷新附加属性事件
---穿戴装备或者变更属性点时触发
---@param player Player
function m.OnSkillRefreshAttribute(player)
    OnHandle_BasicSkill(player)         --处理基础技能
    OnHandle_Endure(player)             --处理体力强化
    OnHandle_Might(player)              --处理加强伤害
    OnHandle_Fanatical(player)          --处理快速攻击
    OnHandle_GuardianProtection(player) --处理魔法防护
    OnHandle_Illusion(player)           --处理幻影迷踪
    OnHandle_MentalCommand(player)      --处理法力强化
end

---命中热情
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skill Skill 技能对象
---@param skillName_US string 技能英文名字
local function HitWarm(player, hitPlayer, skill, skillName_US)
    ---热情光环只能给自己使用
    if player:Id() ~= hitPlayer:Id() then
        return
    end

    ---200基础数值 + 200 * 技能等级 / 100
    local num = 200 + math.floor(200 * skill:Level() / 100)
    player:SetNumber("BUFF技能_热情", num, false)
    player:AddBuffByName_US(skillName_US, 180, false);
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

    ---260基础数值 + 260 * 技能等级 / 100
    local num = 260 + math.floor(260 * skill:Level() / 100)
    player:SetNumber("BUFF技能_热情光环", num, false)
    player:AddBuffByName_US(skillName_US, 180, false);
end

---使用字典存储函数指针
local mapHitBuffEvent = {
    ["Warm"] = HitWarm,
    ["FireWarm"] = HitFireWarm
}

---当玩家命中buff
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skillName_US string 技能名称
function m.OnPlayerHitBuffEvent(player, hitPlayer, skillName_US)
    ---没有命中对象不处理
    if hitPlayer == nil then
        return
    end
    local skill = player:GetSkillByName_US(skillName_US)

    ---使用了未实现的buff技能
    if mapHitBuffEvent[skillName_US] == nil then
        return
    end
    ---使用策略模式分发函数
    mapHitBuffEvent[skillName_US](player, hitPlayer, skill, skillName_US)
end



SkillManager = m
return m