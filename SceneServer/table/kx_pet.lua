---自动生成的 不要手动编辑---
---@type kx_pet_data[]
local _kx_pet_table = 
{
[1] = {stage = 0,look = 'Egg',idx = 1, },
[2] = {stage = 1,look = 'Puppy_Brown',idx = 2, },
[3] = {stage = 1,look = 'Puppy_White',idx = 3, },
[4] = {stage = 1,look = 'Puppy_Black',idx = 4, },
[5] = {stage = 2,look = 'Martis',idx = 5, },
[6] = {stage = 2,look = 'Crid',idx = 6, },
[7] = {stage = 2,look = 'Coro',idx = 7, },
[8] = {stage = 2,look = 'Greenskink',idx = 8, },
[9] = {stage = 3,look = 'Drake',idx = 9, },
[10] = {stage = 3,look = 'Coromon',idx = 10, },
[11] = {stage = 3,look = 'BanderScon',idx = 11, },
[12] = {stage = 3,look = 'MiniLycan',idx = 12, },

}

---@class kx_pet_data
local kx_pet_data =
{
	
---序号
idx = 0,
stage = 0,
---阶段
look = nil,
}

local indexTable = 
{
	__index = function()
		return kx_pet_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_pet_table, indexTable)

kx_pet_table = _kx_pet_table
return _kx_pet_table