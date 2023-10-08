

local m = {

}


local varCastle_Status      = "莱蒂尼斯_攻城状态"
local varCastle_Guild       = "莱蒂尼斯_行会归属"
local varMain_Uid           = "城主石_Uid"
local varTidalWave_Uid      = "海啸祭坛_Uid"
local varTidalWave_Guild    = "海啸祭坛_行会归属"
local varFog_Uid            = "迷雾祭坛_Uid"
local varFog_Guild          = "迷雾祭坛_行会归属"
local varOrdinary_Uid       = "宁静祭坛_Uid"
local varOrdinary_Guild     = "宁静祭坛_行会归属"
local varFire_Uid           = "火焰祭坛_Uid"
local varFire_Guild         = "火焰祭坛_行会归属"



local mapTarget = {
    ["海啸祭坛守护石"] = true,
    ["迷雾祭坛守护石"] = true,
    ["宁静祭坛守护石"] = true,
    ["火焰祭坛守护石"] = true,
    ["城主石"] = true,
}

local maps = {
    ["海啸祭坛"] = true,
    ["火焰祭坛"] = true,
    ["迷雾祭坛"] = true,
    ["宁静祭坛"] = true,
    ["攻城大厅"] = true,
}

---前置申明
---@type LuaConfig
local luaConfig

---重新加载脚本事件target
function m.Init()
    luaConfig = LuaConfig
    --注册怪物死亡事件
    MonsterManager.MonsterDiedEvent:addAction(m.OnMonsterDiedEvent)
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

local function ResetGuildName(varName, guildName)
    Game:SetString(varName, guildName, false)
    local monsterUid = Game:GetNumber(varName, 0)
    local monster = Game:GetMonsterByUid(monsterUid)
    if monster ~= nil then
        monster:ChangeGuild(guildName)
    end
end


local function ResetCastle(guildName)
    ---重置祭坛石头=城主行会
    ResetGuildName(varFog_Uid, guildName)
    ResetGuildName(varMain_Uid, guildName)
    ResetGuildName(varFire_Uid, guildName)
    ResetGuildName(varOrdinary_Uid, guildName)
    ResetGuildName(varTidalWave_Uid, guildName)

    local allPlayer = Game:GetPlayerAll()
    if allPlayer == nil then
        return
    end
    for key, player in allPlayer:pairs() do
        if player == nil then
            goto continue
        end
        local mapConfig = luaConfig.mapConfig[player:GetCurrentMapIdx()]
        if mapConfig == nil then
            goto continue
        end
        if maps[mapConfig.map_name] then
            if player:GuildName() == guildName then
                player:SetGomePos(21792, 30886, -536)
                player:GoHome()
            else
                player:GoHome()
            end
        end
        ::continue::
    end
end


---怪物死亡事件
---@param killer Player 击杀玩家对象(可能为nil)
---@param monster Monster 怪物对象
function m.OnMonsterDiedEvent(killer , monster)
    if killer == nil then
        return
    end

    local monsterName = monster:Name()
    local mapName = mapTarget[monsterName]
    if mapName == nil then
        return
    end

    local guildName = killer:GuildName()
    ---改变图腾归属行会
    monster:ChangeGuild(guildName)

    if monster:Name() == "海啸祭坛守护石" then
        Game:SetString(varTidalWave_Guild, guildName, false)
        Game:SendMsg(3, string.format("提示：海啸祭坛已被 %s 占领！", guildName))
    end


    if monster:Name() == "宁静祭坛守护石" then
        Game:SetString(varOrdinary_Guild, guildName, false)
        Game:SendMsg(3, string.format("提示：宁静祭坛已被 %s 占领！", guildName))
    end


    if monster:Name() == "迷雾祭坛守护石" then
        Game:SetString(varFog_Guild, guildName, false)
        Game:SendMsg(3, string.format("提示：迷雾祭坛已被 %s 占领！", guildName))
    end


    if monster:Name() == "火焰祭坛守护石" then
        Game:SetString(varFire_Guild, guildName, false)
        Game:SendMsg(3, string.format("提示：火焰祭坛已被 %s 占领！", guildName))
    end

    if monster:Name() == "城主石" then
        Game:SetString(varCastle_Guild, guildName, true)
        ResetCastle(guildName)
        Game:SendMsg(3, string.format("提示：莱蒂尼斯城已被 %s 占领！", guildName))
    end
end

---祭坛进大厅触发
---@param player Player 玩家对象
---@param varName string 祭坛归属行会变量名
---@param stoneName string 祭坛名称
---@return boolean
local function OnPointTrigger(player, varName, stoneName)
    local myGuildName = player:GuildName()
    ---城主行会=行会名称
    if myGuildName == Game:GetString(varCastle_Guild, "") then
        return true
    end

    ---祭坛归属行会=行会名称
    if myGuildName == Game:GetString(varName, "") then
        return true
    end

    player:SendMsg(3, string.format("提示：行会未占领%s祭坛，无法使用传送功能！", stoneName))
    return false
end


---攻城前厅进入内城
---@param player Player
function m.OnPointTrigger_Main(player)
    return player:GuildName() == Game:GetString(varCastle_Guild, "")
end

---海啸传送大厅触发
---@param player Player
function m.OnPointTrigger_TidalWave(player)
    return OnPointTrigger(player, varTidalWave_Guild, "海啸")
end

---迷雾传送大厅触发
---@param player Player
function m.OnPointTrigger_Fog(player)
    return OnPointTrigger(player, varFog_Guild, "迷雾")
end

---宁静传送大厅触发
---@param player Player
function m.OnPointTrigger_Ordinary(player)
    return OnPointTrigger(player, varOrdinary_Guild, "宁静")
end

---火焰传送大厅触发
---@param player Player
function m.OnPointTrigger_Fire(player)
    return OnPointTrigger(player, varFire_Guild, "火焰")
end

---
---@param player Player
---@param x number
---@param y number
---@param z number
local function OnClickMainMapMove(player, x, y, z)
    local guildName = player:GuildName()
    
    if guildName then
        -- body
    end
end

---海啸传送
---@param player Player
---@param npc Npc
function m.OnClickMain_TidalWave(npc, player)

    player:MapMoveEx("Main_Scene", 22451, 31585, -934);
end

---迷雾传送
---@param player Player
---@param npc Npc
function m.OnClickMain_Fog(npc, player)
    player:MapMoveEx("Main_Scene", 23745, 31522, -818);
end

---宁静传送
---@param player Player
---@param npc Npc
function m.OnClickMain_Ordinary(npc, player)
    player:MapMoveEx("Main_Scene", 23181, 31547, -2107);
end

---火焰传送
---@param player Player
---@param npc Npc
function m.OnClickMain_Fire(npc, player)
    player:MapMoveEx("Main_Scene", 21808, 31567, -4418);
end

function m.Start()
    Game:SendMsg(3, "莱蒂尼斯攻城战开始！")
    Game:SetBool(varCastle_Status, true, false)

    ---@type Monster
    local monsterMain = Game:CreateMonsterByName("城主石", "Main_Scene", 21155, 31523, -581)
    local monsterFog = Game:CreateMonsterByName("迷雾祭坛守护石", "Main_Scene", 23745, 31533, -818)
    local monsterFire = Game:CreateMonsterByName("火焰祭坛守护石", "Main_Scene", 21791, 31492, -1218)
    local monsterOrdinary = Game:CreateMonsterByName("宁静祭坛守护石", "Main_Scene", 23038, 31554, -501)
    local monsterTidalWave = Game:CreateMonsterByName("海啸祭坛守护石", "Main_Scene", 22452, 31472, -5670)
    Game:SetNumber(varFog_Uid, monsterFog:Uid(), false)
    Game:SetNumber(varMain_Uid, monsterMain:Uid(), false)
    Game:SetNumber(varFire_Uid, monsterFire:Uid(), false)
    Game:SetNumber(varOrdinary_Uid, monsterOrdinary:Uid(), false)
    Game:SetNumber(varTidalWave_Uid, monsterTidalWave:Uid(), false)

    ---开始攻城时，存在城主行会
    local guildName = Game:GetString(varCastle_Guild, "")
    if guildName ~= "" then
        ResetCastle(guildName)
    end
end


function m.Stop()
    Game:SendMsg(3, "莱蒂尼斯攻城战结束！")
    local monsterUid = Game:GetNumber(varFog_Uid, 0)
    Game:RemoveMonsterByUid(monsterUid)
    local monsterUid = Game:GetNumber(varMain_Uid, 0)
    Game:RemoveMonsterByUid(monsterUid)
    local monsterUid = Game:GetNumber(varFire_Uid, 0)
    Game:RemoveMonsterByUid(monsterUid)
    local monsterUid = Game:GetNumber(varOrdinary_Uid, 0)
    Game:RemoveMonsterByUid(monsterUid)
    local monsterUid = Game:GetNumber(varTidalWave_Uid, 0)
    Game:RemoveMonsterByUid(monsterUid)
end



CastleFight = m
return m