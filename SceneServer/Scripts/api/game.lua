---物品对象
---@class Game
local Game


--- 获取服务器Code
--- @return int64_t
function Game:ServerCode()
end

--- 获取服务器Uid
--- @return int64_t
function Game:ServerUid()
end

--- 是否属于主服务器
--- @return boolean
function Game:IsMainScene()
end

--- 生成怪物
--- @param idx int32_t
--- @param x int32_t
--- @param y int32_t
--- @returns MonsterPtr
function Game:CreateMonsterByIdx(idx, x, y)
end

--- 生成怪物
--- @param name string
--- @param x int32_t
--- @param y int32_t
--- @returns MonsterPtr
function Game:CreateMonsterByName(name, x, y)
end

--- 创建一个场景
--- @param sceneName string
--- @returns ScenePtr
function Game:CreateScene(sceneName)
end

--- 获取坐标点周围所有对象
--- @param sceneName string
--- @param x int32_t
--- @param y int32_t
--- @param range int32_t
--- @returns vector<ISpirit*>
function Game:GetNearbySpirits(sceneName, x, y, range)
end

--- 发送系统消息给全服玩家
--- @param msgType uint8_t
--- @param msg string
function Game:SendMsg(msgType, msg)
end

--- 通过玩家名字获取玩家Id
--- @param name string
--- @returns int64_t
function Game:GetPlayerIdByName(name)
end

--- 通过玩家id获取玩家名字
--- @param id int64_t
--- @returns string
function Game:GetPlayerNameById(id)
end

--- 获取全部在线玩家
--- @returns int64_t
function Game:GetTotalPlayer()
end

--- 获取玩家整型自定义变量(从数据库中获取)
--- @param playerName string
--- @param key string
--- @param callback function
function Game:GetCustomVar(playerName, key, callback)
end

--- 设置玩家整型自定义变量(写入到数据库)
--- @param playerName string
--- @param key string
--- @param val int64_t
function Game:SetNumberVar(playerName, key, val)
end

--- 设置玩家字符串自定义变量(写入到数据库)
--- @param playerName string
--- @param key string
--- @param val string
function Game:SetStringVar(playerName, key, val)
end

--- 设置玩家bool自定义变量(写入到数据库)
--- @param playerName string
--- @param key string
--- @param val boolean
function Game:SetBoolVar(playerName, key, val)
end

--- 通过名字踢出玩家
--- @param nickName string
function Game:KickPlayerByName(nickName)
end

--- 通过id获取玩家对象
--- @param id int64_t
--- @returns Player
function Game:GetPlayerById(id)
end

--- 通过Uid获取玩家对象
--- @param uid uint32_t
--- @returns Player
function Game:GetPlayerByUid(uid)
end

--- 通过名字获取玩家对象
--- @param nickName string
--- @returns Player
function Game:GetPlayerByName(nickName)
end

--- 获取全局变量
--- @param key string
--- @param def boolean
--- @return boolean
function Game:GetBool(key, def)
end

--- 设置全局变量(多场景不安全)
--- @param key string
--- @param val boolean
--- @param isSave boolean
function Game:SetBool(key, val, isSave)
end

--- 获取全局变量
--- @param key string
--- @param def string
--- @return string
function Game:GetString(key, def)
end

--- 设置全局变量(多场景不安全)
--- @param key string
--- @param val string
--- @param isSave boolean
function Game:SetString(key, val, isSave)
end

--- 获取全局变量
--- @param key string
--- @param def int64_t
--- @return int64_t
function Game:GetNumber(key, def)
end

--- 设置全局变量(多场景不安全)
--- @param key string
--- @param val int64_t
--- @param isSave boolean
function Game:SetNumber(key, val, isSave)
end