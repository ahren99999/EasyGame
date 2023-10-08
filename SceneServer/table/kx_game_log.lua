---自动生成的 不要手动编辑---
---@type kx_game_log_data[]
local _kx_game_log_table = 
{
[1] = {name = '脚本事件',idx = 1, },
[2] = {name = '系统事件',idx = 2, },
[3] = {name = 'SceneServer启动',idx = 3, },
[4] = {name = 'SceneServer关闭',idx = 4, },
[5] = {name = '玩家登录',idx = 5, },
[6] = {name = '玩家登出',idx = 6, },
[7] = {name = '角色死亡',idx = 7, },
[8] = {name = '角色复活',idx = 8, },
[9] = {name = '购买道具',idx = 9, },
[10] = {name = '出售道具',idx = 10, },
[11] = {name = '交易获得',idx = 11, },
[12] = {name = '交易失去',idx = 12, },
[13] = {name = '摆摊上架',idx = 13, },
[14] = {name = '摆摊出售',idx = 14, },
[15] = {name = '摆摊购买',idx = 15, },
[16] = {name = '获得道具',idx = 16, },
[17] = {name = '失去道具',idx = 17, },
[18] = {name = '丢弃物品',idx = 18, },
[19] = {name = '拾取物品',idx = 19, },
[20] = {name = '使用道具',idx = 20, },
[21] = {name = '增加金币',idx = 21, },
[22] = {name = '扣除金币',idx = 22, },
[23] = {name = '怪物死亡',idx = 23, },
[24] = {name = '怪物掉落',idx = 24, },
[25] = {name = '角色升级',idx = 25, },
[26] = {name = '宠物升级',idx = 26, },
[27] = {name = '物品更新',idx = 27, },

}

---@class kx_game_log_data
local kx_game_log_data =
{
	
---序号
idx = 0,
---属性名称
name = nil,
}

local indexTable = 
{
	__index = function()
		return kx_game_log_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_game_log_table, indexTable)

kx_game_log_table = _kx_game_log_table
return _kx_game_log_table