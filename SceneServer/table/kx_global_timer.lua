---自动生成的 不要手动编辑---
---@type kx_global_timer_data[]
local _kx_global_timer_table = 
{
[1] = {name = '分钟计时器',table_name = 'GlobalTimerManager',cron = '0 0/1 * * * ? ',func_name = 'OnTimerInvoker_1',idx = 1,is_loop = true, },
[2] = {name = '天计时器',table_name = 'GlobalTimerManager',cron = '1 0 0 1/1 * ? ',func_name = 'OnTimerInvoker_2',idx = 2,is_loop = true, },

}

---@class kx_global_timer_data
local kx_global_timer_data =
{
	
---序号
idx = 0,
---名字
name = nil,
---cron表达式
cron = nil,
---是否循环
is_loop = false,
---lua表名
table_name = nil,
---lua方法名
func_name = nil,
}

local indexTable = 
{
	__index = function()
		return kx_global_timer_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_global_timer_table, indexTable)

kx_global_timer_table = _kx_global_timer_table
return _kx_global_timer_table