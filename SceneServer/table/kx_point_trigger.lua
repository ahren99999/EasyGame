---自动生成的 不要手动编辑---
---@type kx_point_trigger_data[]
local _kx_point_trigger_table = 
{
[1] = {level = 0,trigger = false,target_z = -7205,range = 3,target_range = 1,x = 24481,y = 34921,target_x = 21158,idx = 1,target_y = 28611, },
[2] = {level = 0,trigger = false,target_z = -6703,range = 2,target_range = 1,x = 21158,y = 28620,target_x = 24481,idx = 2,target_y = 34909, },

}

---@class kx_point_trigger_data
local kx_point_trigger_data =
{
	
---索引
idx = 0,
---x坐标
x = 0,
---y坐标
y = 0,
---触发范围
range = 0,
---目标x
target_x = 0,
---目标y
target_y = 0,
---目标z
target_z = 0,
---降落的范围
target_range = 0,
---等级要求
level = 0,
---是否地图触发
trigger = false,
---触发回调
trigger_callback = nil,
}

local indexTable = 
{
	__index = function()
		return kx_point_trigger_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_point_trigger_table, indexTable)

kx_point_trigger_table = _kx_point_trigger_table
return _kx_point_trigger_table