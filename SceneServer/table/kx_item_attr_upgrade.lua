---自动生成的 不要手动编辑---
---@type kx_item_attr_upgrade_data[]
local _kx_item_attr_upgrade_table = 
{
[1] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 1,max_level = 12,name = '武器最小攻击力', },
[2] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 2,max_level = 12,name = '武器最大攻击力', },
[3] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 10, 15, 20 }, idx = 3,max_level = 12,name = '物理攻击力', },
[4] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 10, 18, 25 }, idx = 4,max_level = 12,name = '物理技能攻击力', },
[5] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 5,max_level = 12,name = '武器最小魔法攻击力', },
[6] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 6,max_level = 12,name = '武器最大魔法攻击力', },
[7] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 10, 15, 20 }, idx = 7,max_level = 12,name = '魔法攻击力', },
[8] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 10, 18, 25 }, idx = 8,max_level = 12,name = '魔法技能攻击力', },
[9] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 9,max_level = 12,name = '击中率', },
[10] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 10,max_level = 12,name = '贯穿力', },
[11] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 11,max_level = 12,name = '必杀成功率', },
[12] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 12,max_level = 12,name = '魔法必杀成功率', },
[13] = {wear_mask = 64,item_level = 10,safety_line = 6,bbk_line = 10,rate = { 2, 4, 6, 8, 10, 15 }, idx = 13,max_level = 12,name = '降低对方回避率', },

}

---@class kx_item_attr_upgrade_data
local kx_item_attr_upgrade_data =
{
	
---序号
idx = 0,
---属性名称
name = nil,
---道具等级
item_level = 0,
---穿戴位置
wear_mask = 0,
---安全线
safety_line = 0,
---最高等级
max_level = 0,
---BBK最高等级线
bbk_line = 0,
---成功率
rate = {},
}

local indexTable = 
{
	__index = function()
		return kx_item_attr_upgrade_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_item_attr_upgrade_table, indexTable)

kx_item_attr_upgrade_table = _kx_item_attr_upgrade_table
return _kx_item_attr_upgrade_table