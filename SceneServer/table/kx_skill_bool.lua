---自动生成的 不要手动编辑---
---@type kx_skill_bool_data[]
local _kx_skill_bool_table = 
{
[1] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '剑气',idx = 1,book_name = '1级剑气技能书',job_name = '单手剑士',need_count = { 100000, 10 },  },
[2] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '剑气',idx = 2,book_name = '2级剑气技能书',job_name = '单手剑士',need_count = { 200000, 20 },  },
[3] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '大地之斩',idx = 3,book_name = '1级大地之斩技能书',job_name = '单手剑士',need_count = { 100000, 10 },  },
[4] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '大地之斩',idx = 4,book_name = '2级大地之斩技能书',job_name = '单手剑士',need_count = { 200000, 20 },  },
[5] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '雷电拳',idx = 5,book_name = '1级雷电拳技能书',job_name = '斗士',need_count = { 100000, 10 },  },
[6] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '雷电拳',idx = 6,book_name = '2级雷电拳技能书',job_name = '斗士',need_count = { 200000, 20 },  },
[7] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '天神下凡',idx = 7,book_name = '1级天神下凡技能书',job_name = '斗士',need_count = { 100000, 10 },  },
[8] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '天神下凡',idx = 8,book_name = '2级天神下凡技能书',job_name = '斗士',need_count = { 200000, 20 },  },
[9] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '体力强化',idx = 9,book_name = '1级体力强化技能书',job_name = '单手剑士|斗士',need_count = { 100000, 10 },  },
[10] = {need_item = {'金币','迎风花',},skill_type = 4,skill_name = '体力强化',idx = 10,book_name = '2级体力强化技能书',job_name = '单手剑士|斗士',need_count = { 200000, 20 },  },

}

---@class kx_skill_bool_data
local kx_skill_bool_data =
{
	
---序号
idx = 0,
---职业名字
job_name = nil,
---技能类型
skill_type = 0,
---技能名字
skill_name = nil,
---技能书名字
book_name = nil,
---所需物品
need_item = {},
---所需数量
need_count = {},
}

local indexTable = 
{
	__index = function()
		return kx_skill_bool_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_skill_bool_table, indexTable)

kx_skill_bool_table = _kx_skill_bool_table
return _kx_skill_bool_table