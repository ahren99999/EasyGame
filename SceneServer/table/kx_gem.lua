---自动生成的 不要手动编辑---
---@type kx_gem_data[]
local _kx_gem_table = 
{
[1] = {is_select = false,is_upgrade = true,wear_mask = 158,min_count = 1,item_idx = 465,is_delete = false,is_add = false,idx = 1,min_item_level = 0,max_count = 1,max_item_level = 0,name = '红色荣誉', },
[2] = {is_select = false,is_upgrade = true,wear_mask = 320,max_count = 1,min_count = 1,item_idx = 461,is_delete = false,is_add = false,min_item_level = 0,idx = 2,max_item_level = 0,name = '青之泪', },
[3] = {is_select = false,is_upgrade = false,wear_mask = 65535,max_count = 1,min_count = 0,item_idx = 460,is_delete = false,is_add = true,min_item_level = 0,idx = 3,max_item_level = 0,name = '红宝石', },
[4] = {is_select = false,is_upgrade = true,wear_mask = 65535,max_count = 10,min_count = 1,item_idx = 459,is_delete = false,is_add = false,min_item_level = 0,idx = 4,max_item_level = 0,name = '凯旋宝石', },
[5] = {is_select = false,is_upgrade = false,wear_mask = 65535,max_count = 2,min_count = 1,item_idx = 458,is_delete = false,is_add = true,min_item_level = 0,idx = 5,max_item_level = 0,name = '金钢石', },
[6] = {is_select = false,is_upgrade = true,wear_mask = 65535,max_count = 4,min_count = 1,item_idx = 457,is_delete = false,is_add = false,min_item_level = 0,idx = 6,max_item_level = 0,name = '小型凯旋宝石', },
[7] = {is_select = false,is_upgrade = false,wear_mask = 65535,max_count = 4,min_count = 2,item_idx = 456,is_delete = false,is_add = true,min_item_level = 0,idx = 7,max_item_level = 0,name = '神圣宝石', },
[8] = {is_select = true,is_upgrade = true,wear_mask = 65535,max_count = 10,min_count = 1,item_idx = 455,is_delete = false,is_add = false,min_item_level = 0,idx = 8,max_item_level = 0,name = '超级凯旋宝石', },
[9] = {is_select = true,is_upgrade = false,wear_mask = 65535,max_count = 10,min_count = 1,item_idx = 1860,is_delete = true,is_add = false,min_item_level = 0,idx = 9,max_item_level = 0,name = '德尔福罗斯宝石', },
[10] = {is_select = false,is_upgrade = true,wear_mask = 65535,max_count = 10,min_count = 1,item_idx = 1500,is_delete = false,is_add = false,min_item_level = 0,idx = 10,max_item_level = 0,name = '幻想的凯旋宝石', },
[11] = {is_select = false,is_upgrade = false,wear_mask = 65535,max_count = 6,min_count = 4,item_idx = 2067,is_delete = false,is_add = true,min_item_level = 0,idx = 11,max_item_level = 0,name = '赫尔梅德林', },
[12] = {is_select = false,is_upgrade = false,wear_mask = 65535,max_count = 10,min_count = 0,item_idx = 1865,is_delete = false,is_add = false,min_item_level = 0,idx = 12,max_item_level = 0,name = '升级宝石', },

}

---@class kx_gem_data
local kx_gem_data =
{
	
---序号
idx = 0,
---对应物品表的索引
item_idx = 0,
---宝石名称
name = nil,
---是否会删除属性
is_delete = false,
---是否会添加属性
is_add = false,
---是否可以选择属性
is_select = false,
---是否可以升级属性
is_upgrade = false,
---属性个数下限
min_count = 0,
---属性个数上限
max_count = 0,
---物品等级下限
min_item_level = 0,
---物品等级上限
max_item_level = 0,
---物品掩码
wear_mask = 0,
}

local indexTable = 
{
	__index = function()
		return kx_gem_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_gem_table, indexTable)

kx_gem_table = _kx_gem_table
return _kx_gem_table