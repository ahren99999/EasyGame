---自动生成的 不要手动编辑---
---@type kx_new_player_data[]
local _kx_new_player_table = 
{
[1] = {job = 'OneHand',white_magic = 0,dex = 42,birth_place = 'Ladianes',x = 22965,y = 34238,str = 64,item_num = { 1, 1, 2, 1 }, spi = 52,black_magic = 42,wear = '防身刀',yellow_magic = 0,idx = 1,red_magic = 0,blue_magic = 0,gold = 10000000,item_name = {'防身头盔','防身护腿','防身护臂','轻型铠',}, },
[2] = {job = 'Bare',white_magic = 0,dex = 42,birth_place = 'Ladianes',x = 22965,y = 34238,str = 64,item_num = { 1, 1, 2, 1 }, spi = 52,black_magic = 42,wear = '防身拳套',yellow_magic = 0,idx = 2,red_magic = 0,blue_magic = 0,gold = 10000000,item_name = {'防身头盔','防身护腿','防身护臂','轻型铠',}, },
[3] = {job = 'Red',white_magic = 0,dex = 41,birth_place = 'Ladianes',x = 22965,y = 34238,str = 44,item_num = { 1, 1, 2, 1 }, spi = 53,black_magic = 0,wear = '学徒杖',yellow_magic = 0,idx = 3,red_magic = 62,blue_magic = 0,gold = 10000000,item_name = {'学徒帽','学徒护腿','学徒护臂','学徒袍',}, },
[4] = {job = 'Bow',white_magic = 0,dex = 60,birth_place = 'Ladianes',x = 22965,y = 34238,str = 45,item_num = { 1, 1, 2, 1 }, spi = 50,black_magic = 42,wear = '精灵十字弩',yellow_magic = 0,idx = 4,red_magic = 0,blue_magic = 0,gold = 10000000,item_name = {'起始之帽','起始之护腿','起始护腕','起始之服',}, },
[5] = {job = 'Blue',white_magic = 0,dex = 41,birth_place = 'Ladianes',x = 22965,y = 34238,str = 44,item_num = { 1, 1, 2, 1 }, spi = 53,black_magic = 0,wear = '精灵之杖',yellow_magic = 0,idx = 5,red_magic = 0,blue_magic = 62,gold = 10000000,item_name = {'卑下之帽','卑下之护腿','卑下之护腕','卑下之服',}, },

}

---@class kx_new_player_data
local kx_new_player_data =
{
	
---序号
idx = 0,
---职业
job = nil,
---出生地
birth_place = nil,
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
---x坐标
x = 0,
---y坐标
y = 0,
---金币
gold = 0,
---穿戴的装备
wear = nil,
---道具
item_name = {},
---道具数量
item_num = {},
}

local indexTable = 
{
	__index = function()
		return kx_new_player_data
	end,
	__newindex = function (t,k,v)
		error('lua表格不允许修改！！' .. debug.traceback())
	end
}

setmetatable(_kx_new_player_table, indexTable)

kx_new_player_table = _kx_new_player_table
return _kx_new_player_table