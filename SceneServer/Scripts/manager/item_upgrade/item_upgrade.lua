---道具升级
local m = {}

--前置申明 在Init函数中初始化
---@type kx_item_data[]
local itemConfig

---10级及其一下装备附魔配置
---@type kx_item_attr_upgrade_data[][]
local config_level10 = {}

---11级装备附魔配置
---@type kx_item_attr_upgrade_data[][]
local config_level11 = {}


---12级装备附魔配置
---@type kx_item_attr_upgrade_data[][]
local config_level12 = {}

---13级装备附魔配置
---@type kx_item_attr_upgrade_data[][]
local config_level13 = {}

---14级装备附魔配置
---@type kx_item_attr_upgrade_data[][]
local config_level14 = {}


---判断是否属于13类型
---@param itemLevel number 物品配置类型
---@param itemMode3 number 物品附加字段
---@return boolean
local function IsLevel13(itemLevel, itemMode3)
    return (itemLevel == 17 and (itemMode3 == nil or itemMode3 == 0))
end

---判断是否属于14类型
---@param itemLevel number 物品配置类型
---@param itemMode3 number 物品附加字段
---@return boolean
local function IsLevel14(itemLevel, itemMode3)
    return ((itemLevel == 18) or (itemMode3 ~= nil and itemMode3 == 14 and itemLevel == 17))
end

---获取装备的附魔配置表
---@param itemLevel number 物品配置类型
---@param itemMode3 number 物品附加字段
---@return kx_item_attr_upgrade_data[][]
local function GetConfig(itemLevel, itemMode3)
    if itemLevel <= 10 then
        return config_level10
    elseif itemLevel == 11  then
        return config_level11
    elseif itemLevel == 12  then
        return config_level12
    elseif IsLevel13(itemLevel, itemMode3)  then
        return config_level13
    elseif IsLevel14(itemLevel, itemMode3)  then
        return config_level14
    end
    return nil
end

---重新加载脚本后执行此方法
function m.Init()
    --将全局表缓存到当前文件内用于提高性能
    itemConfig = LuaConfig.itemConfig

    --获取所有的附魔配置
    local itemAttrUpgrade = LuaConfig.GetItemAttrUpgrade()
    --遍历所有的附魔配置
    --将附魔配置重新排列组合
    --组装完成后的数据结构
    --[[
        --10级以及一下的附魔属性
        config_level10 = {
            --穿戴位置为武器(64)的附魔属性
            [64] = {
                ...
            }
        }
    ]]
    for _, value in ipairs(itemAttrUpgrade) do
        if value.item_level == 10 then
            if config_level10[value.wear_mask] == nil then
                config_level10[value.wear_mask] = {}
            end
            table.insert(config_level10[value.wear_mask], value)
        elseif value.item_level == 11 then
            if config_level11[value.wear_mask] == nil then
                config_level11[value.wear_mask] = {}
            end
            table.insert(config_level11[value.wear_mask], value)
        elseif value.item_level == 12 then
            if config_level12[value.wear_mask] == nil then
                config_level12[value.wear_mask] = {}
            end
            table.insert(config_level12[value.wear_mask], value)
        elseif IsLevel13(value.item_level, value.item_mode3) then
            if config_level13[value.wear_mask] == nil then
                config_level13[value.wear_mask] = {}
            end
            table.insert(config_level13[value.wear_mask], value)
        elseif IsLevel14(value.item_level, value.item_mode3) then     
            if config_level14[value.wear_mask] == nil then
                config_level14[value.wear_mask] = {}
            end
            table.insert(config_level14[value.wear_mask], value)
        end
        ::continue::
    end
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

---刷新装备附加描述
---@param item Item 物品对象
---@param itemDB kx_item_data 物品配置
local function RefreshItemAttr(item, itemDB)
    local cutCount = item:GetAttrCustomCount()
    if itemDB.level > 10 and itemDB.stdmode == "Jewelry" then
        item:SetName(itemDB.name)
        item:SetColor(emItemColor.DarkGold)
    elseif cutCount > 0 and cutCount <= 2 then
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

--处理11装备 满足使用返回true 不满足返回fasle
---@param item any
---@param gemConfig any
local function HandleLevel11(item, gemConfig)
    local itemDB = itemConfig[item:Idx()]

    if itemDB.level ~= 11 
    and gemConfig.name == "青之泪" then
        return false
    end

    if itemDB.level ~= 11 
    and gemConfig.name == "红色荣誉" then
        return false
    end

    if itemDB.level ~= 11 then
        return true
    end

    if (itemDB.wear_pos_mask == 64 
    or itemDB.wear_pos_mask == 256) 
    and gemConfig.name == "青之泪"  then
        return true
    end

    if gemConfig.name == "红色荣誉" then
        return true
    end

    return false
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

    --11装备无法移除附魔属性
    if itemConfig[item:Idx()].level == 11 then
        player:SendMsg(3, string.format("提示：%s 无法使用 %s！", itemConfig[item:Idx()].name, gemConfig.name))
        return false
    end

    local itemDB = itemConfig[item:Idx()]
    local tabLevelConfig = GetConfig(itemDB.level, itemDB.mode3)
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

        ---跳过装备升级 todo 临时解决办法 后期将通过权重值控制
        if attrConfig.name == "装备升级"  then
            goto continue
        end

        --如果附加的随机属性已存在 则跳过本次循环
        if Utility.VecIndexOf(tablItemAttrName, attrConfig.name) > 0 then
            goto continue
        end

        isSuccess = true
        ::continue::
    end

    if isSuccess == false then
        player:SendMsg(3, "提示：无变化...")
        return false
    end
    log(string.format("ItemAddAttr idx %s", attrConfig.idx))
    item:AddAttrCustom(attrConfig.name, 1);
    RefreshItemAttr(item, itemDB)
    player:SendMsg(3, "提示：在神秘力量得祝福下，获得了魔法属性...")
    return false
end

---删除一个物品的属性
---@param item Item
---@param gemConfig kx_gem_data 使用的宝石
---@param select number
---@return boolean
function m.ItemDeleteAttr(player, item, gemConfig, select)
    local itemDB = itemConfig[item:Idx()]
    --11装备无法移除附魔属性
    if itemDB.level == 11 then
        player:SendMsg(3, string.format("提示：%s 无法使用 %s！", itemDB.name, gemConfig.name))
        return false
    end

    item:RemoveAttrCustom(select)
    RefreshItemAttr(item,  itemDB)
    player:SendMsg(3, "提示：属性消失了...")
    return false
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
        return false
    end

    if select == -1 then
        select = Random(count)
    end

    local itemDB = itemConfig[item:Idx()]
    local tablItemAttrName = item:GetVecAttrName()
    local tablItemAttrLevel = item:GetVecAttrLevel()
    local attrName = tablItemAttrName[select + 1]
    local attrLevel = tablItemAttrLevel[select + 1]
    local config = GetAttrInTab(GetConfig(itemDB.level, itemDB.mode3), itemDB.wear_pos_mask, attrName)

    if not HandleLevel11(item, gemConfig) then
        player:SendMsg(3, string.format("提示：%s 无法使用 %s！", itemDB.name, gemConfig.name))
        return false
    end

    --选择的属性位置超过了属性总数
    if select >=  #tablItemAttrName then
        player:SendMsg(3, "提示：无变化...")
        return false
    end

    --小于安全线成功
    if attrLevel <= config.safety_line then
        item:UpgradeAttrCustom(select, 0)
        player:SendMsg(3, "提示：魔法属性提高了...")
        return false
    end

    --超过了最高等级
    if attrLevel >= config.max_level then
        player:SendMsg(3, "提示：无变化...")
        return false
    end

    --使用BBK超过bbk上线
    if gemConfig.is_bbk and attrLevel >= config.bbk_line then
            player:SendMsg(3, "提示：无变化...")
            return false
    end

    local rate = config.rate[attrLevel - config.safety_line]
    local ranNumber = Random(rate * 10000)
    local baseRate = 10000

    if  player:GetNumber("管理员_权限等级", 0) == 10 then
        ranNumber = ranNumber / 100
    end
    
    --todo 此处 baseRate 可附加其他成功率
    --例如 当前地图加成 1000点成功率 baseRate + 1000

    if ranNumber > baseRate  then
        if gemConfig.is_bbk then
            player:SendMsg(3, "提示：您的道具受到神秘的力量庇佑...")
            return false
        end
        player:TakeItem(item:Id(), 1)
        player:SendMsg(3, "提示：物品消失了...")
        return false
    end

    item:UpgradeAttrCustom(select)
    player:SendMsg(3, "提示：魔法属性提高了...")
    return false
end

---将指定装备满增幅
---@param player Player
---@param item Item
---@param level number
function m.FullEnhancement(player, item, level)
    local itemDB = itemConfig[item:Idx()]
    local tablItemAttrName = item:GetVecAttrName()
    local tablItemAttrLevel = item:GetVecAttrLevel()
    for i = 1, #tablItemAttrName, 1 do
        local attrName = tablItemAttrName[i]
        local attrLevel = tablItemAttrLevel[i]
        local config = GetAttrInTab(GetConfig(itemDB.level, itemDB.mode3), itemDB.wear_pos_mask, attrName)
        if attrLevel < level then
            item:UpgradeAttrCustom(i - 1, level > config.bbk_line and config.bbk_line or level)
        end
    end
end

---装备品质提升
---@param player Player
---@param item Item
---@param gemConfig kx_gem_data
---@return boolean
function m.ItemQualityUpgrade(player, item, gemConfig)
    local itemDB = itemConfig[item:Idx()]
    local config = GetAttrInTab(GetConfig(itemDB.level, itemDB.mode3), itemDB.wear_pos_mask, "装备升级")

    --未获取到配置表
    if config == nil then
        warn(string.format("Lua ItemQualityUpgrade warn config == nil itemIdx %s", item:Idx()))
        return false
    end

    ---获取到装备品质 减去1 乘以100 得到装备等级
    local currentQuality = item:Quality()
    local level = (currentQuality - 1) * 100
    level = math.ceil(level <= 0 and 1 or level)

    if level >= config.max_level then
        player:SendMsg(3, "无变化...")
        return false
    end

    local rate = config.rate[level - config.safety_line]
    local ranNumber = Random(rate * 10000)
    local baseRate = 10000

    if  player:GetNumber("管理员_权限等级", 0) == 10 then
        ranNumber = ranNumber / 100
    end

    --todo 此处 baseRate 可附加其他成功率
    --例如 当前地图加成 1000点成功率 baseRate + 1000
    if ranNumber > baseRate  then
        if gemConfig.is_bbk then
            item:SetQuality(currentQuality - 0.01)
            player:SendMsg(3, "提示：魔法属性降低了...")
            return false
        end
        player:TakeItem(item:Id(), 1)
        player:SendMsg(3, "提示：物品消失了...")
        return false
    end

    item:SetQuality(currentQuality + 0.01)
    player:SendMsg(3, "提示：魔法属性提高了...")
    return false
end


ItemUpgrade = m
return ItemUpgrade