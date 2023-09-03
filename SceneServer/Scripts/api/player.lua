
---玩家对象
---@class player:Spirit
local player

--- 是否新玩家
--- @return boolean
function player:IsNew()
end

--- 无敌
--- @return bool
function player:God()
end

--- 设置无敌
--- @param status bool 设置无敌状态
function player:SetGod(status)
end

--- 隐身
--- @return bool
function player:Hiding()
end

--- 设置隐身
--- @param status bool 设置隐身状态
function player:SetHiding(status)
end

--- 连接ID
--- @return int64_t
function player:ConnId()
end

--- 坐标Z
--- @return int32_t
function player:PosZ()
end

--- 种族
--- @return string
function player:Race()
end

--- 性别
--- @return uint8_t
function player:Gender()
end

--- 职业
--- @return string
function player:Profession()
end

--- 出生地
--- @return string
function player:BirthPlace()
end

--- 行会名称
--- @return string
function player:GuildName()
end

--- 发型发色
--- @return string
function player:HairColor()
end

--- 当前血量
--- @return uint32_t
function player:HP()
end

--- 最大血量
--- @return uint32_t
function player:MaxHP()
end

--- 当前魔法
--- @return uint32_t
function player:MP()
end

--- 最大魔法
--- @return uint32_t
function player:MaxMP()
end

--- 扣除魔法
--- @param val int32_t
function player:SubMP(val)
end

--- 力量点数
--- @return uint16_t
function player:STR()
end

--- 敏捷点数
--- @return uint16_t
function player:DEX()
end

--- 精神点数
--- @return uint16_t
function player:SPI()
end

--- 白魔法
--- @return uint16_t
function player:WhiteMagic()
end

--- 红魔法
--- @return uint16_t
function player:RedMagic()
end

--- 蓝魔法
--- @return uint16_t
function player:BlueMagic()
end

--- 黄魔法
--- @return uint16_t
function player:YellowMagic()
end

--- 黑魔法
--- @return uint16_t
function player:BlackMagic()
end

--- 计算魔法力
--- @return uint32_t
function player:TotalMagic()
end

--- 可分配点数
--- @return uint16_t
function player:DistributablePoints()
end

--- 设置可分配点数
--- @param val uint16_t 可分配点数
function player:SetDistributablePoints(val)
end

--- 金币
--- @return int64_t
function player:Gold()
end

--- 减少金币
--- @param num uint64_t 减少的金币数量
function player:SubGold(num)
end

--- 增加金币
--- @param num uint64_t 增加的金币数量
function player:IncGold(num)
end

--- 等级
--- @return uint16_t
function player:Level()
end

--- 等级提升
function player:LevelUp()
end

--- 经验倍率
--- @return int64_t
function player:ExpMultiplier()
end

--- 当前经验
--- @return uint64_t
function player:CurrentExp()
end

--- 升级最大经验
--- @return int64_t
function player:MaxExp()
end

--- 增加当前经验
--- @param val int32_t 增加的当前经验值
function player:IncExp(val)
end

--- 移动速度
--- @return float_t
function player:MoveSpeed()
end

--- 是否PK
--- @return bool
function player:IsPK()
end

--- 设置PK
--- @param status bool 是否PK状态
function player:SetPK(status)
end

--- 是否战斗中
--- @return bool
function player:IsFight()
end

--- 设置战斗状态
--- @param status bool 是否战斗状态
function player:SetFight(status)
end

--- 穿戴信息
--- @return vector<int64_t>
function player:AttireWear()
end

--- 当前的物理技能
--- @return string
function player:CurrentPhysSkill()
end

--- 设置当前物理技能
--- @param name string 当前物理技能名字
function player:SetCurrentPhysSkill(name)
end

--- 当前的物理魔法技能
--- @return string
function player:CurrentPhysMagSkill()
end

--- 设置当前物理魔法技能
--- @param name string 当前物理魔法技能名字
function player:SetCurrentPhysMagSkill(name)
end

--- 当前的魔法技能
--- @return string
function player:CurrentMagicSkill()
end

--- 设置当前魔法技能
--- @param name string 当前魔法技能名字
function player:SetCurrentMagicSkill(name)
end

--- 最后登录时间
--- @return uint64_t
function player:LastLoginTime()
end

--- 回城X坐标
--- @return int32_t
function player:GoHomeX()
end

--- 回城Y坐标
--- @return int32_t
function player:GoHomeY()
end

--- 设置回城坐标
--- @param x int32_t 回城X坐标
--- @param y int32_t 回城Y坐标
function player:SetGomePos(x, y)
end

--- 当前对话的Npc
--- @return NpcPtr
function player:CurrentNpc()
end


--- 职业的枚举下标
--- @return int8_t
function player:ProfessionIndex()
end

--- 声望
--- @return int32_t
function player:Prestige()
end

--- 设置声望
--- @param val int32_t 声望值
function player:SetPrestige(val)
end

--- 状态
--- @return int8_t
function player:LuaStatus()
end

--- 设置状态
--- @param val int8_t 状态值
function player:LuaSetStatus(val)
end

--- 发送系统消息
--- @param msgType uint8_t 消息类型
--- @param msgCode uint16_t 配置索引号
function player:SendMsgEx(msgType, msgCode)
end

--- 发送系统消息
--- @param msgType uint8_t 消息类型
--- @param msg string 消息内容
function player:SendMsg(msgType, msg)
end

--- 增加一个物品(自动判断背包，并自动合并叠加物品)
--- @param itemName string 物品名称
--- @param num int32_t 数量
--- @param des string 物品来源
function player:GiveItem(itemName, num, des)
end

--- 通过物品名字扣除物品
--- @param itemName string 物品名称
--- @param num uint32_t 数量
--- @return boolean 是否扣除成功
function player:TakeItemByName(itemName, num)
end

--- 通过物品名字获取物品数量
--- @param itemName string 物品名称
--- @return uint32_t 拥有的道具数量
function player:GetItemNumByName(itemName)
end


--- 增加技能
--- @param name string 技能名字
function player:AddSkill(name)
end

--- 增加技能经验
--- @param skiiName_US string 技能英文名称
function player:IncSkillExp(skiiName_US)
end

--- 在世界场景新增一个Buff技能
--- @param skillName_US string 技能英文名称(必须配置了Buff)
--- @param buffUid uint32_t 创建Buff的唯一ID
--- @param x int32_t 游戏坐标x
--- @param y int32_t 游戏坐标y
--- @param z int32_t 游戏坐标z
function player:AddSkillBuff(skillName_US, buffUid, x, y, z)
end

--- 在世界场景移除一个Buff技能
--- @param buffUid uint32_t Buff技能的唯一ID
function player:RemoveSkillBuff(buffUid)
end

--- 通过穿戴位置获取穿戴的装备 为空就是没有穿戴
--- @param wearSlot 穿戴位置
--- @returns Item
function player:GetEquipmentBySlot(wearSlot)
end

--- 通过Idx获取技能对象
--- @param idx 技能配置索引
--- @returns Skill
function player:GetSkillByIdx(idx)
end

--- 获取 buff 技能通过uid
--- @param buffUid
--- @returns Skill
function player:GetSkillBuffByUid(buffUid)
end

--- 通过技能中文名称获取技能对象
--- @param name
--- @returns Skill
function player:GetSkillByName(name)
end

--- 通过技能英文名称获取技能对象
--- @param name
--- @returns Skill
function player:GetSkillByName_US(name)
end

--- 是否在安全区
--- @returns boolean
function player:IsInSafe()
end

--- 地图移动
--- @param sceneName 场景名称
--- @param x 游戏坐标x
--- @param y 游戏坐标y
function player:MapMove(sceneName, x, y)
end

--- 带有Z坐标的地图移动
--- @param sceneName 场景名称
--- @param x 游戏坐标x
--- @param y 游戏坐标y
--- @param z 游戏坐标z
function player:MapMoveEx(sceneName, x, y, z)
end

--- 收起宠物
--- @param isDie 回收时设置宠物死亡
function player:RecallPet(isDie)
end

--- 是否启用宠物
--- @returns boolean
function player:IsEnablePet()
end

--- 获取宠物属性
--- @param point 属性枚举值
--- @returns int64_t
function player:GetPetPoint(point)
end

--- 设置宠物属性,自动刷新客户端
--- @param point 属性枚举值
--- @param val 数值
function player:SetPetPoint(point, val)
end

--- 是否是队长
--- @returns boolean
function player:IsCaptain()
end

--- 是否在队伍中
--- @returns boolean
function player:HasTeam()
end

--- 获取队长
--- @returns player
function player:GetCaptain()
end

--- 离开队伍
function player:LeaveTeam()
end

--- 获取组队成员(不包含自己)
--- @returns table
function player:GetTeamNumbers()
end

--- 注册一个定时器
--- @param timerId 定时器id
--- @param ms 延迟
--- @param tableName lua 表名
--- @param funName lua 函数名
--- @param isLoop 是否循环
function player:RegisterTimer(timerId, ms, tableName, funName, isLoop)
end

--- 取消一个定时器
--- @param timerId 定时器id
function player:UnRegisterTimer(timerId)
end

--- 新增一个Buff，会覆盖相同Buff
--- @param buffIdx Buff配置idx
--- @param duration 持续时间
--- @param isSave 离线是否保存
function player:AddBuffByIdx(buffIdx, duration, isSave)
end

--- 新增一个Buff，会覆盖相同Buff
--- @param skillName_US 技能英文名称
--- @param duration 持续时间
--- @param isSave 离线是否保存
function player:AddBuffByName_US(skillName_US, duration, isSave)
end

--- 增加当前经验
--- @param val 经验值
function player:IncExp(val)
end

--- 增加属性值
--- @param attr 属性枚举
--- @param value 数值
function player:IncAttr(attr, value)
end

--- 减少属性值
--- @param attr 属性枚举
--- @param value 数值
function player:SubAttr(attr, value)
end

--- 获取属性值
--- @param attr 属性枚举
--- @returns int32_t
function player:GetAttr(attr)
end

--- 设置属性值
--- @param attr 属性枚举
--- @param value 数值
function player:SetAttr(attr, value)
end

--- 获取基本属性点数
--- @param idx 1：力量 2：敏捷 3：精神 4：魔法点数
--- @returns int32_t
function player:GetBasePonit(idx)
end

--- 刷新基础属性(重新计算属性)
--- @param isLogin 是否登录
function player:RefreshAttribute(isLogin)
end

--- 判断是否拥有buff
--- @param idx uint32_t
--- @return boolean
function player:HasSkillBuff(idx)
end

--- 通过buffIdx移除buff技能
--- @param idx uint32_t
function player:RemoveBuffByIdx(idx)
end

--- 获取SC点数
--- @return int32_t
function player:SCPoint()
end

--- 设置SC点数
--- @param val int32_t
function player:SetSCPoint(val)
end

--- 获取RC点数
--- @return int32_t
function player:RCPoint()
end

--- 设置RC点数
--- @param val int32_t
function player:SetRCPoint(val)
end

--- 获取觉醒阶段
--- @return int32_t
function player:AwakeningStage()
end

--- 设置觉醒阶段
--- @param val int32_t
function player:SetAwakeningStage(val)
end

--- 检查是否处于眩晕状态
--- @return boolean
function player:Stun()
end

--- 设置眩晕状态
--- @param val boolean
function player:SetStun(val)
end

--- 检查是否处于变身状态
--- @return boolean
function player:Transformation()
end

--- 设置变身状态
--- @param val boolean
function player:SetTransformation(val)
end

--- 获取左边聊天频道
--- @return string
function Player:ChatChannelLeft()
end

--- 获取右边聊天频道
--- @return string
function Player:ChatChannelRight()
end

--- 在场景中新增一个技能Buff
--- @param skillName_US string 技能英文名
--- @param sceneName string 场景名称
--- @param x int32_t UE坐标x
--- @param y int32_t UE坐标y
--- @param z int32_t UE坐标z
--- @param duration int32_t 持续时间
--- @param isSave bool 是否保存
function Player:AddBuffInScene(skillName_US, sceneName, x, y, z, duration, isSave)
end

--- 获取所有buff idx（排除无图标的buff）
--- @return table
function Player:GetAllBuffs()
end

--- 获取buff叠加次数
--- @param idx uint32_t buffIdx
--- @return int8_t
function Player:GetBuffStackCount(idx)
end

--- 获取UE坐标x
--- @return int32_t
function Player:Pos_UEX()
end

--- 获取UE坐标y
--- @return int32_t
function Player:Pos_UEY()
end

--- 扣除人物血量
--- @param val int64_t 扣除的血量值
--- @param spirit SpiritPtr
function Player:SubHP(val, spirit)
end

--- 播放伤害
--- @param uid uint32_t 目标uid
--- @param damage int32_t 伤害值
--- @param code int8_t 攻击效果
function Player:ShowDamage(uid, damage, code)
end

--- 获取C++智能指针
--- @return table
function Player:GetPlayerPtr()
end

--- 检查频道是否相同
--- @param otherPlayer PlayerPtr
--- @return boolean
function Player:CheckChannel(otherPlayer)
end

--- 检查是否在同一队伍
--- @param otherPlayer PlayerPtr
--- @return boolean
function Player:IsSameTeam(otherPlayer)
end
