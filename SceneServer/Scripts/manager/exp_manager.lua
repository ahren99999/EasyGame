

local m = {
    ---玩家经验倍率刷新事件
    RefreshExpRateEvent = Event.newEvent(),
}

---@type LuaConfig
local luaConfig

---重新加载脚本事件
function m.Init()
    luaConfig = LuaConfig
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

---获取经验倍率
---@param player Player
---@return number exp 经验倍率
local function GetExpMultiplier(player)
    return math.floor(player:PctExpRate() / 100)
end

---初始化角色经验倍率(首先计算)
---@param player Player
local function InitExpMultiplier(player)
    local level = player:Level()
    local val = 1;
    if level < 60 then
        val = 1000
    elseif level < 80  then
        val = 800
    elseif level < 100  then
        val = 600
    elseif level < 120  then
        val = 400
    elseif level < 140  then
        val = 200
    end
    player:SetPctExpRate(val)
    player:SendMsg(3, string.format("提示：受生命之树成长进度影响，您当前的经验倍率为: %s", GetExpMultiplier(player)))
end

---刷新角色经验倍率
---@param player Player
function m.RefreshExpRate(player)
    player:SetPctExpRate(100)
    InitExpMultiplier(player)
    m.RefreshExpRateEvent:trigger(player)
end

---处理经验衰减
---@param player Player 玩家对象
---@param monster Monster 怪物对象
---@param exp number 本次获取的经验
---@return number exp 返回本次成员可获取的经验值
local function HandleAttenuation(player, monster, exp)
    local rate = 100
    local level = player:Level()
    local monsterLevel = luaConfig.monsterConfig[monster:Idx()].level
    local num = level - monsterLevel

    --灰色怪物(大于100级)
    if num >= 100 then
        rate = 1
    --蓝色怪物(大于20级)
    elseif num > 20 then
        rate = 50
    --黄色怪物(大于11级)    
    elseif num >= 11 then
        rate = 80
    --红色怪物(小于18级)    
    elseif num <= -18 then
        rate = 50
    --橙色怪物(小于5级)
    elseif num <= -5 then
        rate = 100
    --粉色怪物(小于3级)
    elseif num <= -3 then
        rate = 120
    end
    return math.floor(exp * rate / 100)
end

---处理经验分享
---@param player Player 玩家对象
---@param monster Monster 怪物对象
---@param exp number 本次获取的经验
---@return number exp 返回本次成员可获取的经验值
local function HandleShared(player, monster, exp)

    if not player:HasTeam() then
        return exp
    end

    local teamNumbers = player:GetTeamNumbers()
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

---玩家获取经验事件
---@param player Player 玩家对象
---@param monster Monster 怪物对象
---@param exp number 本次获取的经验
---@return number exp 返回可获取的经验值
function m.OnSharedExpEvent(player, monster, exp)
    if exp <= 1 then
        return 1
    end
    --处理经验衰减
    exp = HandleAttenuation(player, monster, exp)
    --处理组队分享
    exp = HandleShared(player, monster, exp)
    return exp
end

ExpManager = m
return m