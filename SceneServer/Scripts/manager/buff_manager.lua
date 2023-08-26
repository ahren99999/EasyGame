
---@class BuffManager
local m = {}

---重新加载脚本事件
function m.Init()

   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_1)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_2)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_11)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_12)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_13)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_14)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_15)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_17)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_18)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_19)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_20)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_21)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_22)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_23)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_24)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_26)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_27)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_28)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_29)
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

---变身技能 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_47(player, idx, buffUid)
    player:SetTransformation(true)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end


---变身技能 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_47(player, idx, buffUid)
    player:SetTransformation(false)
    ---buff技能需要将变量清0

    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---变身技能 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_47(player)


end

---火焰抵抗 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_29(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_火焰抵抗_临时属性", player:GetNumber("BUFF技能_火焰抵抗", 0), false)
    player:RefreshAttribute(false)
end


---火焰抵抗 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_29(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_火焰抵抗_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---火焰抵抗 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_29(player)
    local val = player:GetNumber("BUFF技能_火焰抵抗_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MagicResistance, val);
    end
end

---强化冰风 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_27(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_强化冰风_临时属性", player:GetNumber("BUFF技能_强化冰风", 0), false)
    player:RefreshAttribute(false)
end


---强化冰风 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_27(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_强化冰风_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---强化冰风 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_27(player)
    local val = player:GetNumber("BUFF技能_强化冰风_临时属性", 0)
    if val > 0 then
        player:SubAttr(emBaseAttr.AttackSpeed, val);
    end
end

---强化冰冻 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_28(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_强化冰冻_临时属性", player:GetNumber("BUFF技能_强化冰冻", 0), false)
    player:RefreshAttribute(false)
end


---强化冰冻 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_28(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_强化冰冻_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---强化冰冻 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_28(player)
    local val = player:GetNumber("BUFF技能_强化冰冻_临时属性", 0)
    if val > 0 then
        player:SubAttr(emBaseAttr.MoveSpeed, val);
    end
end

---冰风 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_26(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_冰风_临时属性", player:GetNumber("BUFF技能_冰风", 0), false)
    player:RefreshAttribute(false)
end


---冰风 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_26(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_冰风_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---冰风 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_26(player)
    local val = player:GetNumber("BUFF技能_冰风_临时属性", 0)
    if val > 0 then
        player:SubAttr(emBaseAttr.AttackSpeed, val);
    end
end

---冰冻 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_25(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_冰冻_临时属性", player:GetNumber("BUFF技能_冰冻", 0), false)
    player:RefreshAttribute(false)
end


---冰冻 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_25(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_冰冻_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---冰冻 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_25(player)
    local val = player:GetNumber("BUFF技能_冰冻_临时属性", 0)
    if val > 0 then
        player:SubAttr(emBaseAttr.MoveSpeed, val);
    end
end

---圣之召唤 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_24(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_圣之召唤_临时属性", player:GetNumber("BUFF技能_圣之召唤", 0), false)
    player:RefreshAttribute(false)
end


---圣之召唤 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_24(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_圣之召唤_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---圣之召唤 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_24(player)
    local val = player:GetNumber("BUFF技能_圣之召唤_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MinDC, val);
        player:IncAttr(emBaseAttr.MaxDC, math.floor(val * 2));
    end
end

---幽灵公主 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_23(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_幽灵公主_临时属性", player:GetNumber("BUFF技能_幽灵公主", 0), false)
    player:RefreshAttribute(false)
end


---幽灵公主 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_23(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_幽灵公主_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---幽灵公主 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_23(player)
    local val = player:GetNumber("BUFF技能_幽灵公主_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MagicResistance, val);
    end
end

---蓝色妖姬 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_22(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_蓝色妖姬_临时属性", player:GetNumber("BUFF技能_蓝色妖姬", 0), false)
    player:RefreshAttribute(false)
end


---蓝色妖姬 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_22(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_蓝色妖姬_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---蓝色妖姬 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_22(player)
    local val = player:GetNumber("BUFF技能_蓝色妖姬_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.PerMilAC, val);
    end
end

---蛇女 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_21(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_蛇女_临时属性", player:GetNumber("BUFF技能_蛇女", 0), false)
    player:RefreshAttribute(false)
end


---蛇女 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_21(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_蛇女_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---蛇女 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_21(player)
    local val = player:GetNumber("BUFF技能_蛇女_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.PerMilMAC, val);
    end
end

---树神 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_20(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_树神_临时属性", player:GetNumber("BUFF技能_树神", 0), false)
    player:RefreshAttribute(false)
end


---树神 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_20(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_树神_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---树神 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_20(player)
    local val = player:GetNumber("BUFF技能_树神_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.PerMilAC, val);
    end
end

---大地神 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_19(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_大地神_临时属性", player:GetNumber("BUFF技能_大地神", 0), false)
    player:RefreshAttribute(false)
end


---大地神 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_19(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_大地神_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---大地神 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_19(player)
    local val = player:GetNumber("BUFF技能_大地神_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.CritRate, math.floor(val * 10));
    end
end

---火神 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_18(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_火神_临时属性", player:GetNumber("BUFF技能_火神", 0), false)
    player:RefreshAttribute(false)
end


---火神 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_18(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_火神_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---火神 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_18(player)
    local val = player:GetNumber("BUFF技能_火神_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.HPRegen, val);
    end
end

---风神 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_17(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_风神_临时属性", player:GetNumber("BUFF技能_风神", 0), false)
    player:RefreshAttribute(false)
end


---风神 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_17(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_风神_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---风神 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_17(player)
    local val = player:GetNumber("BUFF技能_风神_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MPRegen, val);
    end
end

---疾风烈火 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_15(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_疾风烈火_临时属性", player:GetNumber("BUFF技能_疾风烈火", 0), false)
    player:RefreshAttribute(false)
end


---疾风烈火 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_15(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_疾风烈火_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---疾风烈火 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_15(player)
    local val = player:GetNumber("BUFF技能_疾风烈火_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.AttackSpeed, val);
    end
end

---自然抵抗 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_14(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_自然抵抗_临时属性", player:GetNumber("BUFF技能_自然抵抗", 0), false)
    player:RefreshAttribute(false)
end


---自然抵抗 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_14(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_自然抵抗_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---自然抵抗 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_14(player)
    local val = player:GetNumber("BUFF技能_自然抵抗_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MagicResistance, val);
    end
end

---心灵之火 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_13(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_心灵之火_临时属性", player:GetNumber("BUFF技能_心灵之火", 0), false)
    player:RefreshAttribute(false)
end


---心灵之火 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_13(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_心灵之火_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---心灵之火 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_13(player)
    local val = player:GetNumber("BUFF技能_心灵之火_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MinDC, val * 2);
        player:IncAttr(emBaseAttr.MaxDC, val * 2);
        player:IncAttr(emBaseAttr.MinMC, val * 2);
        player:IncAttr(emBaseAttr.MaxMC, val * 2);
    end
end

---热情光环 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_12(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_热情光环_临时属性", player:GetNumber("BUFF技能_热情光环", 0), false)
    player:RefreshAttribute(false)
end

---热情光环 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_12(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_热情光环_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---热情光环 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_12(player)
    local val = player:GetNumber("BUFF技能_热情光环_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MinMC, val * 2);
        player:IncAttr(emBaseAttr.MaxMC, val * 2);
    end
end

---热情 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_11(player, idx, buffUid)
    player:SetNumber("BUFF技能_热情_临时属性", player:GetNumber("BUFF技能_热情", 0), false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---热情 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_11(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_热情_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---热情 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_11(player)
    local val = player:GetNumber("BUFF技能_热情_临时属性", 0)
    --log("IncSpeed " .. val)
    if val > 0 then
        player:IncAttr(emBaseAttr.MinMC, val * 2);
        player:IncAttr(emBaseAttr.MaxMC, val * 2);
    end
end


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
function m.OnBuffStart_3(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    player:AddSkillBuff(buffConfig.name, buffUid, player:PosX(), player:PosY(), player:PosZ());
end

---大地之斩 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_3(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 3, emBaseAttr.MaxDC, 10, false)
end

---大地之斩 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_3(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---彗星箭 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_4(player, idx, buffUid)
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
function m.OnBuffTriggered_4(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 5, emBaseAttr.MinDC, 6, false)
end

---彗星箭 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_4(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---天神下凡 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_5(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    player:AddSkillBuff(buffConfig.name, buffUid, player:PosX(), player:PosY(), player:PosZ());
end

---天神下凡 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_5(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 3, emBaseAttr.MaxDC, 10, false)
end

---天神下凡 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_5(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---魔法屏障 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_6(player, idx, buffUid)
    player:SetNumber("BUFF技能_魔法屏障_MP抵抗_临时属性", player:GetNumber("BUFF技能_魔法屏障_MP抵抗", 0), false)
    player:SetNumber("BUFF技能_魔法屏障_伤害减免_临时属性", player:GetNumber("BUFF技能_魔法屏障_伤害减免", 0), false)
end

---魔法屏障 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_6(player, idx, buffUid)
    player:SetNumber("BUFF技能_魔法屏障_MP抵抗_临时属性", 0, false)
    player:SetNumber("BUFF技能_魔法屏障_伤害减免_临时属性", 0, false)
end

---暴风雪 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_7(player, idx, buffUid)
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
function m.OnBuffTriggered_7(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 5, emBaseAttr.MaxMC, 4, false)
end

---暴风雪 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_7(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---鹰眼 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_10(player, idx, buffUid)
    player:SetBool("HawkEye", true, false)
end

---鹰眼 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_10(player, idx, buffUid)

end

---鹰眼 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_10(player, idx, buffUid)
    player:SetBool("HawkEye", false, false)
end

BuffManager = m
return m