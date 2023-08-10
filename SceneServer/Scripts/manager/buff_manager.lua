
---@class BuffManager
local m = {}

---持续伤害
---@param player Player 玩家对象
---@param idx number buff index
---@param buffUid number buff uid
---@param range number 伤害范围
---@param attr number 伤害数值属性
---@param mix number 伤害数值百分比 (最终伤害 = 伤害数值属性 / 伤害数值百分比)
---@param isMagic boolean 是否魔法伤害
local function ContinuousDamage(player, idx, buffUid, range, attr, mix, isMagic)
    local buffConfig = LuaConfig.buffConfig[idx]
    if nil == buffConfig then
        return
    end

    local sceneName, x, y, z = player:GetBuffPos(buffUid)
    if (sceneName == "") or (x == 0) then
        return
    end
    --log(string.format("ContinuousDamage pos %s, %s, %s, %s", sceneName, x, y ,z))

    local spirits = Game:GetNearbySpirits(sceneName, x,  y, range)
    if nil == spirits  then
        return
    end

    --log("ContinuousDamage Count " .. #spirits)
    for i = 1, #spirits, 1 do
        local spirit = spirits[i]
        if spirit == nil then
            goto continue
        end
        if spirit:Uid() == player:Uid() then
            goto continue
        end
        if spirit:IsMonster() then
            local damage = math.floor(player:GetAttr(attr) / mix)
            Game:LuaHandlePlayerAttack(player, spirit, buffConfig.name, damage, 0, isMagic)
        end
        if spirit:IsMonster() then

        end
        :: continue ::
    end
end


---移动速度卷轴Buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_1(player, idx, buffUid)
    --local buffConfig = LuaConfig.buffConfig[idx]
    --player:IncAttr(emBaseAttr.MoveSpeed, 1);
    player:SetNumber("移动速度卷轴", 30, false)
    player:RefreshAttribute(false)
    --log(string.format("Player %s Use %s", player:Name(), buffConfig.name))
end

---移动速度卷轴Buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_1(player, idx, buffUid)
    
end

---移动速度卷轴Buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_1(player, idx, buffUid)
    --local buffConfig = LuaConfig.buffConfig[idx]
    --player:SubAttr(emBaseAttr.MoveSpeed, 1);
    player:SetNumber("移动速度卷轴", 0, false)
    player:RefreshAttribute(false)

    --log(string.format("Player %s buff %s end", player:Name(), buffConfig.name))
end

---移动速度卷轴Buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_1(player)
    local val = player:GetNumber("移动速度卷轴", 0)
    --log("IncSpeed " .. val)
    if val > 0 then
        player:IncAttr(emBaseAttr.MoveSpeed, val);
    end
end

---攻击速度卷轴Buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_2(player, idx, buffUid)
    --local buffConfig = LuaConfig.buffConfig[idx]
    --player:IncAttr(emBaseAttr.MoveSpeed, 1);
    player:SetNumber("攻击速度卷轴", 15, false)
    player:RefreshAttribute(false)
    --log(string.format("Player %s Use %s", player:Name(), buffConfig.name))
end

---攻击速度卷轴Buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_2(player, idx, buffUid)
    
end

---攻击速度卷轴Buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_2(player, idx, buffUid)
    --local buffConfig = LuaConfig.buffConfig[idx]
    --player:SubAttr(emBaseAttr.MoveSpeed, 1);
    player:SetNumber("攻击速度卷轴", 0, false)
    player:RefreshAttribute(false)

    --log(string.format("Player %s buff %s end", player:Name(), buffConfig.name))
end

---移动速度卷轴Buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_2(player)
    local val = player:GetNumber("攻击速度卷轴", 0)
    --log("IncSpeed " .. val)
    if val > 0 then
        player:IncAttr(emBaseAttr.AttackSpeed, val);
    end
end

---大地之斩 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_7(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    player:AddSkillBuff(buffConfig.name, buffUid, player:PosX(), player:PosY(), player:PosZ());
end

---大地之斩 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_7(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 3, emBaseAttr.MaxDC, 10, false)
end

---大地之斩 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_7(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---彗星箭 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_8(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    local _, x, y, z =player:GetBuffPos(buffUid);
    if x == 0 then
        return
    end
    player:AddSkillBuff(buffConfig.name, buffUid, x, y, z);
end

---彗星箭 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_8(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 5, emBaseAttr.MinDC, 6, false)
end

---彗星箭 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_8(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---天神下凡 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_9(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    player:AddSkillBuff(buffConfig.name, buffUid, player:PosX(), player:PosY(), player:PosZ());
end

---天神下凡 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_9(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 3, emBaseAttr.MaxDC, 10, false)
end

---天神下凡 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_9(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---暴风雪 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_10(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    local _, x, y, z =player:GetBuffPos(buffUid);
    if x == 0 then
        return
    end
    player:AddSkillBuff(buffConfig.name, buffUid, x, y, z);
end

---暴风雪 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_10(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 5, emBaseAttr.MaxMC, 4, false)
end

---暴风雪 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_10(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---鹰眼 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_11(player, idx, buffUid)
    player:SetBool("HawkEye", true, false)
end

---鹰眼 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_11(player, idx, buffUid)

end

---鹰眼 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_11(player, idx, buffUid)
    player:SetBool("HawkEye", false, false)
end

BuffManager = m
return m