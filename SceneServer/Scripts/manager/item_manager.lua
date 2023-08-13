

local m = {}


---物品掉落触发(怪物)
---@param monster Monster 怪物对象
---@param item Item 物品对象
---@return boolean 返回false不掉落  返回true掉落
function m.OnItemDropEvent(monster, item)
    
    return true
end








---使用宝石
---@param item Item 被升级的物品
---@param gemIdx number 使用的宝石序号
---@param select number 选择的属性序号
---@return boolean 返回true使用成功扣除宝石false不满足条件不扣除任何道具
function m.UseGem(player, item, gemIdx, select)
    log("select" .. select)
    ---@type kx_gem_data
    local gemConfig = LuaConfig.gemComfig[gemIdx]
    if gemConfig.is_add then                        --增加属性宝石
        return ItemUpgrade.ItemAddAttr(player, item, gemConfig)
    end
    if gemConfig.is_delete then
        return ItemUpgrade.ItemDeleteAttr(player, item, gemConfig, select)
    end
    if gemConfig.is_upgrade then
       return ItemUpgrade.ItemAttrUpgrade(player, item, gemConfig, select)
    end
    return false
end


---使用回城卷轴
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_1(player, itemIdx)
    
    player:MapMove("Main_Scene", player:GoHomeX(), player:GoHomeY())
    return true
end

---使用鹰眼卷轴
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_2(player, itemIdx)
    player:AddBuffByIdx(11, 120, false);
    return true
end

---使用移动速度卷轴
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_4(player, itemIdx)
    player:AddBuffByIdx(1, 1800, false);
    return true
end

---使用攻击速度卷轴
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_5(player, itemIdx)
    player:AddBuffByIdx(2, 1800, false);
    return true
end

---使用干鱼片
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_6(player, itemIdx)
    if not player:IsEnablePet() then
        player:SendMsg(3, "提示：请先召唤宠物再使用...")
        return false
    end

    local hunger = player:GetPetPoint(emPetPoint.Hunger)

    if hunger > 80 then
        player:SendMsg(3, "提示：宠物饥饿值过高无法使用...")
        return false
    end

    local count = player:GetPetPoint(emPetPoint.DriedFilletCount)

    player:SetPetPoint(emPetPoint.Hunger, hunger + 35)
    player:SetPetPoint(emPetPoint.DriedFilletCount, count + 1)
    return true
end

---使用蘑菇
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_7(player, itemIdx)
    if not player:IsEnablePet() then
        player:SendMsg(3, "提示：请先召唤宠物再使用...")
        return false
    end

    local hunger = player:GetPetPoint(emPetPoint.Hunger)

    if hunger > 80 then
        player:SendMsg(3, "提示：宠物饥饿值过高无法使用...")
        return false
    end

    local count = player:GetPetPoint(emPetPoint.AgaricCount)

    player:SetPetPoint(emPetPoint.Hunger, hunger + 35)
    player:SetPetPoint(emPetPoint.AgaricCount, count + 1)

    return true
end

---使用彩虹草
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_8(player, itemIdx)
    if not player:IsEnablePet() then
        player:SendMsg(3, "提示：请先召唤宠物再使用...")
        return false
    end

    local hunger = player:GetPetPoint(emPetPoint.Hunger)

    if hunger > 80 then
        player:SendMsg(3, "提示：宠物饥饿值过高无法使用...")
        return false
    end

    local count = player:GetPetPoint(emPetPoint.ByblisCount)

    player:SetPetPoint(emPetPoint.Hunger, hunger + 35)
    player:SetPetPoint(emPetPoint.ByblisCount, count + 1)

    return true
end

---使用宝石粉末
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_9(player, itemIdx)
    if not player:IsEnablePet() then
        player:SendMsg(3, "提示：请先召唤宠物再使用...")
        return false
    end

    local hunger = player:GetPetPoint(emPetPoint.Hunger)

    if hunger > 80 then
        player:SendMsg(3, "提示：宠物饥饿值过高无法使用...")
        return false
    end

    local count = player:GetPetPoint(emPetPoint.GemstonePowderCount)

    player:SetPetPoint(emPetPoint.Hunger, hunger + 35)
    player:SetPetPoint(emPetPoint.GemstonePowderCount, count + 1)

    return true
end

---使用技能书学习技能
---@param player Player 玩家对象
---@param itemIdx number 使用的物品idx
---@return boolean 返回 true则扣除物品， 返回false 则不会扣除物品
function m.OnUseItem_10(player, itemIdx)
    local itemDB = LuaConfig.itemConfig[itemIdx]
    if itemDB == nil then
        return false
    end

    local level = itemDB.mode3
    local skillName = itemDB.mode9
    ---@type Skill
    local skill = player:GetSkillByName(skillName)

    --首次学习技能
    if skill == nil and level == 1 then
        player:AddSkill(skillName, 1);
        player:SendMsg(3, string.format("提示：恭喜您学习新技能 %s", skillName))
        return true
    end


    if skill == nil then
        player:SendMsg(3, "提示：学习失败，技能等级不符合!")
        return false
    end

    if skill:Level() ~= level -1 then
        player:SendMsg(3, "提示：学习失败，技能等级不符合!")
        return false
    end

    player:SetSkillLevel(skillName, level)
    player:RefreshAttribute(false)
    player:SendMsg(3, string.format("提示：您的技能 %s等级已提升至 %s级!", skillName, level))
    return true
end




ItemManager = m
return m