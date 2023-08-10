---道具升级
local m = {}

--前置申明 在Init函数中初始化
local itemConfig

---@type kx_item_attr_upgrade_data[][]
local config_level10 = {}

local function GetConfig(itemLevel)
    if itemLevel <= 10 then
        return config_level10
    end
end

function m.Init()
    itemConfig = LuaConfig.itemConfig

    local itemAttrUpgrade = LuaConfig.GetItemAttrUpgrade()
    for _, value in ipairs(itemAttrUpgrade) do
        if value.item_level == 10 then
            if config_level10[value.wear_mask] == nil then
                config_level10[value.wear_mask] = {}
            end
            table.insert(config_level10[value.wear_mask], value)
        end
    end
end

---刷新装备附加描述
---@param item Item 物品对象
---@param itemDB kx_item_data 物品配置
local function RefreshItemAttr(item, itemDB)
    local cutCount = item:GetAttrCustomCount()
    if cutCount > 0 and cutCount <= 2 then
        item:SetName(string.format("魔法 %s", itemDB.name))
        item:SetColor(emItemColor.Green)
           
    elseif cutCount > 2 and cutCount <= 4  then
        item:SetName(string.format("神圣 %s", itemDB.name))
        item:SetColor(emItemColor.Golden)
    elseif cutCount > 4 and cutCount <= 6  then
        item:SetName(string.format("白金 %s", itemDB.name))
        item:SetColor(emItemColor.Purple)
    end
end

---通过属性名字获取属性配置
---@param tabConfig kx_item_attr_upgrade_data[][]
---@param wearMask number
---@param attrName string
---@return kx_item_attr_upgrade_data
local function GetAttrInTab(tabConfig, wearMask, attrName)
    local tab = tabConfig[wearMask]
    for index, value in ipairs(tab) do
        if value.name == attrName then
            return value
        end
    end
    return nil
end

---装备新增一条自定义属性
---@param item Item 被升级的物品
---@param gemConfig kx_gem_data 使用的宝石
---@return boolean
function m.ItemAddAttr(player, item, gemConfig)
    --判断宝石能否添加属性
    local cutCount = item:GetAttrCustomCount()
     if cutCount >= gemConfig.max_count
    or cutCount < gemConfig.min_count then
        player:SendMsg(3, string.format("提示：使用的 %s 要求物品属性数量在%s和%s之间！", 
        gemConfig.name, gemConfig.min_count, gemConfig.max_count))
        return false
    end

    local itemDB = itemConfig[item:Idx()]
    local tabLevelConfig = GetConfig(itemDB.level)
    local tabAttrConfig = tabLevelConfig[itemDB.wear_pos_mask]

    local count = 0
    local attrConfig = nil
    local isSuccess = false
    local tablItemAttrName = item:GetVecAttrName()

    --循环获取可以为装备附魔的属性 如果超过4次未成功 则失败
    while isSuccess == false and count < 4 do
        count = count + 1
        --获取一条随机的附加属性
        local ranIndex = Random(#tabAttrConfig) + 1
        log(string.format("ItemAddAttr ranIndex %s", ranIndex) )
        attrConfig = tabAttrConfig[ranIndex]
        --如果附加的随机属性已存在 则跳过本次循环
        if Utility.VecIndexOf(tablItemAttrName, attrConfig.name) > 0 then
            goto continue
        end

        isSuccess = true
        ::continue::
    end

    if isSuccess == false then
        player:SendMsg(3, "提示：无变化...")
        return true
    end

    item:AddAttrCustom(attrConfig.name);
    RefreshItemAttr(item, itemDB)
    player:SendMsg(3, "提示：在神秘力量得祝福下，获得了魔法属性...")
    return true
end

---删除一个物品的属性
---@param item Item
---@param gemConfig kx_gem_data 使用的宝石
---@param select number
---@return boolean
function m.ItemDeleteAttr(player, item, gemConfig, select)
    item:RemoveAttrCustom(select)
    RefreshItemAttr(item,  itemConfig[item:Idx()])
    player:SendMsg(3, "提示：属性消失了...")
    return true
end

---装备升级一条属性 当select为nil 随机升级一条属性
---@param item Item 被升级的物品
---@param gemConfig kx_gem_data 使用的宝石
---@param select number 玩家选择的属性下标 默认-1 
---@return boolean
function m.ItemAttrUpgrade(player, item, gemConfig, select)
    local count = item:GetAttrCustomCount()
    if Random(5) == 0 then
        player:SendMsg(3, "提示：无变化...")
        return true
    end

    if select == -1 then
        select = Random(count)
    end


    local itemDB = itemConfig[item:Idx()]
    local tablItemAttrName = item:GetVecAttrName()
    local tablItemAttrLevel = item:GetVecAttrLevel()
    local attrName = tablItemAttrName[select + 1]
    local attrLevel = tablItemAttrLevel[select + 1]
    local config = GetAttrInTab(GetConfig(itemDB.level), itemDB.wear_pos_mask, attrName)


    --选择的属性位置超过了属性总数
    if select >=  #tablItemAttrName then
        player:SendMsg(3, "提示：无变化...")
        return true
    end

    --小于安全线成功
    if attrLevel <= config.safety_line then
        item:UpgradeAttrCustom(select)
        player:SendMsg(3, "提示：魔法属性提高了...")
        return true
    end

    --超过了最高等级
    if attrLevel >= config.max_level then
        player:SendMsg(3, "提示：无变化...")
        return true
    end

    --超过了最高等级
    if gemConfig.name == "幻想的凯旋宝石"
      and attrLevel >= config.bbk_line then
            player:SendMsg(3, "提示：无变化...")
            return true
    end

    local rate = config.rate[attrLevel - config.safety_line]

    local ranNumber = Random(rate * 10000)
    --todo 次数 baseRate可附加其他成功率
    local baseRate = 10000

    if ranNumber > baseRate  then
        if gemConfig.name == "幻想的凯旋宝石" then
            player:SendMsg(3, "提示：您的道具受到神秘的力量庇佑...")
            return true
        end
        player:TakeItem(item:Id(), 1)
        player:SendMsg(3, "提示：物品消失了...")
        return true
    end

    item:UpgradeAttrCustom(select)
    player:SendMsg(3, "提示：魔法属性提高了...")
    return true
end


ItemUpgrade = m
return ItemUpgrade