---自动生成的 不要手动编辑---
---@type kx_buff_data[]
local _kx_buff_table = 
{
[1] = {is_stack = false,is_trigger = false,interval = 0,stack_count = 0,is_icon = true,name = 'SpeedScroll',idx = 1,is_remove = true, },
[2] = {is_stack = false,is_trigger = false,interval = 0,stack_count = 0,is_icon = true,name = 'FastScroll',idx = 2,is_remove = true, },
[3] = {is_stack = false,is_trigger = false,interval = 0,stack_count = 0,is_icon = true,name = 'Warm',idx = 3,is_remove = true, },
[4] = {is_stack = false,is_trigger = false,interval = 0,stack_count = 0,is_icon = true,name = 'FireWarm',idx = 4,is_remove = true, },
[5] = {is_stack = false,is_trigger = false,interval = 0,stack_count = 0,is_icon = true,name = 'WarmOther',idx = 5,is_remove = true, },
[6] = {is_stack = false,is_trigger = false,interval = 0,stack_count = 0,is_icon = true,name = 'ManaBarrier',idx = 6,is_remove = false, },
[7] = {is_stack = true,is_trigger = true,interval = 500,stack_count = 5,is_icon = false,name = 'BlastBlade',idx = 7,is_remove = false, },
[8] = {is_stack = true,is_trigger = true,interval = 500,stack_count = 5,is_icon = false,name = 'RainbowArrow',idx = 8,is_remove = false, },
[9] = {is_stack = true,is_trigger = true,interval = 500,stack_count = 5,is_icon = false,name = 'Bare',idx = 9,is_remove = false, },
[10] = {is_stack = true,is_trigger = true,interval = 800,stack_count = 5,is_icon = false,name = 'Blizzard',idx = 10,is_remove = false, },
[11] = {is_stack = false,is_trigger = false,interval = 0,stack_count = 0,is_icon = false,name = 'HawkEye',idx = 11,is_remove = false, },

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