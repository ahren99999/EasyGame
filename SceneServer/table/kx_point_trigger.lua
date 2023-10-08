---自动生成的 不要手动编辑---
---@type kx_point_trigger_data[]
local _kx_point_trigger_table = 
{
[1] = {x = 24481,y = 34921,target_x = 21158,target_z = -7205,idx = 1,range = 3,target_y = 28611,target_range = 1, },
[2] = {x = 21158,y = 28620,target_x = 24481,target_z = -6703,idx = 2,range = 2,target_y = 34909,target_range = 1, },
[3] = {x = 26406,y = 25155,trigger_callback_func = 'OnPointTrigger_1',target_x = 26110,target_z = -294,idx = 3,trigger = true,range = 1,target_y = 25647,target_range = 1,trigger_callback_tab = 'CopyMap4Npc',is_copy = true, },
[4] = {x = 26110,y = 25653,target_x = 26411,target_z = -2982,idx = 4,range = 1,target_y = 25155,target_range = 1,is_copy = true, },
[5] = {x = 22645,y = 34089,target_x = 21155,target_z = -485,idx = 5,range = 2,target_y = 30866,target_range = 2, },
[6] = {x = 21155,y = 30858,target_x = 22662,target_z = -6223,idx = 6,range = 1,target_y = 34087,target_range = 2, },
[7] = {x = 21155,y = 31483,target_x = 21797,target_z = -1218,idx = 7,range = 1,target_y = 31488,target_range = 1, },
[8] = {x = 21120,y = 31503,target_x = 22452,target_z = -5670,idx = 8,range = 1,target_y = 31467,target_range = 1, },
[9] = {x = 21155,y = 31563,target_x = 23032,target_z = -501,idx = 9,range = 1,target_y = 31555,target_range = 1, },
[10] = {x = 21189,y = 31543,target_x = 23745,target_z = -818,idx = 10,range = 1,target_y = 31522,target_range = 1, },
[11] = {x = 21802,y = 31488,trigger_callback_func = 'OnPointTrigger_Fire',target_x = 21155,target_z = -581,idx = 11,trigger = true,range = 1,target_y = 31487,target_range = 1,trigger_callback_tab = 'CastleFight', },
[12] = {x = 22452,y = 31462,trigger_callback_func = 'OnPointTrigger_TidalWave',target_x = 21125,target_z = -581,idx = 12,trigger = true,range = 1,target_y = 31506,target_range = 1,trigger_callback_tab = 'CastleFight', },
[13] = {x = 23027,y = 31556,trigger_callback_func = 'OnPointTrigger_Ordinary',target_x = 21155,target_z = -581,idx = 13,trigger = true,range = 1,target_y = 31557,target_range = 1,trigger_callback_tab = 'CastleFight', },
[14] = {x = 23745,y = 31545,trigger_callback_func = 'OnPointTrigger_Fog',target_x = 21184,target_z = -581,idx = 14,trigger = true,range = 1,target_y = 31540,target_range = 1,trigger_callback_tab = 'CastleFight', },
[15] = {x = 21177,y = 30902,trigger_callback_func = 'OnPointTrigger_Main',target_x = 21792,target_z = -536,idx = 15,trigger = true,range = 1,target_y = 30881,target_range = 1,trigger_callback_tab = 'CastleFight', },
[16] = {x = 21792,y = 30865,trigger_callback_func = 'OnPointTrigger_Main',target_x = 21148,target_z = -581,idx = 16,trigger = true,range = 0,target_y = 31526,target_range = 1,trigger_callback_tab = 'CastleFight', },
[17] = {x = 21143,y = 31529,trigger_callback_func = 'OnPointTrigger_Main',target_x = 21792,target_z = -536,idx = 17,trigger = true,range = 0,target_y = 30881,target_range = 1,trigger_callback_tab = 'CastleFight', },

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