---自动生成的 不要手动编辑---
---@type kx_global_timer_data[]
local _kx_global_timer_table = 
{
[1] = {is_loop = true,func_name = 'OnTimerInvoker_1',table_name = 'GlobalTimerManager',idx = 1,cron = '0/30 * * * * ?',name = '攻城战', },
[2] = {is_loop = true,func_name = 'OnTimerInvoker_2',table_name = 'GlobalTimerManager',idx = 2,cron = '59 59 23 * * ? ',name = '每日定时器', },

}

---@class kx_global_timer_data
local kx_global_timer_data =
{
	
---序号
idx = 0,
---阶段
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