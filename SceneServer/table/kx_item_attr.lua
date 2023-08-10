---自动生成的 不要手动编辑---
---@type kx_item_attr_data[]
local _kx_item_attr_table = 
{
[1] = {idx = 1,name = '最小物理攻击力', },
[2] = {idx = 2,name = '最大物理攻击力', },
[3] = {idx = 3,name = '最小魔法攻击力', },
[4] = {idx = 4,name = '最大魔法攻击力', },
[5] = {idx = 5,name = '物理防御力', },
[6] = {idx = 6,name = '物理防御千分比', },
[7] = {idx = 7,name = '魔法防御力', },
[8] = {idx = 8,name = '魔法防御千分比', },
[9] = {idx = 9,name = '必杀成功率', },
[10] = {idx = 10,name = '魔法必杀成功率', },
[11] = {idx = 11,name = '眩晕', },
[12] = {idx = 12,name = '移动速度', },
[13] = {idx = 13,name = '格挡成功率', },
[14] = {idx = 14,name = '降低对方格挡成功率', },
[15] = {idx = 15,name = '攻击成功率', },
[16] = {idx = 16,name = '生命恢复力', },
[17] = {idx = 17,name = '魔法恢复力', },
[18] = {idx = 18,name = '全体物品获得率', },
[19] = {idx = 19,name = '魔法物品获得率', },
[20] = {idx = 20,name = '力量', },
[21] = {idx = 21,name = '敏捷', },
[22] = {idx = 22,name = '精神', },
[23] = {idx = 23,name = '白魔法', },
[24] = {idx = 24,name = '红魔法', },
[25] = {idx = 25,name = '蓝魔法', },
[26] = {idx = 26,name = '黄魔法', },
[27] = {idx = 27,name = '黑魔法', },
[28] = {idx = 28,name = '红魔法抵抗力', },
[29] = {idx = 29,name = '蓝魔法抵抗力', },
[30] = {idx = 30,name = '黄魔法抵抗力', },
[31] = {idx = 31,name = '魔法抵抗力', },
[32] = {idx = 32,name = 'HP', },
[33] = {idx = 33,name = 'MP', },
[34] = {idx = 34,name = 'MaxHP', },
[35] = {idx = 35,name = 'MaxMP', },
[36] = {idx = 36,name = '物理反弹', },
[37] = {idx = 37,name = '魔法反弹', },
[38] = {idx = 38,name = '集中力', },
[39] = {idx = 39,name = '分散力', },
[40] = {idx = 40,name = '攻击速度', },
[41] = {idx = 41,name = '亡灵系最小攻击力', },
[42] = {idx = 42,name = '亡灵系最大攻击力', },
[43] = {idx = 43,name = '亡灵系防御率', },
[44] = {idx = 44,name = '亡灵系防御力', },
[45] = {idx = 45,name = '生物系最小攻击力', },
[46] = {idx = 46,name = '生物系最大攻击力', },
[47] = {idx = 47,name = '生物系防御率', },
[48] = {idx = 48,name = '生物系防御力', },
[49] = {idx = 49,name = '召唤系最小攻击力', },
[50] = {idx = 50,name = '召唤系最大攻击力', },
[51] = {idx = 51,name = '召唤系防御率', },
[52] = {idx = 52,name = '召唤系防御力', },
[53] = {idx = 53,name = '突击系最小攻击力', },
[54] = {idx = 54,name = '突击系最大攻击力', },
[55] = {idx = 55,name = '突击系防御率', },
[56] = {idx = 56,name = '突击系防御力', },
[57] = {idx = 57,name = '人类系最小攻击力', },
[58] = {idx = 58,name = '人类系最大攻击力', },
[59] = {idx = 59,name = '人类系防御率', },
[60] = {idx = 60,name = '人类系防御力', },
[61] = {idx = 61,name = '精灵系最小攻击力', },
[62] = {idx = 62,name = '精灵系最大攻击力', },
[63] = {idx = 63,name = '精灵系防御率', },
[64] = {idx = 64,name = '精灵系防御力', },

}

---@class kx_item_attr_data
local kx_item_attr_data =
{
	
---序号
idx = 0,
---属性名称
name = nil,
}

local indexTable = 
{
	__index = function()
		return kx_item_attr_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_item_attr_table, indexTable)

kx_item_attr_table = _kx_item_attr_table
return _kx_item_attr_table