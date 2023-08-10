
---人物基础属性枚举
---@class emBaseAttr
emBaseAttr = {
	MinDC					= 1,		--最小物理攻击力
	MaxDC					= 2,		--最大物理攻击力
	MinMC					= 3,		--最小魔法攻击力
	MaxMC					= 4,		--最大魔法攻击力
	AC						= 5,		--物理防御力
	PerMilAC				= 6,		--物理防御千分比
	MAC						= 7,		--魔法防御力
	PerMilMAC 				= 8,		--魔法防御千分比
	CritRate				= 9,		--必杀成功率
	MagicCritRate			= 10,		--魔法必杀成功率
	Stun					= 11,		--眩晕
	MoveSpeed				= 12,		--移动速度
	BlockRate				= 13,		--格挡成功率
	ReducedBlockChance		= 14,		--降低对方格挡成功率
	HIT						= 15,		--攻击成功率
	HPRegen					= 16,		--生命恢复力
	MPRegen					= 17,		--魔法恢复力
	IncreasedItemRarity		= 18,		--全体物品获得率
	MagicFind				= 19,		--魔法物品获得率
	STR						= 20,		--力量
	DEX						= 21,		--敏捷
	SPI						= 22,		--精神
	WhiteMagic				= 23,		--白魔法
	RedMagic				= 24,		--红魔法
	BlueMagic				= 25,		--蓝魔法
	YellowMagic				= 26,		--黄魔法
	BlackMagic				= 27,		--黑魔法
	RedMagicResistance		= 28,		--红魔法抵抗力
	BlueMagicResistance		= 29,		--蓝魔法抵抗力
	YellowMagicResistance	= 30,		--黄魔法抵抗力
	MagicResistance			= 31,		--魔法抵抗力
	HP						= 32,		--当前血量
	MP						= 33,		--当前蓝量
	MaxHP					= 34,		--总血量
	MaxMP					= 35,		--总蓝量
	PR						= 36,		--物理反弹
	MR						= 37,		--魔法反弹
	Focus					= 38,		--集中力
	Dispersion				= 39,		--分散力
	AttackSpeed				= 40,		--攻击速度
	MinATKOfUndead			= 41,		--亡灵系最小攻击力
	MaxATKOfUndead			= 42,		--亡灵系最大攻击力
	UDRate					= 43,		--亡灵系防御率
	UDdef					= 44,		--亡灵系防御力
	MinATKoBio				= 45,		--生物系最小攻击力
	MaxATKoBio				= 46,		--生物系最大攻击力
	BDRate					= 47,		--生物系防御率
	BDdef					= 48,		--生物系防御力
	MinATKOfSummoning		= 49,		--召唤系最小攻击力
	MaxATKOfSummoning		= 50,		--召唤系最大攻击力
	SDRate					= 51,		--召唤系防御率
	SDdef					= 52,		--召唤系防御力
	MinATKOfMutation		= 53,		--突击系最小攻击力
	MaxATKOfMutation		= 54,		--突击系最大攻击力
	MDRate					= 55,		--突击系防御率
	MDdef					= 56,		--突击系防御力
	MinATKOfHuman_type		= 57,		--人类系最小攻击力
	MaxATKOfHuman_type		= 58,		--人类系最大攻击力
	HDRate					= 59,		--人类系防御率
	HDdef					= 60,		--人类系防御力
	MinATKOfElves			= 61,		--精灵系最小攻击力
	MaxATKOfElves			= 62,		--精灵系最大攻击力
	EDRate					= 63,		--精灵系防御率
	EDdef					= 64,		--精灵系防御力
}

--宠物属性枚举
---@class emPetPoint
emPetPoint = {
	AttkPoint 				= 1,		--攻击点数
	HPPoint 				= 2,		--HP点数
	MPPoint 				= 3,		--MP点数
	BagPoint 				= 4,		--背包点数
	TotalPoint 				= 5,		--剩余属性点数
	Level 					= 6,		--等级
	Stage 					= 7,		--阶段
	Exp 					= 8,		--当前经验值
	Hunger 					= 9,		--当前饥饿值
	Color 					= 10,		--宠物颜值 0：白色 1：红色 2：灰 3:棕色 4：黑色
	Mood 					= 11,		--宠物心情 0 伤心的 1：忧郁的 2：开心的 3：亲密的
	DriedFilletCount		= 12,		--干鱼片食用数量
	AgaricCount				= 13,		--蘑菇食用数量
	ByblisCount 			= 14,		--彩虹草食用数量
	GemstonePowderCount		= 15,		--宝石粉末食用数量
}

--人物状态枚举
---@class emPlayerStatus
emPlayerStatus = {
	Normal					=0,			--正常状态
	Npc						=1,			--与Npc交互状态
	StallOpen				=2,			--摆摊中
	PreparingStall			=3,			--摆摊准备中
	WarehouseAccessing		=4,			--使用仓库中
	InTrade					=5,			--交易中
}

--人物穿戴位置枚举
---@class emWearSlot
emWearSlot = {
	None				=255,
	Necklace			= 0,			--项链
	Helmet				= 1,			--头盔
	Armor				= 2,			--铠甲
	Leggings			= 3,			--护腿
	Bracer_Left			=4,				--左护臂
	Bracer_Right		=5,				--右护臂
	Bracelet_Left		=6,				--左手镯
	Bracelet_Right		=7,				--右手镯
	Weapon				=8,				--武器
	Shield				=9,				--护盾
	Ring_Left_1			=10,			--左戒指1
	Ring_Left_2			=11,			--左戒指2
	Ring_Right_1		=12,			--右戒指1
	Ring_Right_2		=13,			--右戒指2
	Megaphone_Left		=14,			--左传音筒
	Megaphone_Right		=15,			--右传音筒
	None_16				= 16,			--未识别
	Earring_Left		= 17,			--左耳环
	Earring_Right		= 18,			--右耳环
	Amulet_Left_Up		= 19,		    --左上护身符
	Amulet_Centre_Up	= 20,			--中上护身符
	Amulet_Right_Up		= 21,			--右上护身符
	Amulet_Left_Down	= 22,			--左下护身符
	Amulet_Centre_Down  = 23,			--中下护身符
	Amulet_Right_Down   = 24,			--右下护身符
	Pet_Left			= 25,			--宠物左
	Belt				= 26,			--腰带
	Pet_Right			= 27,			--宠物右
	Cloak_Left			= 28,			--左斗篷
	None_29				= 29,			--未识别
	None_30				= 30,			--未识别
	Cloak_Right			= 31,			--右斗篷
}


--0白色 1绿色 2金色 3暗金色 4紫色
---@class emItemColor
emItemColor = {
	White = 0,
	Green = 1,
	Golden = 2,
	DarkGold = 3,
	Purple = 4
}

---1单手剑士 2斗士 3红发 4弓箭 5蓝发
---@class emProfession
emProfession = {
	OneHand = 1,
	Bare = 2,
	Red = 3,
	Bow = 4,
	Blue = 5
}