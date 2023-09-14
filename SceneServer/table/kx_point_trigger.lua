---自动生成的 不要手动编辑---
---@type kx_point_trigger_data[]
local _kx_point_trigger_table = 
{
[1] = {x = 24481,y = 34921,target_x = 21158,target_z = -7205,idx = 1,trigger = false,range = 3,level = 0,target_y = 28611,target_range = 1, },
[2] = {x = 21158,y = 28620,target_x = 24481,target_z = -6703,idx = 2,trigger = false,range = 2,level = 0,target_y = 34909,target_range = 1, },
[3] = {x = 26406,y = 25155,trigger_callback_func = 'OnPointTrigger_1',target_x = 26110,target_z = -294,idx = 3,trigger = true,range = 1,level = 0,target_y = 25647,target_range = 1,trigger_callback_tab = 'CopyMap4Npc',is_copy = true, },
[4] = {x = 26110,y = 25653,target_x = 26411,target_z = -2982,idx = 4,range = 1,level = 0,target_y = 25155,target_range = 1,is_copy = true, },

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
---是否副本使用
is_copy = false,
---是否地图触发
trigger = false,
---触发回调lua表
trigger_callback_tab = nil,
---触发回调
trigger_callback_func = nil,
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