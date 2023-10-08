﻿

local m = {
	--角色内核处理时间(ms)
	["CPT"] = 30,
	
	--怪物内核处理时间(ms)
	["MPT"] = 200,
	
	--角色内核单次处理数量
	["CSPQ"] = 30,
	
	--全局数据持久化间隔(min)
	["GDPI"] = 1,
	
	--角色数据持久化间隔(min)
	["CDPI"] = 1,
	
	--物品受保护时间(s)
	["IPT"] = 30,
	
	--物品消失时间(s)
	["IET"] = 60,
	
	--日志推送间隔(s)
	["LPI"] = 10,
	
	--单次日志推送数量
	["SLPQ"] = 2000,
	
	--角色最高等级
	["MCL"] = 400,
	
	



}

GameConfig = m
return m