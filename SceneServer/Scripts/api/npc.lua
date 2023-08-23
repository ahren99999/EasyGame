
---Npc对象
---@class Npc:Spirit
local Npc

--- 获取NPC序号
--- @return uint32_t
function Npc:Idx()
end

--- 获取NPC名称
--- @return string
function Npc:Title()
end

--- 获取NPC所在区域
--- @return string
function Npc:District()
end

--- 发起对话框
--- @param player Player
--- @param content string
--- @param select table
function Npc:Say(player, content, select)
end

--- 打开仓库
--- @param player Player
function Npc:OpenStore(player)
end

--- 打开商店
--- @param player Player
function Npc:OpenShop(player)
end