﻿---自动生成的 不要手动编辑---
---@type kx_msg_data[]
local _kx_msg_table = 
{
[1] = {msg = '提示：不可穿戴',idx = 1, },
[2] = {msg = '提示：您的职业与装备不符合！',idx = 2, },
[3] = {msg = '提示：您的等级与装备等级不符合！',idx = 3, },
[4] = {msg = '提示：您的力量点数未达到装备要求！',idx = 4, },
[5] = {msg = '提示：您的敏捷点数未达到装备要求！',idx = 5, },
[6] = {msg = '提示：您的精神点数未达到装备要求！',idx = 6, },
[7] = {msg = '提示：您的魔法力未达到装备要求！',idx = 7, },
[8] = {msg = '提示：您的红魔法未达到装备要求！',idx = 8, },
[9] = {msg = '提示：您的蓝魔法未达到装备要求！',idx = 9, },
[10] = {msg = '提示：您的黄魔法未达到装备要求！',idx = 10, },
[11] = {msg = '提示：您的白魔法未达到装备要求！',idx = 11, },
[12] = {msg = '提示：您的黑魔法未达到装备要求！',idx = 12, },
[13] = {msg = '提示：您的选择背包位置无法放下此装备！',idx = 13, },
[14] = {msg = '提示：此区域禁止PK!',idx = 14, },
[15] = {msg = '提示：当前使用的宝石要求物品属性数量在2和4之间！',idx = 15, },
[16] = {msg = '提示：当前使用的宝石无法升级此物品！',idx = 16, },
[17] = {msg = '提示：创建失败，您提供的名字不合法！要求长度4-14的汉字或者字母。',idx = 17, },
[18] = {msg = '提示：操作失败，您的位置离NPC过远！',idx = 18, },
[19] = {msg = '提示：购买失败，您的金币不足！',idx = 19, },
[20] = {msg = '提示：存点失败，最高只能保存100个存点位置！',idx = 20, },
[21] = {msg = '提示：操作失败，您选择的存点位置不存在！',idx = 21, },
[22] = {msg = '提示：操作失败，您已经加入了行会！',idx = 22, },
[23] = {msg = '提示：操作失败，您输入的行会名已存在，请重新输入！',idx = 23, },
[24] = {msg = '提示：操作失败，你申请加入的行会不存在！',idx = 24, },
[25] = {msg = '提示：操作失败，请勿重复申请加入相同的行会！',idx = 25, },
[26] = {msg = '提示：操作失败，您没有权限查看！',idx = 26, },
[27] = {msg = '提示：出战失败，您的宠物已死亡！',idx = 27, },
[28] = {msg = '提示：出战失败，请勿重复出战！',idx = 28, },

}

---@class kx_msg_data
local kx_msg_data =
{
	
---序号
idx = 0,
---消息内容
msg = nil,
}

local indexTable = 
{
	__index = function()
		return kx_msg_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_msg_table, indexTable)

kx_msg_table = _kx_msg_table
return _kx_msg_table