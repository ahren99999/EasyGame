---自动生成的 不要手动编辑---
---@type kx_gem_data[]
local _kx_gem_table = 
{
[1] = {is_select = false,name = '红色荣誉',max_count = 1,is_delete = false,min_item_level = 0,is_add = false,item_idx = 465,idx = 1,is_bbk = '0',is_upgrade_quality = false,max_item_level = 0,is_upgrade = true,wear_mask = 158,min_count = 1, },
[2] = {is_select = false,name = '青之泪',max_count = 1,is_delete = false,is_bbk = '0',is_add = false,item_idx = 461,idx = 2,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = true,wear_mask = 320,min_count = 1, },
[3] = {is_select = false,name = '红宝石',max_count = 1,is_delete = false,is_bbk = '0',is_add = true,item_idx = 460,idx = 3,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = false,wear_mask = 65535,min_count = 0, },
[4] = {is_select = false,name = '凯旋宝石',max_count = 10,is_delete = false,is_bbk = '0',is_add = false,item_idx = 459,idx = 4,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = true,wear_mask = 65535,min_count = 1, },
[5] = {is_select = false,name = '金钢石',max_count = 2,is_delete = false,is_bbk = '0',is_add = true,item_idx = 458,idx = 5,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = false,wear_mask = 65535,min_count = 1, },
[6] = {is_select = false,name = '小型凯旋宝石',max_count = 4,is_delete = false,is_bbk = '0',is_add = false,item_idx = 457,idx = 6,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = true,wear_mask = 65535,min_count = 1, },
[7] = {is_select = false,name = '神圣宝石',max_count = 4,is_delete = false,is_bbk = '0',is_add = true,item_idx = 456,idx = 7,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = false,wear_mask = 65535,min_count = 2, },
[8] = {is_select = true,name = '超级凯旋宝石',max_count = 10,is_delete = false,is_bbk = '0',is_add = false,item_idx = 455,idx = 8,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = true,wear_mask = 65535,min_count = 1, },
[9] = {is_select = true,name = '德尔福罗斯宝石',max_count = 10,is_delete = true,is_bbk = '0',is_add = false,item_idx = 1860,idx = 9,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = false,wear_mask = 65535,min_count = 1, },
[10] = {is_select = false,name = '幻想的凯旋宝石',max_count = 10,is_delete = false,is_bbk = '1',is_add = false,item_idx = 1500,idx = 10,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = true,wear_mask = 65535,min_count = 1, },
[11] = {is_select = false,name = '赫尔梅德林',max_count = 6,is_delete = false,is_bbk = '0',is_add = true,item_idx = 2067,idx = 11,is_upgrade_quality = false,min_item_level = 0,max_item_level = 0,is_upgrade = false,wear_mask = 65535,min_count = 4, },
[12] = {is_select = false,name = '升级宝石',max_count = 10,is_delete = false,is_bbk = '1',is_add = false,item_idx = 1862,idx = 12,is_upgrade_quality = true,min_item_level = 0,max_item_level = 0,is_upgrade = false,wear_mask = 65535,min_count = 0, },

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
---是否可以升级品质
is_upgrade_quality = false,
---是否属于保护性石头
is_bbk = 0,
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