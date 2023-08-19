---自动生成的 不要手动编辑---
---@type kx_attr_role_data[]
local _kx_attr_role_table = 
{
[1] = {white_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',job = 'OneHand',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6,"攻击成功率":0.12}',dex = '{"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.07,"格挡成功率":0.05,"移动速度":0.02,"攻击速度":0.015}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 1,spi = '{"MaxHP":4,"MaxMP":4,"生命恢复力":0.03,"魔法恢复力":0.03}', },
[2] = {white_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',job = 'Bare',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6,"攻击成功率":0.12}',dex = '{"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.12,"格挡成功率":0.07,"移动速度":0.04,"攻击速度":0.028}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 2,spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}', },
[3] = {white_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3,"最小魔法攻击力":0.6,"最大魔法攻击力":1.2,"魔法恢复力":0.01}',job = 'Red',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6,"攻击成功率":0.12}',dex = '{"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.05,"格挡成功率":0.05,"移动速度":0.02,"攻击速度":0.015}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 3,spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}', },
[4] = {white_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',job = 'Bow',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6,"攻击成功率":0.12}',dex = '{"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.12,"格挡成功率":0.07,"移动速度":0.02,"攻击速度":0.028}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 4,spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}', },
[5] = {white_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',job = 'Blue',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6,"攻击成功率":0.12}',dex = '{"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.05,"格挡成功率":0.05,"移动速度":0.02,"攻击速度":0.015}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3,"最小魔法攻击力":0.6,"最大魔法攻击力":1.2,"魔法恢复力":0.01}',idx = 5,spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}', },

}

---@class kx_attr_role_data
local kx_attr_role_data =
{
	
---索引
idx = 0,
---职业
job = nil,
---力量
str = 0,
---敏捷
dex = 0,
---精神
spi = 0,
---白魔法
white_magic = 0,
---红魔法
red_magic = 0,
---蓝魔法
blue_magic = 0,
---黄魔法
yellow_magic = 0,
---黑魔法
black_magic = 0,
}

local indexTable = 
{
	__index = function()
		return kx_attr_role_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_attr_role_table, indexTable)

kx_attr_role_table = _kx_attr_role_table
return _kx_attr_role_table