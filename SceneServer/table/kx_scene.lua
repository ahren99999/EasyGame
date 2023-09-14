---自动生成的 不要手动编辑---
---@type kx_scene_data[]
local _kx_scene_table = 
{
[1] = {x0 = 20000,name = 'Main_Scene',x1 = 40000,y1 = 40000,idx = 1,is_dup = false,y0 = 20000, },
[2] = {x0 = 25388,name = 'Copy_Map4',x1 = 28546,y1 = 27000,idx = 2,is_dup = true,y0 = 24778, },
[3] = {x0 = 25388,name = 'Copy_Map5',x1 = 28546,y1 = 27000,idx = 3,is_dup = true,y0 = 24778, },

}

---@class kx_scene_data
local kx_scene_data =
{
	
---索引
idx = 0,
---场景名字
name = nil,
---左下角
x0 = 0,
---左下角
y0 = 0,
---右上角
x1 = 0,
---右上角
y1 = 0,
---是否副本地图
is_dup = false,
}

local indexTable = 
{
	__index = function()
		return kx_scene_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_scene_table, indexTable)

kx_scene_table = _kx_scene_table
return _kx_scene_table