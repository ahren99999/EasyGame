

# Spirit 类型

## 简介
Spirit 是一个对象类型，具有以下方法：

- `spirit:Id()` 获取分布式唯一ID
- `spirit:Name()` 获取名字
- `spirit:SceneName()` 获取场景名字
- `spirit:PosX()` 获取X坐标
- `spirit:PosY()` 获取Y坐标
- `spirit:Dir()` 获取方向
- `spirit:Uid()` 获取场景Uid 重启场景服务器将发生改变
- `spirit:VD()` 可视距离
- `spirit:IsPlayer()` 是否是玩家对象
- `spirit:IsMonster()` 是否是怪物对象
- `spirit:IsSkill()` 是否是技能对象
- `spirit:IsItem()` 是否是道具
- `spirit:ToPlayer()` 类型转换为玩家对象
- `spirit:ToMonster()` 类型转换为怪物对象
- `spirit:ToSkill()` 类型转换为技能对象
- `spirit:ToItem()` 类型转换为道具对象
- `spirit:GetBool(key, def)` 获取自定义bool类型变量值
- `spirit:SetBool(key, val, isSave)` 设置自定义bool类型变量值
- `spirit:GetString(key, def)` 获取自定义string类型变量值
- `spirit:SetString(key, val, isSave)` 设置自定义string类型变量值
- `spirit:GetNumber(key, def)` 获取自定义int64类型变量值
- `spirit:SetNumber(key, val, isSave)` 设置自定义int64类型变量值

### 详细介绍
```lua

-- 获取分布式唯一ID
-- @param spirit Spirit
-- @return int64
function GetSpiritId(spirit)
    return spirit:Id()
end

-- 获取名字
-- @param spirit Spirit
-- @return string
function GetSpiritName(spirit)
    return spirit:Name()
end

-- 获取场景名字
-- @param spirit Spirit
-- @return string
function GetSpiritSceneName(spirit)
    return spirit:SceneName()
end

-- 获取X坐标
-- @param spirit Spirit
-- @return int32
function GetSpiritPosX(spirit)
    return spirit:PosX()
end

-- 获取Y坐标
-- @param spirit Spirit
-- @return int32
function GetSpiritPosY(spirit)
    return spirit:PosY()
end

-- 获取方向
-- @param spirit Spirit
-- @return float
function GetSpiritDir(spirit)
    return spirit:Dir()
end

-- 获取场景Uid 重启场景服务器将发生改变
-- @param spirit Spirit
-- @return uint32
function GetSpiritUid(spirit)
    return spirit:Uid()
end

-- 可视距离
-- @param spirit Spirit
-- @return uint8
function GetSpiritVD(spirit)
    return spirit:VD()
end

-- 是否是玩家对象
-- @param spirit Spirit
-- @return boolean
function IsSpiritPlayer(spirit)
    return spirit:IsPlayer()
end

-- 是否是怪物对象
-- @param spirit Spirit
-- @return boolean
function IsSpiritMonster(spirit)
    return spirit:IsMonster()
end

-- 是否是技能对象
-- @param spirit Spirit
-- @return boolean
function IsSpiritSkill(spirit)
    return spirit:IsSkill()
end

-- 是否是道具
-- @param spirit Spirit
-- @return boolean
function IsSpiritItem(spirit)
    return spirit:IsItem()
end

-- 类型转换为玩家对象
-- @param spirit Spirit
-- @return Player
function ToSpiritPlayer(spirit)
    return spirit:ToPlayer()
end

-- 类型转换为怪物对象
-- @param spirit Spirit
-- @return Monster
function ToSpiritMonster(spirit)
    return spirit:ToMonster()
end

-- 类型转换为技能对象
-- @param spirit Spirit
-- @return Skill
function ToSpiritSkill(spirit)
    return spirit:ToSkill()
end

-- 类型转换为道具对象
-- @param spirit Spirit
-- @return Item
function ToSpiritItem(spirit)
    return spirit:ToItem()
end

-- 获取自定义bool类型变量值
-- @param spirit Spirit 对象
-- @param key string 变量名
-- @param def boolean 默认值
-- @return boolean 存在则返回缓存值，否则返回默认值
function SpiritGetBool(spirit, key, def)
    return spirit:GetBool(key, def)
end

-- 设置自定义bool类型变量值
-- @param spirit Spirit 对象
-- @param key string 变量名
-- @param val boolean 值
-- @param isSave boolean 是否持久化(异步存入数据库)
function SpiritSetBool(spirit, key, val, isSave)
    spirit:SetBool(key, val, isSave)
end

-- 获取自定义string类型变量值
-- @param spirit Spirit 对象
-- @param key string 变量名
-- @param def string 默认值
-- @return string 存在则返回缓存值，否则返回默认值
function SpiritGetString(spirit, key, def)
    return spirit:GetString(key, def)
end

-- 设置自定义string类型变量值
-- @param spirit Spirit 对象
-- @param key string 变量名
-- @param val string 值
-- @param isSave boolean 是否持久化(异步存入数据库)
function SpiritSetString(spirit, key, val, isSave)
    spirit:SetString(key, val, isSave)
end

-- 获取自定义int64类型变量值
-- @param spirit Spirit 对象
-- @param key string 变量名
-- @param def int64 默认值
-- @return int64 存在则返回缓存值，否则返回默认值
function SpiritGetNumber(spirit, key, def)
    return spirit:GetNumber(key, def)
end

-- 设置自定义int64类型变量值
-- @param spirit Spirit 对象
-- @param key string 变量名
-- @param val int64 值
-- @param isSave boolean 是否持久化(异步存入数据库)
function SpiritSetNumber(spirit, key, val, isSave)
    spirit:SetNumber(key, val, isSave)
end




