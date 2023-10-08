
---@class BuffManager
local m = {}

---@type LuaConfig
local luaConfig

local utility


---持续伤害
---@param player Player 玩家对象
---@param idx number buff index
---@param buffUid number buff uid
---@param range number 伤害范围
local function ContinuousDamage(player, idx, buffUid, range)
    local buffConfig = LuaConfig.buffConfig[idx]
    if nil == buffConfig then
        return
    end

    local sceneName, x, y, z = player:GetBuffPos(buffUid)
    if (sceneName == "") or (x == 0) then
        return
    end

    local gameX = x
    local gameY = y
    ---兼容 UE4 与 Game 坐标
    if  gameX < 0 then
        gameX, gameY =  utility.UEPosToGamePos(x, y)
    end

    local spirits = Game:GetNearbySpirits(sceneName, gameX,  gameY, range)
    if nil == spirits  then
        return
    end

    for i = 1, #spirits, 1 do
        ---@type Spirit
        local spirit = spirits[i]
        if spirit == nil then
            goto continue
        end
        if spirit:Uid() == player:Uid() then
            goto continue
        end
        ---如果是玩家且频道相同不处理
        if spirit:IsPlayer() then
            if utility.IsSameSide(player, spirit:ToPlayer()) then
                goto continue
            end
            ---特殊处理冰封术子buff
            if idx == 48 then
                m.HitWinterRestrictionChild(player, spirit:ToPlayer(), buffConfig, 49)
            end
            ---特殊处理沉默光环子buff
            if idx == 62 then
                m.HitSilenceAuraChild(player, spirit:ToPlayer(), buffConfig, 63)
            end
        end
        Game:LuaHandlePlayerAttack(player, spirit, buffConfig.name)
        :: continue ::
    end
end


---重新加载脚本事件
function m.Init()
    utility = Utility
    luaConfig = LuaConfig

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
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_36)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_49)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_50)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_51)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_53)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_46)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_57)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_39)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_58)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_33)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_34)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_60)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_61)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_37)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_38)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_35)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_63)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_64)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_30)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_31)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_32)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_45)
   PlayerManager.RefreshAttributeEvent:addAction(m.OnBuffRefreshAttribute_67)
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

---噩梦降临 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_67(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_噩梦降临_临时属性1", player:GetNumber("BUFF技能_噩梦降临_攻速减少", 0), false)
    player:SetNumber("BUFF技能_噩梦降临_临时属性2", player:GetNumber("BUFF技能_噩梦降临_防御减少", 0), false)
    player:RefreshAttribute(false)
end

---噩梦降临 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_67(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_噩梦降临_临时属性1", 0, false)
    player:SetNumber("BUFF技能_噩梦降临_临时属性2", 0, false)
    player:RefreshAttribute(false)
end

---噩梦降临 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_67(player)
    local num1 = player:GetNumber("BUFF技能_噩梦降临_临时属性1", 0)
    if num1 > 0 then
        player:SubAttr(emBaseAttr.AttackSpeed, num1);
    end
    local num2 = player:GetNumber("BUFF技能_噩梦降临_临时属性2", 0)
    if num2 > 0 then
        player:IncAttr(emBaseAttr.PerMilSubAC, math.floor(num2 * 10));
        player:IncAttr(emBaseAttr.PerMilSubMAC, math.floor(num2 * 10));
    end
end

---剑刃风暴 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_66(player, idx, buffUid)
    player:SetNumber("BUFF技能_剑刃风暴_临时属性1", player:GetNumber("BUFF技能_剑刃风暴", 0), false)
end

---剑刃风暴 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_66(player, idx, buffUid)
    local num = player:GetNumber("BUFF技能_剑刃风暴_临时属性1", 0)
    local attkPlayer = Game:GetPlayerById(player:GetNumber("BUFF技能_剑刃风暴_释放者", 0))
    if num > 0 and attkPlayer then
        player:SubHP(num, attkPlayer:GetSpiritPtr())
        attkPlayer:ShowDamage(player:Uid(), num, 0)
    end
end

---剑刃风暴 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_66(player, idx, buffUid)
    player:SetNumber("BUFF技能_剑刃风暴_临时属性1", 0, false)
end

---盾牌反射 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_45(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_盾牌反射_临时属性1", player:GetNumber("BUFF技能_盾牌反射_减少物理防御", 0), false)
    player:SetNumber("BUFF技能_盾牌反射_临时属性2", player:GetNumber("BUFF技能_盾牌反射_减少魔法防御", 0), false)
    player:SetNumber("BUFF技能_盾牌反射_临时属性3", 100, false)
    player:RefreshAttribute(false)
end

---盾牌反射 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_45(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_盾牌反射_临时属性1", 0, false)
    player:SetNumber("BUFF技能_盾牌反射_临时属性2", 0, false)
    player:SetNumber("BUFF技能_盾牌反射_临时属性3", 0, false)
    player:RefreshAttribute(false)
end

---盾牌反射 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_45(player)
    local num1 = player:GetNumber("BUFF技能_盾牌反射_临时属性1", 0)
    if num1 > 0 then
        player:IncAttr(emBaseAttr.PerMilSubAC, math.floor(num1 * 10));
    end

    local num2 = player:GetNumber("BUFF技能_盾牌反射_临时属性2", 0)
    if num2 > 0 then
        player:IncAttr(emBaseAttr.PerMilSubMAC, math.floor(num2 * 10));
    end

    local num3 = player:GetNumber("BUFF技能_盾牌反射_临时属性3", 0)
    if num3 > 0 then
        player:IncAttr(emBaseAttr.PR, num3);
    end
end

---战嚎 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_32(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_战嚎_临时属性1", player:GetNumber("BUFF技能_战嚎", 0), false)
    player:RefreshAttribute(false)
end

---战嚎 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_32(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_战嚎_临时属性1", 0, false)
    player:RefreshAttribute(false)
end

---战嚎 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_32(player)
    local num1 = player:GetNumber("BUFF技能_战嚎_临时属性1", 0)
    if num1 > 0 then
        player:IncAttr(emBaseAttr.PerMilSubDC, math.floor(num1 * 10));
        player:IncAttr(emBaseAttr.PerMilSubMC, math.floor(num1 * 10));
    end
end


---绝对防御 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_31(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_绝对防御_临时属性1", player:GetNumber("BUFF技能_绝对防御_减少移速", 0), false)
    player:SetNumber("BUFF技能_绝对防御_临时属性2", player:GetNumber("BUFF技能_绝对防御_减少攻击", 0), false)
    player:SetNumber("BUFF技能_绝对防御_临时属性3", 1000, false)
    player:RefreshAttribute(false)
end

---绝对防御 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_31(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_绝对防御_临时属性1", 0, false)
    player:SetNumber("BUFF技能_绝对防御_临时属性2", 0, false)
    player:SetNumber("BUFF技能_绝对防御_临时属性3", 0, false)
    player:RefreshAttribute(false)
end

---绝对防御 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_31(player)
    local num1 = player:GetNumber("BUFF技能_绝对防御_临时属性1", 0)
    if num1 > 0 then
        player:IncAttr(emBaseAttr.MoveSpeed,num1);
    end

    local num2 = player:GetNumber("BUFF技能_绝对防御_临时属性2", 0)
    if num2 > 0 then
        player:IncAttr(emBaseAttr.PerMilSubDC, math.floor(num2 * 10));
    end

    local num3 = player:GetNumber("BUFF技能_绝对防御_临时属性3", 0)
    if num3 > 0 then
        player:IncAttr(emBaseAttr.FinalPerMilSubDC, num3);
    end
end

---超级强化 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_30(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_超级强化_临时属性1", player:GetNumber("BUFF技能_超级强化_增加血量", 0), false)
    player:SetNumber("BUFF技能_超级强化_临时属性2", player:GetNumber("BUFF技能_超级强化_增加防御", 0), false)
    player:RefreshAttribute(false)
end

---超级强化 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_30(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_超级强化_临时属性1", 0, false)
    player:SetNumber("BUFF技能_超级强化_临时属性2", 0, false)
    player:RefreshAttribute(false)
end

---超级强化 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_30(player)
    local num1 = player:GetNumber("BUFF技能_超级强化_临时属性1", 0)
    if num1 > 0 then
        player:IncAttr(emBaseAttr.FinalPerMilHP, math.floor(num1 * 10));
    end

    local num2 = player:GetNumber("BUFF技能_超级强化_临时属性2", 0)
    if num2 > 0 then
        player:IncAttr(emBaseAttr.FinalPerMilAC, math.floor(num2 * 10));
    end
end


---沉默之火 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_65(player, idx, buffUid)
end

---沉默之火 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_65(player, idx, buffUid)
end

---燃烧爆裂 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_64(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_燃烧爆裂_临时属性1", player:GetNumber("BUFF技能_燃烧爆裂_减少魔法防御", 0), false)
    player:SetNumber("BUFF技能_燃烧爆裂_临时属性2", player:GetNumber("BUFF技能_燃烧爆裂_每秒扣除蓝量", 0), false)
    player:RefreshAttribute(false)
end

---燃烧爆裂 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_64(player, idx, buffUid)
    local num = player:GetNumber("BUFF技能_燃烧爆裂_临时属性2", 0)
    if num > 0 then
        player:SubMP(num)
    end
end

---燃烧爆裂 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_64(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_燃烧爆裂_临时属性1", 0, false)
    player:SetNumber("BUFF技能_燃烧爆裂_临时属性2", 0, false)
    player:RefreshAttribute(false)
end

---燃烧爆裂 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_64(player)
    local num1 = player:GetNumber("BUFF技能_燃烧爆裂_临时属性1", 0)
    if num1 > 0 then
        player:IncAttr(emBaseAttr.PerMilSubMAC, math.floor(num1 * 10));
    end
end

---沉默光环 子buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_63(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_沉默光环_临时属性1", player:GetNumber("BUFF技能_沉默光环_减少魔法攻击力", 0), false)
    player:SetNumber("BUFF技能_沉默光环_临时属性2", player:GetNumber("BUFF技能_沉默光环_每秒扣除蓝量", 0), false)
    player:RefreshAttribute(false)
end

---沉默光环 子buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_63(player, idx, buffUid)
    local num = player:GetNumber("BUFF技能_沉默光环_临时属性2", 0)
    if num > 0 then
        player:SubMP(num)
    end
end

---沉默光环 子buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_63(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_沉默光环_临时属性1", 0, false)
    player:SetNumber("BUFF技能_沉默光环_临时属性2", 0, false)
    player:RefreshAttribute(false)
end

---沉默光环 子buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_63(player)
    local num1 = player:GetNumber("BUFF技能_沉默光环_临时属性1", 0)
    if num1 > 0 then
        player:IncAttr(emBaseAttr.PerMilSubMC, math.floor(num1 * 10));
    end
end

---处理沉默光环子Buff
---@param player Player 释放的玩家对象
---@param otherPlayer Player 被命中的玩家对象
---@param buffConfig kx_buff_data 命中的buff
---@param idx number buff idx
function m.HitSilenceAuraChild(player, otherPlayer, buffConfig, idx)
    ---如果已经命中就不处理
    if otherPlayer:HasSkillBuff(idx) then
        return
    end
    ---@type Skill
    local skill = player:GetSkillByName_US(buffConfig.name)
    local skillDB = luaConfig.skillConfig[skill:Idx()]
     ---减少魔法攻击力
    local num1 = skillDB.attribute1[skill:Level()]
    ---每秒扣除蓝量
    local num2 = skillDB.attribute2[skill:Level()]
    otherPlayer:SetNumber("BUFF技能_沉默光环_减少魔法攻击力", num1, false)
    otherPlayer:SetNumber("BUFF技能_沉默光环_每秒扣除蓝量", num2, false)
    otherPlayer:AddBuffByName_US("SilenceAura_Child", 3, false)
end


---沉默光环 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_62(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    player:AddSkillBuff(buffConfig.name, buffUid, player:Pos_UEX(), player:Pos_UEY(), player:PosZ());
end

---沉默光环 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_62(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 6)
end

---沉默光环 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_62(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---蓄魔 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_35(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_蓄魔_临时属性1", player:GetNumber("BUFF技能_蓄魔", 0), false)
    player:RefreshAttribute(false)
end

---蓄魔 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_35(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_蓄魔_临时属性1", 0, false)
    player:RefreshAttribute(false)
end

---蓄魔 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_35(player)
    local num = player:GetNumber("BUFF技能_蓄魔_临时属性1", 0)
    if num > 0 then
        player:IncAttr(emBaseAttr.PerMilMPCost, math.floor(num * 10));
    end
end

---暴动强化 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_38(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_暴动强化_临时属性1", player:GetNumber("BUFF技能_暴动强化", 0), false)
    player:RefreshAttribute(false)
end

---暴动强化 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_38(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_暴动强化_临时属性1", 0, false)
    player:RefreshAttribute(false)
end

---暴动强化 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_38(player)
    local num = player:GetNumber("BUFF技能_暴动强化_临时属性1", 0)
    if num > 0 then
        player:IncAttr(emBaseAttr.PerMilDC, math.floor(num * 10));
        player:SetAttr(emBaseAttr.BlockRate, 0)
    end
end

---触不可及 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_37(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_致命攻击_临时属性1", player:GetNumber("BUFF技能_触不可及", 0), false)
    player:RefreshAttribute(false)
end

---触不可及 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_37(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_致命攻击_临时属性1", 0, false)
    player:RefreshAttribute(false)
end

---触不可及 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_37(player)
    local num = player:GetNumber("BUFF技能_致命攻击_临时属性1", 0)
    if num > 0 then
        player:IncAttr(emBaseAttr.BlockRate, num);
    end
end

---致命攻击 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_61(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_致命攻击_临时属性1", player:GetNumber("BUFF技能_致命攻击", 0), false)
    player:RefreshAttribute(false)
end

---致命攻击 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_61(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_致命攻击_临时属性1", 0, false)
    player:RefreshAttribute(false)
end

---致命攻击 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_61(player)
    local cri = player:GetNumber("BUFF技能_致命攻击_临时属性1", 0)
    if cri > 0 then
        player:IncAttr(emBaseAttr.CritRate, math.floor(cri * 10));
    end
end

---狂暴光环队友 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_60(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_狂暴光环_临时属性1", player:GetNumber("BUFF技能_狂暴光环_回避率", 0), false)
    player:SetNumber("BUFF技能_狂暴光环_临时属性2", player:GetNumber("BUFF技能_狂暴光环_必杀率", 0), false)
    player:RefreshAttribute(false)
end

---狂暴光环队友 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_60(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_狂暴光环_临时属性1", 0, false)
    player:SetNumber("BUFF技能_狂暴光环_临时属性2", 0, false)
    player:RefreshAttribute(false)
end

---狂暴光环队友 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_60(player)
    local dodge = player:GetNumber("BUFF技能_狂暴光环_临时属性1", 0)
    local cri = player:GetNumber("BUFF技能_狂暴光环_临时属性2", 0)
    if cri > 0 then
        player:IncAttr(emBaseAttr.CritRate, math.floor(cri * 10));
    end

    if dodge > 0 then
        player:IncAttr(emBaseAttr.BlockRate, dodge);
    end
end

---狂暴光环 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_34(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_狂暴光环_临时属性1", player:GetNumber("BUFF技能_狂暴光环_回避率", 0), false)
    player:SetNumber("BUFF技能_狂暴光环_临时属性2", player:GetNumber("BUFF技能_狂暴光环_必杀率", 0), false)
    player:RefreshAttribute(false)
end

---狂暴光环 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_34(player, idx, buffUid)
    ---没有队伍不处理
    if not player:HasTeam() then
        return
    end

    local vTeam = player:GetTeamNumbers()
    for i = 1, #vTeam, 1 do
        local otherPlayer = vTeam[i]
        if otherPlayer:HasSkillBuff(60) then
            goto continue
        end
        if otherPlayer:HasSkillBuff(34) then
            goto continue
        end
        local range = Utility.Distance(player:PosX(), player:PosY(), otherPlayer:PosX(), otherPlayer:PosY())
        if range <= 50 then
            otherPlayer:SetNumber("BUFF技能_狂暴光环_回避率", player:GetNumber("BUFF技能_狂暴光环_回避率", 0), false)
            otherPlayer:SetNumber("BUFF技能_狂暴光环_必杀率", player:GetNumber("BUFF技能_狂暴光环_必杀率", 0), false)
            otherPlayer:AddBuffByIdx(60, 15, false)
        end
        ::continue::
    end
end

---狂暴光环 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_34(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_狂暴光环_临时属性1", 0, false)
    player:SetNumber("BUFF技能_狂暴光环_临时属性2", 0, false)
    player:RefreshAttribute(false)
end

---狂暴光环 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_34(player)
    local dodge = player:GetNumber("BUFF技能_狂暴光环_临时属性1", 0)
    local cri = player:GetNumber("BUFF技能_狂暴光环_临时属性2", 0)
    if cri > 0 then
        player:IncAttr(emBaseAttr.CritRate, math.floor(cri * 10));
    end

    if dodge > 0 then
        player:IncAttr(emBaseAttr.BlockRate, dodge);
    end
end


---死亡之触 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_59(player, idx, buffUid)
end

---死亡之触 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_59(player, idx, buffUid)
    local num = player:GetNumber("BUFF技能_死亡之触", 0)
    local playerId = player:GetNumber("BUFF技能_死亡之触_施法者", 0)
    local attkPlayer = Game:GetPlayerById(playerId)
    if attkPlayer == nil then
        return
    end
    if num > 0 then
        player:SubHP(num, attkPlayer:GetSpiritPtr())
    end
end

---死亡之触 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_59(player, idx, buffUid)
end


---神速 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_33(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_神速_临时属性1", player:GetNumber("BUFF技能_神速_必杀率", 0), false)
    player:SetNumber("BUFF技能_神速_临时属性2", player:GetNumber("BUFF技能_神速_回避率", 0), false)
    player:SetNumber("BUFF技能_神速_临时属性3", player:GetNumber("BUFF技能_神速_移动速度", 0), false)
    player:RefreshAttribute(false)
end


---神速 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_33(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_神速_临时属性1", 0, false)
    player:SetNumber("BUFF技能_神速_临时属性2", 0, false)
    player:SetNumber("BUFF技能_神速_临时属性3", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---神速 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_33(player)
    local cri = player:GetNumber("BUFF技能_神速_临时属性1", 0)
    local dodge = player:GetNumber("BUFF技能_神速_临时属性2", 0)
    local moveSpeed = player:GetNumber("BUFF技能_神速_临时属性3", 0)
    if cri > 0 then
        player:IncAttr(emBaseAttr.CritRate, math.floor(cri * 10));
    end

    if dodge > 0 then
        player:IncAttr(emBaseAttr.BlockRate, dodge);
    end

    if moveSpeed > 0 then
        player:IncAttr(emBaseAttr.MoveSpeed, moveSpeed);
    end
end

---狂暴 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_58(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_狂暴_临时属性1", player:GetNumber("BUFF技能_狂暴_攻击力", 0), false)
    player:SetNumber("BUFF技能_狂暴_临时属性2", player:GetNumber("BUFF技能_狂暴_攻击速度", 0), false)
    player:RefreshAttribute(false)
end


---狂暴 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_58(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_狂暴_临时属性1", 0, false)
    player:SetNumber("BUFF技能_狂暴_临时属性2", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---狂暴 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_58(player)
    local atk = player:GetNumber("BUFF技能_狂暴_临时属性1", 0)
    local atkSpeed = player:GetNumber("BUFF技能_狂暴_临时属性2", 0)
    if atk > 0 then
        player:IncAttr(emBaseAttr.MinDC, atk);
        player:IncAttr(emBaseAttr.MaxDC, atk);
    end
    if atkSpeed > 0 then
        player:IncAttr(emBaseAttr.AttackSpeed, atkSpeed);
    end
end

---不净根除 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_39(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_不净根除_临时属性", player:GetNumber("BUFF技能_不净根除", 0), false)
    player:RefreshAttribute(false)
end


---不净根除 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_39(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_不净根除_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---不净根除 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_39(player)
    local val = player:GetNumber("BUFF技能_不净根除_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.MAC, val);
    end
end

---束缚之箭 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_57(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_束缚之箭_临时属性", player:GetNumber("BUFF技能_束缚之箭", 0), false)
    player:RefreshAttribute(false)
end


---束缚之箭 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_57(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_束缚之箭_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---束缚之箭 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_57(player)
    local val = player:GetNumber("BUFF技能_束缚之箭_临时属性", 0)
    if val > 0 then
        player:SubAttr(emBaseAttr.MoveSpeed, val);
    end
end


---乾坤大挪移 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_46(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_乾坤大挪移_临时属性", player:GetNumber("BUFF技能_乾坤大挪移", 0), false)
    player:RefreshAttribute(false)
end


---乾坤大挪移 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_46(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_乾坤大挪移_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---乾坤大挪移 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_46(player)
    local val = player:GetNumber("BUFF技能_乾坤大挪移_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.BlockRate, val * 10);
    end
end

---毒箭术 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_56(player, idx, buffUid)
end

---毒箭术 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_56(player, idx, buffUid)
    local num = player:GetNumber("BUFF技能_毒箭术", 0)
    local playerId = player:GetNumber("BUFF技能_毒箭术_施法者", 0)
    local attkPlayer = Game:GetPlayerById(playerId)
    if attkPlayer == nil then
        return
    end
    if num > 0 then
        local damage = math.floor(player:GetAttr(emBaseAttr.MaxHP) * num / 100)
        player:SubHP(damage, attkPlayer:GetSpiritPtr()) 
    end
end

---毒箭术 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_56(player, idx, buffUid)
end

---致盲术 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_55(player, idx, buffUid)
    player:OpenGrowBlind(250, 250, 250, 240)
end


---致盲术 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_55(player, idx, buffUid)
    player:CloseGrowBlind()
end

---冰冻 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_54(player, idx, buffUid)

end


---冰冻 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_54(player, idx, buffUid)

end

---冻汽反射_减攻速 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_53(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_冻汽反射_临时属性", player:GetNumber("BUFF技能_冻汽反射", 0), false)
    player:RefreshAttribute(false)
end


---冻汽反射_减攻速 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_53(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_冻汽反射_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---冻汽反射_减攻速 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_53(player)
    local val = player:GetNumber("BUFF技能_冻汽反射_临时属性", 0)
    if val > 0 then
        player:SubAttr(emBaseAttr.AttackSpeed, val);
    end
end

---冻汽反射 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_52(player, idx, buffUid)

end


---冻汽反射 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_52(player, idx, buffUid)

end

---水之冷却 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_51(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_水之冷却_临时属性", player:GetNumber("BUFF技能_水之冷却", 0), false)
    player:SetNumber("BUFF技能_水之冷却_临时属性2", player:GetBuffStackCount(idx), false)
    player:RefreshAttribute(false)
end


---水之冷却 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_51(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_水之冷却_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---水之冷却 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_51(player)
    local val = player:GetNumber("BUFF技能_水之冷却_临时属性", 0)
    if val > 0 then
        local count =  player:GetNumber("BUFF技能_水之冷却_临时属性2", 1)
        local perMilSubMAC =  math.floor(val * 10 * count)
        player:IncAttr(emBaseAttr.PerMilSubMAC, perMilSubMAC);
    end
end

---冰刺 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_50(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_冰刺_临时属性", player:GetNumber("BUFF技能_冰刺", 0), false)
    player:RefreshAttribute(false)
end


---冰刺 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_50(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_冰刺_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---冰刺 buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_50(player)
    local val = player:GetNumber("BUFF技能_冰刺_临时属性", 0)
    if val > 0 then
        local moveSpeed = player:GetAttr(emBaseAttr.MoveSpeed)
        player:SubAttr(emBaseAttr.MoveSpeed, math.floor(moveSpeed * val / 100));
    end
end

---冰封术 子buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_49(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_冰封术_临时属性", player:GetNumber("BUFF技能_冰封术", 0), false)
    player:RefreshAttribute(false)
end


---冰封术 子buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_49(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_冰封术_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---冰封术 子buff 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_49(player)
    local val = player:GetNumber("BUFF技能_冰封术_临时属性", 0)
    if val > 0 then
        local moveSpeed = player:GetAttr(emBaseAttr.MoveSpeed)
        player:SubAttr(emBaseAttr.MoveSpeed, math.floor(moveSpeed * val / 100));
    end
end

---冰封术 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_48(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    player:AddSkillBuff(buffConfig.name, buffUid, player:Pos_UEX(), player:Pos_UEY(), player:PosZ());
end

---处理冰封术子Buff
---@param player Player 释放的玩家对象
---@param otherPlayer Player 被命中的玩家对象
---@param buffConfig kx_buff_data 命中的buff
---@param idx number buff idx
function m.HitWinterRestrictionChild(player, otherPlayer, buffConfig, idx)
    ---如果已经命中就不处理
    if otherPlayer:HasSkillBuff(idx) then
        return
    end
    local skill = player:GetSkillByName_US(buffConfig.name)
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    local num = math.floor(skillDB.attribute1[skill:Level()] / 10)
    otherPlayer:SetNumber("BUFF技能_冰封术", num, false)
    otherPlayer:AddBuffByName_US("WinterRestriction_Child", 15, false)
end

---冰封术 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_48(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 6)
end

---冰封术 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_48(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---封魔 技能开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_36(player, idx, buffUid)
    ---显式调用刷新属性(重新计算人物属性)
    player:SetNumber("BUFF技能_封魔_临时属性", player:GetNumber("BUFF技能_封魔_攻击力减少", 0), false)
    player:RefreshAttribute(false)
end

---封魔 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_36(player, idx, buffUid)
    ---buff技能需要将变量清0
    player:SetNumber("BUFF技能_封魔_临时属性", 0, false)
    ---显式调用刷新属性(重新计算人物属性)
    player:RefreshAttribute(false)
end

---封魔 刷新属性回调
---@param player Player
function m.OnBuffRefreshAttribute_36(player)
    local val = player:GetNumber("BUFF技能_封魔_临时属性", 0)
    if val > 0 then
        player:IncAttr(emBaseAttr.PerMilSubDC, val)
        player:IncAttr(emBaseAttr.PerMilSubMC, val)
        player:IncAttr(emBaseAttr.PerMilMPCost, 1000)
    end
end

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

---移动速度卷轴Buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_1(player, idx, buffUid)
    player:SetNumber("移动速度卷轴", 30, false)
    player:RefreshAttribute(false)
    player:SendMsg(3, "提示：移动速度提高了！")
end

---移动速度卷轴Buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_1(player, idx, buffUid)
    player:SetNumber("移动速度卷轴", 0, false)
    player:RefreshAttribute(false)

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
    player:SetNumber("攻击速度卷轴", 15, false)
    player:RefreshAttribute(false)
    player:SendMsg(3, "提示：攻击速度提高了！")
end

---攻击速度卷轴Buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_2(player, idx, buffUid)
    player:SetNumber("攻击速度卷轴", 0, false)
    player:RefreshAttribute(false)

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
    player:AddSkillBuff(buffConfig.name, buffUid, player:Pos_UEX(), player:Pos_UEY(), player:PosZ());
end

---大地之斩 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_3(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 4)
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
    ContinuousDamage(player, idx, buffUid, 4)
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
    player:AddSkillBuff(buffConfig.name, buffUid, player:Pos_UEX(), player:Pos_UEY(), player:PosZ());
end

---天神下凡 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_5(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 4)
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
    ContinuousDamage(player, idx, buffUid, 5)
end

---暴风雪 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_7(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---流星雨 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_8(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    local _, x, y, z =player:GetBuffPos(buffUid);
    if x == 0 then
        return
    end
    log("BuffUid = " .. buffUid)
    player:AddSkillBuff(buffConfig.name, buffUid, x, y, z);
end

---流星雨 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_8(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 5)
end

---流星雨 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_8(player, idx, buffUid)
    player:RemoveSkillBuff(buffUid)
end

---火雨 buff 开始
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffStart_9(player, idx, buffUid)
    local buffConfig = LuaConfig.buffConfig[idx]
    local _, x, y, z =player:GetBuffPos(buffUid);
    if x == 0 then
        return
    end
    player:AddSkillBuff(buffConfig.name, buffUid, x, y, z);
end

---火雨 buff 持续触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffTriggered_9(player, idx, buffUid)
    ContinuousDamage(player, idx, buffUid, 5)
end

---火雨 buff 到期触发
---@param player Player 玩家对象
---@param idx number buff idx
function m.OnBuffExpired_9(player, idx, buffUid)
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