# Item 类型

## 简介
### Item 是一个道具对象类型继承Spirit对象，具有以下方法：

- `item:SetName(name)` 设置物品名字
- `item:Idx()` 序列号
- `item:Color()` 颜色
- `item:SetColor(color)` 设置颜色
- `item:Num()` 数量
- `item:SetNum(num)` 设置数量
- `item:Prices()` 价格
- `item:RepairCost()` 维修价格
- `item:OwnerName()` 归属的玩家名字
- `item:OwnerId()` 归属的玩家Id
- `item:IsLimited()` 是否限时道具
- `item:IsTradable()` 是否可以交易
- `item:IsBind()` 是否绑定
- `item:Quality()` 品质
- `item:SetQuality(quality)` 设置品质
- `item:CurDura()` 当前耐久
- `item:DuraMax()` 最大耐久
- `item:IsInStore()` 是否存在仓库中
- `item:GetVecAttrName()` 获取自定义属性名字列表
- `item:GetVecAttrLevel()` 获取自定义属性等级列表
- `item:InventoryType()` 所在的背包类型(主0、红1、黄2、蓝3)
- `item:InventoryId()` 所在的背包Id
- `item:IsPet()` 道具是否宠物
- `item:IsHide()` 道具是否隐藏在背包
- `item:ProtectedTime()` 掉落在地上受保护的时间
- `item:SetProtectedTime(val)` 设置掉落在地上受保护的时间
- `item:ChatChannel()` 聊天频道
- `item:SetChatChannel(val)` 设置聊天频道
- `item:GetAttrCustomCount()` 获取物品附加属性数量
- `item:AddAttrCustom(name)` 新增一个属性
- `item:RemoveAttrCustom(select)` 移除一个属性
- `item:UpgradeAttrCustom(select)` 升级一个属性
- `item:Pet_Name()` 获取宠物名字
- `item:Pet_Desc()` 获取宠物描述
- `item:Pet_Look()` 获取宠物外观
- `item:Pet_SetLook(val)` 设置宠物外观
- `item:Pet_GetPoint(point)` 获取宠物属性
- `item:Pet_SetPoint(point, val)` 设置宠物属性，没有刷新客户端(由外部刷新)

## 详细介绍

```lua

--- 设置物品名字
--- @param name string 物品名字
function item:SetName(name)
end

--- 序列号
--- @return int32_t 序列号
function item:Idx()
end

--- 颜色
--- @return int8_t 颜色
function item:Color()
end

--- 设置颜色
--- @param color int8_t 颜色
function item:SetColor(color)
end

--- 数量
--- @return int32_t 数量
function item:Num()
end

--- 设置数量
--- @param num int32_t 数量
function item:SetNum(num)
end

--- 价格
--- @return int64_t 价格
function item:Prices()
end

--- 维修价格
--- @return int64_t 维修价格
function item:RepairCost()
end

--- 归属的玩家名字
--- @return string 归属的玩家名字
function item:OwnerName()
end

--- 归属的玩家Id
--- @return int64_t 归属的玩家Id
function item:OwnerId()
end


--- 是否限时道具
--- @return boolean 是否限时道具
function item:IsLimited()
end

--- 是否可以交易
--- @return boolean 是否可以交易
function item:IsTradable()
end

--- 是否绑定
--- @return boolean 是否绑定
function item:IsBind()
end

--- 品质
--- @return float_t 品质
function item:Quality()
end

--- 设置品质
--- @param quality float_t 品质
function item:SetQuality(quality)
end

--- 当前耐久
--- @return float_t 当前耐久
function item:CurDura()
end

--- 最大耐久
--- @return float_t 最大耐久
function item:DuraMax()
end

--- 是否存在仓库中
--- @return boolean 是否存在仓库中
function item:IsInStore()
end

--- 获取自定义属性名字列表
--- @return vector<string> 自定义属性名字列表
function item:GetVecAttrName()
end

--- 获取自定义属性等级列表
--- @return vector<uint16_t> 自定义属性等级列表
function item:GetVecAttrLevel()
end

--- 所在的背包类型(主0、红1、黄2、蓝3)
--- @return int8_t 所在的背包类型
function item:InventoryType()
end

--- 所在的背包Id
--- @return int64_t 所在的背包Id
function item:InventoryId()
end

--- 道具是否宠物
--- @return boolean 是否宠物
function item:IsPet()
end

--- 道具是否隐藏在背包
--- @return boolean 是否隐藏在背包
function item:IsHide()
end

--- 掉落在地上受保护的时间
--- @return int32_t 掉落在地上受保护的时间
function item:ProtectedTime()
end

--- 设置掉落在地上受保护的时间
--- @param val int32_t 掉落在地上受保护的时间
function item:SetProtectedTime(val)
end

--- 聊天频道
--- @return string 聊天频道
function item:ChatChannel()
end

--- 设置聊天频道
--- @param val string 聊天频道
function item:SetChatChannel(val)
end

--- 获取物品附加属性数量
--- @return uint8_t 物品附加属性数量
function item:GetAttrCustomCount()
end

--- 新增一个属性
--- @param name string 属性名字
function item:AddAttrCustom(name)
end

--- 移除一个属性
--- @param select uint8_t 选择要移除的属性索引
function item:RemoveAttrCustom(select)
end

--- 升级一个属性
--- @param select int8_t 选择要升级的属性索引
function item:UpgradeAttrCustom(select)
end

--- 获取宠物名字
--- @return string 宠物名字
function item:Pet_Name()
end

--- 获取宠物描述
--- @return string 宠物描述
function item:Pet_Desc()
end

--- 获取宠物外观
--- @return string 宠物外观
function item:Pet_Look()
end

--- 设置宠物外观
--- @param val string 宠物外观
function item:Pet_SetLook(val)
end

--- 获取宠物属性
--- @param point int8_t 宠物属性点索引
--- @return int64_t 宠物属性值
function item:Pet_GetPoint(point)
end

--- 设置宠物属性，没有刷新客户端(由外部刷新)
--- @param point int8_t 宠物属性点索引
--- @param val int64_t 宠物属性值
function item:Pet_SetPoint(point, val)
end