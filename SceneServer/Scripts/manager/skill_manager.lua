
---@class SkillManager
local m = {}



---buff技能单独处理
local skillBuff

---重新加载脚本事件
function m.Init()
    skillBuff = SkillBuff
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


local mapMainPoint = {
    [emProfession.OneHand] = emBasePoint.STR,
    [emProfession.Bare] = emBasePoint.DEX,
    [emProfession.Red] = emBasePoint.Magic,
    [emProfession.Bow] = emBasePoint.DEX,
    [emProfession.Blue] = emBasePoint.Magic,  

}

---获取玩家主属性
---@param player Player 玩家对象
local function GetMainPoint(player)
    return player:GetBasePonit(mapMainPoint[player:ProfessionIndex()])
end

---计算高级技能伤害
---返回基础伤害数值、真实伤害数值
---@param player Player 发起攻击的玩家
---@param spirit Spirit 被攻击的对象基类
---@param skill Skill 使用的技能
---@param skillDB kx_skill_data 使用的技能配置
---@return number, number
local function HandleAdvancedSkill(player, spirit, skill, skillDB)
    local level = skill:Level()
    local min = skillDB.min[level]
    local max = skillDB.max[level]
    local min2 = skillDB.min2[level]
    local max2 = skillDB.max2[level]
    --最大物理攻击力
    local maxDC = player:GetAttr(emBaseAttr.MaxDC)
    --最大魔法攻击力
    local maxMC = player:GetAttr(emBaseAttr.MaxMC)
    --基础伤害值
    local baseDamage = math.floor((maxDC + maxMC) * RandomEx(min, max) / 100)
    ---主属性点数
    local mainPoint = GetMainPoint(player)
    --真实伤害值
    local katarsDamage = math.floor(mainPoint * RandomEx(min2, max2) / 100)
    return baseDamage, katarsDamage
end


---玩家使用技能攻击
---@param player Player 发起攻击的玩家
---@param spirit Spirit 被攻击的对象基类
---@param skill Skill 使用的技能
---@param skillDB kx_skill_data 使用的技能配置
---@return number, number, boolean 基础伤害数值，真实伤害数值，是否必中
function m.HandlePlayerAttack(player, spirit, skill, skillDB)
    ---基础伤害数值，真实伤害数值
    local baseDamage, katarsDamage = 0, 0;
    ---物理1技能使用最小攻击力
    if skillDB.skill_type == 0 then
        baseDamage = player:GetAttr(emBaseAttr.MinDC)
    ---物理2技能使用最大物理攻击力    
    elseif skillDB.skill_type == 1 then
        baseDamage = player:GetAttr(emBaseAttr.MaxDC)
    ---魔法技能使用最小魔法攻击力    
    elseif skillDB.skill_type == 2 then
        baseDamage = player:GetAttr(emBaseAttr.MinMC)
    ---计算高级技能伤害    
    elseif skillDB.skill_type == 4 then
        baseDamage, katarsDamage= HandleAdvancedSkill(player, spirit, skill, skillDB)
    end
    return baseDamage, katarsDamage, skillDB.skill_type > 2
end

---玩家刷新附加属性事件
---处理体力强化
---@param player Player
local function OnHandle_Endure(player)
    local skill = player:GetSkillByName_US("Endure")
    if skill == nil then
        return
    end
    ---@type kx_skill_data
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    local num = skillDB.min[skill:Level()] * 10;
    player:IncAttr(emBaseAttr.FinalPerMilHP, math.floor(num))
end

---玩家刷新附加属性事件
---处理加强伤害
---@param player Player
local function OnHandle_Might(player)
    local skill = player:GetSkillByName_US("Might")
    if skill == nil then
        return
    end
    ---@type kx_skill_data
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    player:IncAttr(emBaseAttr.PerMilAC, math.floor(skillDB.min[skill:Level()] * 10))
end

---玩家刷新附加属性事件
---处理快速攻击
---@param player Player
local function OnHandle_Fanatical(player)
    local skill = player:GetSkillByName_US("Fanatical")
    if skill == nil then
        return
    end
    ---@type kx_skill_data
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    player:IncAttr(emBaseAttr.AttackSpeed, skillDB.min[skill:Level()])
end

---玩家刷新附加属性事件
---处理魔法防护
---@param player Player
local function OnHandle_GuardianProtection(player)
    local skill = player:GetSkillByName_US("GuardianProtection")
    if skill == nil then
        return
    end
    ---@type kx_skill_data
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    player:IncAttr(emBaseAttr.MAC, skillDB.min[skill:Level()])
end

---玩家刷新附加属性事件
---处理幻影迷踪
---@param player Player
local function OnHandle_Illusion(player)
    local skill = player:GetSkillByName_US("Illusion")
    if skill == nil then
        return
    end
    ---@type kx_skill_data
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    player:IncAttr(emBaseAttr.BlockRate, math.floor(skillDB.min[skill:Level()] * 10))
end

---玩家刷新附加属性事件
---处理法力强化
---@param player Player
local function OnHandle_MentalCommand(player)
    ---@type Skill
    local skill = player:GetSkillByName_US("MentalCommand")
    if skill == nil then
        return
    end
    ---@type kx_skill_data
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    player:IncAttr(emBaseAttr.FinalPerMilMP, math.floor(skillDB.min[skill:Level()] * 10))
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

    ---基础技能加成计算 最小数值 + ((最大数值 - 最小数值) * 技能等级百分比)

    ---物理1技能增加人物最小攻击力
    if physSkill ~= nil then
        ---@type kx_skill_data
        local skillDB = luaConfig.skillConfig[physSkill:Idx()]
        local min = skillDB.min[1]
        local max = skillDB.max[1]
        local num = min + ((max - min) * physSkill:Level() / 100)
        player:IncAttr(emBaseAttr.MinDC,  math.floor(num))
    end

    ---物理2技能增加人物最大攻击力(1.9倍)
    if physMagSkill ~= nil then
        local skillDB = luaConfig.skillConfig[physMagSkill:Idx()]
        local min = skillDB.min[1]
        local max = skillDB.max[1]
        local num = min + ((max - min) * physMagSkill:Level() / 100)
        player:IncAttr(emBaseAttr.MaxDC, math.floor(num * 1.9))
    end

    ---魔法技能增加人物魔法最大最小
    if magicSkill ~= nil then
        local skillDB = luaConfig.skillConfig[magicSkill:Idx()]
        local min = skillDB.min[1]
        local max = skillDB.max[1]
        local num = math.floor(min + ((max - min) * magicSkill:Level() / 100))
        player:IncAttr(emBaseAttr.MinMC, num)
        player:IncAttr(emBaseAttr.MaxMC, num)
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

---当玩家命中buff
---@param player Player 释放Buff的玩家
---@param hitPlayer Player 命中Buff的玩家
---@param skillName_US string 技能名称
function m.OnPlayerHitBuffEvent(player, hitPlayer, skillName_US)
    ---没有命中对象不处理
    if hitPlayer == nil then
        return
    end
    skillBuff.HandleSkillBuff(player, hitPlayer, skillName_US)
end



SkillManager = m
return m