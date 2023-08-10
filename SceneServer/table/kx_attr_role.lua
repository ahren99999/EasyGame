---自动生成的 不要手动编辑---
---@type kx_attr_role_data[]
local _kx_attr_role_table = 
{
[1] = {white_magic = '{"MaxHP":2,"MaxMP":3}',spi = '{"MaxHP":4,"MaxMP":4,"生命恢复力":0.03,"魔法恢复力":0.03}',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6}',job = 'OneHand',dex = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.01,"格挡成功率":0.02,"移动速度":0.0002}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 1, },
[2] = {white_magic = '{"MaxHP":2,"MaxMP":3}',spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6}',job = 'Bare',dex = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.01,"格挡成功率":0.02,"移动速度":0.0002}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 2, },
[3] = {white_magic = '{"MaxHP":2,"MaxMP":3}',spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6}',job = 'Red',dex = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.01,"格挡成功率":0.02,"移动速度":0.0002}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3,"最小魔法攻击力":0.6,"最大魔法攻击力":1.2,"魔法恢复力":0.01}',black_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 3, },
[4] = {white_magic = '{"MaxHP":2,"MaxMP":3}',spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6}',job = 'Bow',dex = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.01,"格挡成功率":0.02,"移动速度":0.0002}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3}',idx = 4, },
[5] = {white_magic = '{"MaxHP":2,"MaxMP":3}',spi = '{"MaxHP":4,"MaxMP":3,"生命恢复力":0.03,"魔法恢复力":0.03}',str = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.3,"最大物理攻击力":0.6}',job = 'Blue',dex = '{"MaxHP":2,"MaxMP":3,"最小物理攻击力":0.2,"最大物理攻击力":0.4,"必杀成功率":0.01,"格挡成功率":0.02,"移动速度":0.0002}',yellow_magic = '{"MaxHP":2,"MaxMP":3}',red_magic = '{"MaxHP":2,"MaxMP":3}',black_magic = '{"MaxHP":2,"MaxMP":3}',blue_magic = '{"MaxHP":2,"MaxMP":3,"最小魔法攻击力":0.6,"最大魔法攻击力":1.2,"魔法恢复力":0.01}',idx = 5, },

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