

---@class PlayerManager
local m = {
    ---玩家打开任务界面事件
    OpenQuestPanelEvent = Event.newEvent(),
    ---玩家属性刷新事件
    RefreshAttributeEvent = Event.newEvent(),

}

local luaConfig
---@type PetManager
local petManager
---@type BuffManager
local buffManager
---@type SkillManager
local skillManager

local skillBeAttached

---管理员名单
local adminList

---重新加载脚本事件
function m.Init()
    adminList = Admin
    luaConfig = LuaConfig
    petManager = PetManager
    buffManager = BuffManager
    skillManager = SkillManager
    skillBeAttached = SkillBeAttached
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

---管理员登录操作
---@param player Player
local function AdminLoginSucess(player)
    if not adminList[player:Name()]  then
       return
    end
    player:SetGod(true)
    local tempSpeed = player:GetNumber("临时属性_移动速度", 0)
    tempSpeed = tempSpeed + 1000
    player:SetNumber("管理员_权限等级", adminList[player:Name()], false)
    player:SetNumber("临时属性_移动速度", tempSpeed, false);
    player:SendMsg(3, string.format("尊敬的管理员！您好，当前开区天数 %s 开区分钟数 %s 场景在线玩家人数 %s",
    Game:GetNumber("全局变量_开区天数", 0), 
    Game:GetNumber("全局变量_开区分钟数", 0),
    Game:GetTotalPlayer()))
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

    player:RegisterTimer(1001, 1000 * 1, "OnlineRewards", "OnlineReward_Timer1001", true)       --在线奖励
    player:RegisterTimer(1002, 1000 * 1, "PlayerManager", "OnStateRecovery_Timer1002", true)    --状态恢复
    Game:SendMsg(2, string.format("系统:尊敬的玩家 %s 上线了！", player:Name()));
end

function m.OnStateRecovery_Timer1002(spirit)
    ---@type Player
    local player = spirit:ToPlayer()
    local hpRegen = player:GetAttr(emBaseAttr.HPRegen)
    local mpRegen = player:GetAttr(emBaseAttr.MPRegen)
    if hpRegen > 0 then
        local hp = player:HP()
        local maxHP = player:MaxExp()
        if hp < maxHP then
            player:IncAttr(emBaseAttr.HP, hpRegen)
        end
    end

    if mpRegen > 0 then
        local mp = player:MP()
        local maxMP = player:MaxMP()
        if mp < maxMP then
            player:IncAttr(emBaseAttr.MP, mpRegen)
        end
    end
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
    LuaRefreshAttribute(player)
    m.RefreshAttributeEvent:trigger(player)


    ---最终生命加成千分比
    local finalPerMilHP = player:GetAttr(emBaseAttr.FinalPerMilHP)
    if finalPerMilHP > 0 then
        local maxHP = player:GetAttr(emBaseAttr.MaxHP)
        player:IncAttr(emBaseAttr.MaxHP, math.floor( maxHP * finalPerMilHP / 1000))
    end

    ---最终魔法加成千分比
    local finalPerMilMP = player:GetAttr(emBaseAttr.FinalPerMilMP)
    if finalPerMilMP > 0 then
        local maxMP = player:GetAttr(emBaseAttr.MaxMP)
        player:IncAttr(emBaseAttr.MaxMP, math.floor( maxMP * finalPerMilMP / 1000))
    end

    ---最终物理攻击加成千分比
    local perMilDC = player:GetAttr(emBaseAttr.PerMilDC)
    if perMilDC > 0 then
        local minDC = player:GetAttr(emBaseAttr.MinDC)
        local maxDC = player:GetAttr(emBaseAttr.MaxDC)
        player:IncAttr(emBaseAttr.MinDC, math.floor( minDC * perMilDC / 1000))
        player:IncAttr(emBaseAttr.MaxDC, math.floor( maxDC * perMilDC / 1000))
    end

    ---最终魔法攻击加成千分比
    local perMilMC = player:GetAttr(emBaseAttr.PerMilMC)
    if perMilMC > 0 then
        local minMC = player:GetAttr(emBaseAttr.MinMC)
        local maxMC = player:GetAttr(emBaseAttr.MaxMC)
        player:IncAttr(emBaseAttr.MinMC, math.floor( minMC * perMilMC / 1000))
        player:IncAttr(emBaseAttr.MaxMC, math.floor( maxMC * perMilMC / 1000))
    end

    --物理攻击减少千分比
    local perMilSubDC = player:GetAttr(emBaseAttr.PerMilSubDC)
    if perMilSubDC > 0 then
        local minDC = player:GetAttr(emBaseAttr.MinDC)
        local maxDC = player:GetAttr(emBaseAttr.MaxDC)
        player:SubAttr(emBaseAttr.MinDC, math.floor( minDC * perMilSubDC / 1000))
        player:SubAttr(emBaseAttr.MaxDC, math.floor( maxDC * perMilSubDC / 1000))
    end

    --魔法攻击减少千分比
    local perMilSubMC = player:GetAttr(emBaseAttr.PerMilSubMC)
    if perMilSubMC > 0 then
        local minMC = player:GetAttr(emBaseAttr.MinMC)
        local maxMC = player:GetAttr(emBaseAttr.MaxMC)
        player:SubAttr(emBaseAttr.MinMC, math.floor( minMC * perMilSubMC / 1000))
        player:SubAttr(emBaseAttr.MaxMC, math.floor( maxMC * perMilSubMC / 1000))
    end

    --最终物理防御加成千分比
    local finalPerMilAC = player:GetAttr(emBaseAttr.FinalPerMilAC)
    if finalPerMilAC > 0 then
        local ac = player:GetAttr(emBaseAttr.AC)
        local perMilAC = player:GetAttr(emBaseAttr.PerMilAC)
        player:IncAttr(emBaseAttr.AC, math.floor( ac * finalPerMilAC / 1000))
        player:IncAttr(emBaseAttr.PerMilAC, math.floor( perMilAC * finalPerMilAC / 1000))
    end

    --最终魔法防御加成千分比
    local finalPerMilMAC = player:GetAttr(emBaseAttr.FinalPerMilMAC)
    if finalPerMilMAC > 0 then
        local mac = player:GetAttr(emBaseAttr.MAC)
        local perMilMAC = player:GetAttr(emBaseAttr.PerMilMAC)
        player:IncAttr(emBaseAttr.MAC, math.floor( mac * finalPerMilMAC / 1000))
        player:IncAttr(emBaseAttr.PerMilMAC, math.floor( perMilMAC * finalPerMilMAC / 1000))
    end    

    --物理防御减免千分比
    local perMilSubAC = player:GetAttr(emBaseAttr.PerMilSubAC)
    if perMilSubAC > 0 then
        local ac = player:GetAttr(emBaseAttr.AC)
        local perMilAC = player:GetAttr(emBaseAttr.PerMilAC)
        player:SubAttr(emBaseAttr.AC, math.floor( ac * perMilSubAC / 1000))
        player:SubAttr(emBaseAttr.PerMilAC, math.floor( perMilAC * perMilSubAC / 1000))
    end

    --魔法防御减少千分比
    local perMilSubMAC = player:GetAttr(emBaseAttr.PerMilSubMAC)
    if perMilSubMAC > 0 then
        local mac = player:GetAttr(emBaseAttr.MAC)
        local perMilMAC = player:GetAttr(emBaseAttr.PerMilMAC)
        player:SubAttr(emBaseAttr.MAC, math.floor( mac * perMilSubMAC / 1000))
        player:SubAttr(emBaseAttr.PerMilMAC, math.floor( perMilMAC * perMilSubMAC / 1000))
    end
end


---处理暴击加成
---@param player Player 攻击者
---@param spirit Spirit 被攻击的对象基类
---@param skill Skill 攻击者使用的技能对象
---@param skillDB kx_skill_data 攻击者使用的技能配置
---@param damage number 本次基础伤害值
local function HandleCrit(player, spirit, skill, skillDB, damage)
    local code = 0
    if skillDB.skill_type > 2 then
        return damage, 0
    end
    
    local ranNum = Random(1000)
    if skillDB.damage_type == 1 then
        local cri = player:GetAttr(emBaseAttr.CritRate)
        if cri > ranNum then
            code = 1
             damage = damage * player:GetAttr(emBaseAttr.CritDamageBonus) / 100
        end
    elseif skillDB.damage_type == 2 then
        local cri = player:GetAttr(emBaseAttr.MagicCritRate)
        if cri > ranNum then
            code = 5
            damage = damage * player:GetAttr(emBaseAttr.MCritDamageBonus) / 100
        end
    end

    return damage, code
end

---处理怪物防御
---@param player Player 攻击者
---@param monster Monster 被攻击的玩家对象
---@param skill Skill 攻击者使用的技能对象
---@param skillDB kx_skill_data  攻击者使用的技能配置
---@param damage number 伤害
---@param isMust boolean 是否必中
---@return number 返回防御减免后伤害
local function HandleMonsterDefenses(player, monster, skill, skillDB, damage, isMust)
    return damage   --todo 怪物防御等待实现
end


---被攻击时处理身上的buff
---@param player Player 被攻击者
---@param spirit Spirit 攻击者
---@param damage number 伤害值
---@return number 返回伤害值
local function HandeleSkillBuff(player, spirit, damage)
    return skillBeAttached.HandeleSkillBuff(player, spirit, damage)
end

---玩家发起攻击事件
---此处是最终伤害计算
---返回攻击、伤害效果、是否魔法攻击
---伤害效果: 0:掉蓝 1:致命 2:眩晕 4掉血 5:最大化
---@param player Player 攻击者
---@param spirit Spirit 被攻击的对象基类
---@param skill Skill 攻击者使用的技能对象
---@return number, number, boolean 返回伤害、伤害效果、是否魔法攻击
function m.OnPlayerAttackEvent(player, spirit, skill)
    ---@type kx_skill_data
    local skillDB = luaConfig.skillConfig[skill:Idx()]
    local code = 0                          ---攻击效果 0:掉蓝 1:致命 2:眩晕 4掉血 5:最大化
    local damage = 0                        ---基础伤害值
    local katarsDamage = 0                  ---真实伤害
    local isMust = false                    ---是否必中
    local isMagic = skillDB.damage_type == 2---是否魔法伤害


    ---获取本次基础伤害值、真实伤害值、是否必中
    damage, katarsDamage, isMust = skillManager.HandlePlayerAttack(player, spirit, skill, skillDB)
    ---获取计算暴击后的伤害值、攻击效果
    damage, code = HandleCrit(player, spirit, skill, skillDB, damage)

    if spirit:IsPlayer() then
        ---处理人物防御
        damage = m.OnPlayerDamageEvent(spirit, player, damage, isMust, isMagic)

    else
        ---处理怪物防御
        damage = HandleMonsterDefenses(player, spirit, skill, skillDB, damage, isMust)
    end

    if damage > 0 and spirit:IsPlayer()  then
        local otherPlayer = spirit:ToPlayer()
        if isMagic then
            --最终魔法伤害减免千分比
            local finalPerMilSubMC = otherPlayer:GetAttr(emBaseAttr.FinalPerMilSubMC)
            if finalPerMilSubMC > 0 then
                if finalPerMilSubMC >= 1000 then
                    damage = 0
                else
                    damage = damage - math.floor(damage * finalPerMilSubMC / 1000)
                end
            end
        else
            --最终物理伤害减免千分比
            local finalPerMilSubDC = otherPlayer:GetAttr(emBaseAttr.FinalPerMilSubDC)
            if finalPerMilSubDC > 0 then
                if finalPerMilSubDC >= 1000 then
                    damage = 0
                else
                    damage = damage - math.floor(damage * finalPerMilSubDC / 1000)
                end
            end
        end
    end

    ---todo 攻击者武器减耐久

    ---todo 被攻击者护甲减耐久

    ---加上真实伤害
    damage  = math.floor(damage + katarsDamage)
    return damage, code, isMagic
end




---玩家被攻击事件
---返回计算后的伤害值
---lua层显示调用
---C++怪物攻击调用
---@param player Player 被攻击的玩家对象
---@param spirit Spirit 攻击者(可能是怪物、可能是人物)
---@param damage number 伤害
---@param isMust boolean 是否必中
---@param isMagic boolean 是否魔法攻击
---@return number damage 返回本次攻击的伤害如果为0则躲避
function m.OnPlayerDamageEvent(player, spirit, damage, isMust, isMagic)
    ---处理被攻击玩家身上的Buff
    damage = HandeleSkillBuff(player, spirit, damage)

    ---计算物理防御
    if isMagic == false then
        
        local hit = 0
        local deHit = 0;
        if spirit:IsPlayer() then
            ---@type Player
            local otherPlayer = spirit
            ---攻击者玩家属性
            hit = otherPlayer:GetAttr(emBaseAttr.HIT) + 100              ---命中
            deHit = otherPlayer:GetAttr(emBaseAttr.ReducedBlockChance)   ---降低对方格挡率
        else
            ---如果是怪物默认给予10点属性
            hit = 100
        end

        ---被攻击者玩家属性
        local blockRate = player:GetAttr(emBaseAttr.BlockRate)  ---格挡成功率
        local ac = player:GetAttr(emBaseAttr.AC)                       ---物理防御力
        local perMilAC = player:GetAttr(emBaseAttr.PerMilAC)     ---物理防御千分比
        local pr = player:GetAttr(emBaseAttr.PR)                       ---物理反弹 todo

        ---计算命中率
        local hitRate = hit + deHit + blockRate
        local ranNum = Random(hitRate)
        if (ranNum > ( hit + deHit) and (isMust == false) ) then
            return 0
        end

        ---物理防御千分比减免的伤害值
        local subDamage = 0
        if perMilAC > 0 then
            subDamage = damage * perMilAC / 1000;
        end

        damage = damage - ac
        damage = damage - subDamage
        ---破不了防给予少许伤害
        damage =  math.floor(damage < 0 and RandomEx(1, 10) or damage)
    ---计算魔法防御    
    else
        ---被攻击者得玩家属性
        local mac = player:GetAttr(emBaseAttr.MAC)                  ---魔法防御力
        local perMilMAC = player:GetAttr(emBaseAttr.PerMilMAC)      ---魔法防御千分比
        local magicResistance = player:GetAttr(emBaseAttr.MagicResistance)---魔法抵抗力

        ---魔法防御千分比减免的伤害值
        local subDamageA = 0
        if perMilMAC > 0 then
            subDamageA = damage * perMilMAC / 1000;
        end

        ---魔法抵抗力减免的伤害值
        local subDamageB = 0
        if magicResistance > 0 then
            subDamageB = damage * magicResistance / 1000;
        end

        damage = damage - mac
        damage = damage - subDamageA
        damage = damage - subDamageB
        ---破不了防给予少许伤害
        damage = math.floor(damage < 0 and RandomEx(1, 50) or damage)
    end

    ---计算魔法屏障抵消
    if player:HasSkillBuff(6) then
        local mpReduction = player:GetNumber("BUFF技能_魔法屏障_MP抵抗_临时属性", 0)
        local damageReduction = player:GetNumber("BUFF技能_魔法屏障_伤害减免_临时属性", 0)
        if mpReduction > 0 and damageReduction > 0 then
            local subMP = math.floor(damage * mpReduction / 100)
            if player:MP() <= subMP then
                player:RemoveBuffByIdx(6)
            end
            player:SubMP(subMP)
            damage = math.floor(damage * damageReduction / 100)
        end
    end
    return damage
end

--玩家被死亡事件
---@param player Player 死亡的玩家对象
---@param killer Spirit 击杀者(可能为空)
---@return boolean ok 返回false 玩家不死亡 返回true正常死亡
function m.OnPlayerDeadEvent(player, killer)
    
    if killer ~= nil and killer:IsPlayer() then
        local mapDB = LuaConfig.mapConfig[player:GetCurrentMapIdx()]
        --@RGB=231-90-39
        Game:SendMsg(2, string.format("[PVP频道] %s 技艺精湛，在%s击败了%s级的 %s", 
        killer:Name(),
        mapDB.map_name,
        player:Level(),
        player:Name()
    ))
    end

    return true
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


---玩家打开任务界面
---@param player Player 玩家对象
---@param vIncompleteTasks Quest[] 未完成的任务
---@param vCompletedTasks string 已完成的任务
function m.OnOpenQuestPanelEvent(player, vIncompleteTasks, vCompletedTasks)
    --每日任务
    --DailyQuest.OnOpenQuestPanelEvent(player, vIncompleteTasks, vCompletedTasks)

    m.OpenQuestPanelEvent:trigger(player, vIncompleteTasks, vCompletedTasks)
end




PlayerManager = m
return m