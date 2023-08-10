

---@class PlayerManager
local m = {}

---@type PetManager
local petManager
---@type BuffManager
local buffManager
---@type SkillManager
local skillManager

---重新加载脚本事件
function m.Init()
    petManager = PetManager
    buffManager = BuffManager
    skillManager = SkillManager
end

---管理员登录操作
---@param player Player
local function AdminLoginSucess(player)
    if not Admin[player:Name()]  then
       return
    end
    player:SetGod(true)
    --player:SetHiding(true)
    local tempSpeed = player:GetNumber("临时属性_移动速度", 0)
    tempSpeed = tempSpeed + 1000
    player:SetNumber("临时属性_移动速度", tempSpeed, false);
    log(string.format("AdminLoginSucess name %s", player:Name()));
end



---玩家登录成功
---@param player Player
function m.LoginSuccess(player)
    if player:IsNew() then
        local des = "新人道具"
        player:GiveItem("小型生命血瓶", 100, des)
        player:GiveItem("小型魔法药瓶", 100, des)
        player:GiveItem("鹰眼卷轴", 100, des)
        player:GiveItem("高级回城卷轴", 100, des)
        player:GiveItem("提速卷轴", 100, des)
        player:GiveItem("攻击速度卷轴", 100, des)
    end
    player:SetPrestige(255)
    AdminLoginSucess(player)                                --管理员登录
    ExpManager.InitExpMultiplier(player)                    --初始化经验倍率

    player:RegisterTimer(1001, 1000 * 1, "OnlineRewards", "OnlineReward_Timer1001", true)   --在线奖励
    Game:SendMsg(2, string.format("系统:尊敬的玩家 %s 上线了！", player:Name()));
end

---玩家升级事件(升级后)
---@param player Player
function m.LevelUpEvent(player)
    ExpManager.InitExpMultiplier(player)                    --初始化经验倍率
end


---玩家位置更新事件 1秒触发3次 
---@param player Player 玩家对象
---@param x number 移动后的x坐标
---@param y number 移动后的y坐标
---@param z number 移动后的z坐标(UE4坐标)
function m.UpdatePostionEvent(player, x, y, z)
    PointTriggerMnager.PointMapMove()
end


---Lua层刷新临时附加属性
---@param player any
local function LuaRefreshAttribute(player)
    --处理移动速度
    local tempSpeed = player:GetNumber("临时属性_移动速度", 0)
    if tempSpeed > 0 then
        player:IncAttr(emBaseAttr.MoveSpeed, tempSpeed);
    end

    --处理攻击速度
    local tempSpeed = player:GetNumber("临时属性_攻击速度", 0)
    if tempSpeed > 0 then
        player:IncAttr(emBaseAttr.AttackSpeed, tempSpeed);
    end
 
end

---玩家刷新附加属性事件
---穿戴装备或者变更属性点时触发
---@param player Player
function m.RefreshAttribute(player)
    buffManager.OnBuffRefreshAttribute_1(player)            --刷新移动速度卷轴
    buffManager.OnBuffRefreshAttribute_2(player)            --刷新攻击速度卷轴
    petManager.OnPetRefreshAttribute(player)                --刷新宠物附加属性
    skillManager.OnSkillRefreshAttribute(player)            --刷新被动技能属性
    LuaRefreshAttribute(player)
end

--玩家发起攻击事件
---@param player Player 攻击者
---@param spirit Spirit 被攻击的对象基类
---@param skillName string 攻击者使用的技能英文名
---@param value number 伤害
---@param isMagic boolean 是否魔法攻击
---@return number damage 返回本次攻击的伤害如果为0则躲避
function m.OnPlayerAttackEvent(player, spirit, skillName, value, isMagic)
    
    return value
end

--玩家被攻击事件
---@param player Player 被攻击的玩家对象
---@param spirit Spirit 攻击者
---@param skillName string 攻击者使用的技能英文名
---@param value number 伤害
---@param isMagic boolean 是否魔法攻击
---@return number damage 返回本次攻击的伤害如果为0则躲避
function m.OnPlayerDamageEvent(player, spirit, skillName, value, isMagic)
    
    return value
end


---玩家组队获取经验事件
---@param player Player 获取经验的成员
---@param exp number 本次获取的经验
---@return number exp 返回本次成员可获取的经验值
function m.OnSharedExpEvent(player, exp)
    local teamNumbers = player:GetTeamNumbers();

    if teamNumbers == nil then
        return exp
    end

    if #teamNumbers == 0 then
        return exp
    end

    local x1 = player:PosX()
    local y1 = player:PosY();
    local vd = player:VD();                      --视野

    for i = 1, #teamNumbers, 1 do
        local _player = teamNumbers[i]
        if _player == nil  then
            goto continue
         end
          local dis = Utility.Distance(x1, y1, _player:PosX(), _player:PosY())

        if dis > vd then                        --如果队伍成员距离大于视野
            goto continue
        end
        _player:IncExp(math.floor(exp * 0.1))   --成员获取到百分之10的经验
        :: continue ::
    end
    teamNumbers = nil
    return exp
end

---打开摆摊事件
---@param player Player
---@return boolean ok 返回false 不允许摆摊 返回true允许摆摊
function m.OnOpenStallEvent(player)

    if player:LuaStatus() ~= emPlayerStatus.Normal then
        player:SendMsg(3, "提示：当前状态无法摆摊！")
        return false
    end

    player:LuaSetStatus(emPlayerStatus.PreparingStall)

    return true
end

---确认摆摊事件
---@param player Player
---@return boolean ok 返回false 不允许摆摊 返回true允许摆摊
function m.OnConfirmStallEvent(player)

    if player:LuaStatus() ~= emPlayerStatus.PreparingStall then
        return false
    end

    player:LuaSetStatus(emPlayerStatus.StallOpen)

    return true
end

---上架摆摊物品
---@param player Player 玩家对象
---@param item Item 上架的物品对象
---@param gold number 上架的金额
---@return boolean ok 返回false 不允许上架 返回true允许上架
function m.OnAddStallItemEvent(player, item, gold)
    
    return true
end

---购买摆摊物品
---@param player Player 玩家对象
---@param item Item 上架的物品对象
---@param gold number 购买的总价
---@param count number 购买的数量
---@return boolean ok 返回false 不允许购买 返回true允许购买
function m.OnBuyStallItemsEvent(player, item, gold, count)
    
    return true
end






PlayerManager = m
return m