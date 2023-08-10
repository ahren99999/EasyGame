---自动生成的 不要手动编辑---
---@type kx_npc_data[]
local _kx_npc_table = 
{
[1] = {size = 1,z = -6643,table_name = 'StorerNpc',title = '<仓库>',x = 22918,y = 34218,func_name = 'OnClickMain',dir = 1.83,idx = 1,city = '莱蒂尼斯',model = 'Banker',district = '莱蒂尼斯城',name = '保管所职员', },
[2] = {size = 1,z = -6643,shop_id = { 1, 2 }, table_name = 'YouBoNpc',title = '<杂货铺>',x = 23012,y = 34278,func_name = 'OnClickMain',dir = 3.1,idx = 2,city = '莱蒂尼斯',model = 'Lizel',district = '莱蒂尼斯城',name = '尤博', },
[3] = {size = 1,z = -6620,table_name = 'GuildNpc',title = '<行会管理>',x = 22690,y = 34088,func_name = 'OnClickMain',dir = 0,idx = 3,city = '莱蒂尼斯',model = 'Banker',district = '莱蒂尼斯城',name = '彬伊', },
[4] = {size = 1,z = -6643,table_name = 'CopyMap4Npc',title = '<副本4>',x = 23007,y = 34285,func_name = 'OnClickMain',dir = 0,idx = 4,city = '莱蒂尼斯',model = 'Lizel',district = '莱蒂尼斯城',name = '副本4', },
[5] = {size = 1,z = -6643,shop_id = { 3 }, table_name = 'SaiYiNaNpc',title = '<宠物商店>',x = 22923,y = 34264,func_name = 'OnClickMain',dir = 4.7,idx = 5,city = '莱蒂尼斯',model = 'Woman',district = '莱蒂尼斯城',name = '塞伊娜', },
[6] = {size = 1,z = -6643,shop_id = { 5, 4, 11 }, table_name = 'JieKeNpc',title = '<防具商店>',x = 22933,y = 34276,func_name = 'OnClickMain',dir = 0,idx = 6,city = '莱蒂尼斯',model = 'BlackSmith',district = '莱蒂尼斯城',name = '杰克', },
[7] = {size = 1,z = -6643,shop_id = { 9, 10, 15 }, table_name = 'KaCiNpc',title = '<武器商店>',x = 23006,y = 34211,func_name = 'OnClickMain',dir = 2.8,idx = 7,city = '莱蒂尼斯',model = 'BlackSmith',district = '莱蒂尼斯城',name = '卡茨', },
[8] = {size = 1,z = -6643,shop_id = { 7, 13 }, title = '<护臂商店>',x = 22953,y = 34187,func_name = 'OnClickMain',table_name = 'TuLuPuNpc',idx = 8,city = '莱蒂尼斯',model = 'BlackSmith',district = '莱蒂尼斯城',name = '图鲁普', },
[9] = {size = 1,z = -6643,shop_id = { 8, 14 }, table_name = 'DuLaKenNpc',title = '<头盔商店>',x = 22994,y = 34168,func_name = 'OnClickMain',dir = 2.8,idx = 9,city = '莱蒂尼斯',model = 'BlackSmith',district = '莱蒂尼斯城',name = '度拉肯', },
[10] = {size = 1,z = -6643,shop_id = { 6, 12 }, title = '<护腿商店>',x = 22955,y = 34154,func_name = 'OnClickMain',table_name = 'ALaTeNpc',idx = 10,city = '莱蒂尼斯',model = 'BlackSmith',district = '莱蒂尼斯城',name = '阿拉特', },
[11] = {size = 1,z = -6643,table_name = 'YiSiNaSi',title = '<传送>',x = 22963,y = 34240,func_name = 'OnClickMain',dir = 1.5,idx = 11,city = '莱蒂尼斯',model = 'Banker',district = '莱蒂尼斯城',name = '伊斯纳斯', },
[12] = {size = 1,z = -6677,shop_id = { 26 }, table_name = 'BaoShiNpc',title = '<宝石>',x = 22960,y = 34281,func_name = 'OnClickMain',dir = 4.7,idx = 12,city = '莱蒂尼斯',model = 'Lizel',district = '莱蒂尼斯城',name = '宝石商人', },

}

---@class kx_npc_data
local kx_npc_data =
{
	
---序号
idx = 0,
---名字
name = nil,
---称号
title = nil,
---区域
district = nil,
---城市
city = nil,
---x坐标
x = 0,
---y坐标
y = 0,
---z坐标
z = 0,
---方向
dir = 0,
---大小
size = 0,
---模型
model = nil,
---商铺id
shop_id = {},
---方法所在table
table_name = nil,
---方法名
func_name = nil,
}

local indexTable = 
{
	__index = function()
		return kx_npc_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_npc_table, indexTable)

kx_npc_table = _kx_npc_table
return _kx_npc_table