---自动生成的 不要手动编辑---
---@type kx_pet_data[]
local _kx_pet_table = 
{
[1] = {stage = 0,idx = 1,look = 'Egg', },
[2] = {stage = 1,idx = 2,look = 'Puppy_Brown', },
[3] = {stage = 1,idx = 3,look = 'Puppy_White', },
[4] = {stage = 1,idx = 4,look = 'Puppy_Black', },
[5] = {stage = 2,idx = 5,look = 'Martis', },
[6] = {stage = 2,idx = 6,look = 'Crid', },
[7] = {stage = 2,idx = 7,look = 'Coro', },
[8] = {stage = 2,idx = 8,look = 'Greenskink', },
[9] = {stage = 3,idx = 9,look = 'Drake', },
[10] = {stage = 3,idx = 10,look = 'Coromon', },
[11] = {stage = 3,idx = 11,look = 'BanderScon', },
[12] = {stage = 3,idx = 12,look = 'MiniLycan', },

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