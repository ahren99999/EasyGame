---自动生成的 不要手动编辑---
---@type kx_buff_data[]
local _kx_buff_table = 
{
[1] = {is_stack = false,stack_count = 0,interval = 0,name = 'SpeedScroll',is_trigger = false,is_icon = true,is_remove = true,idx = 1, },
[2] = {is_stack = false,stack_count = 0,interval = 0,name = 'FastScroll',is_trigger = false,is_icon = true,is_remove = true,idx = 2, },
[3] = {is_stack = false,stack_count = 0,interval = 0,name = 'Warm',is_trigger = false,is_icon = true,is_remove = true,idx = 3, },
[4] = {is_stack = false,stack_count = 0,interval = 0,name = 'FireWarm',is_trigger = false,is_icon = true,is_remove = true,idx = 4, },
[5] = {is_stack = false,stack_count = 0,interval = 0,name = 'WarmOther',is_trigger = false,is_icon = true,is_remove = true,idx = 5, },
[6] = {is_stack = false,stack_count = 0,interval = 0,name = 'ManaBarrier',is_trigger = false,is_icon = true,is_remove = false,idx = 6, },
[7] = {is_stack = true,stack_count = 5,interval = 500,name = 'BlastBlade',is_trigger = true,is_icon = false,is_remove = false,idx = 7, },
[8] = {is_stack = true,stack_count = 5,interval = 500,name = 'RainbowArrow',is_trigger = true,is_icon = false,is_remove = false,idx = 8, },
[9] = {is_stack = true,stack_count = 5,interval = 500,name = 'Bare',is_trigger = true,is_icon = false,is_remove = false,idx = 9, },
[10] = {is_stack = true,stack_count = 5,interval = 800,name = 'Blizzard',is_trigger = true,is_icon = false,is_remove = false,idx = 10, },
[11] = {is_stack = false,stack_count = 0,interval = 0,name = 'HawkEye',is_trigger = false,is_icon = false,is_remove = false,idx = 11, },

}

---@class kx_buff_data
local kx_buff_data =
{
	
---序号
idx = 0,
---buff名字
name = nil,
---能否被移除
is_remove = false,
---是否循环触发
is_trigger = false,
---循环触发间隔
interval = 0,
---是否叠加
is_stack = false,
---叠加数量
stack_count = 0,
---是否有图标
is_icon = false,
}

local indexTable = 
{
	__index = function()
		return kx_buff_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_buff_table, indexTable)

kx_buff_table = _kx_buff_table
return _kx_buff_table