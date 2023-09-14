

local m = {}

local luaConfig = LuaConfig

---重新加载脚本事件
function m.Init()
    luaConfig = LuaConfig
end
GameManager.ScriptLoadedEvent:addAction(m.Init)


---初始化场景
---@param scene Scene
local function InitNpc(scene)
    local npcConfig = luaConfig.npcConfig
    for index, npcDB in ipairs(npcConfig) do
        if npcDB == nil then
            goto continue
        end
        if not npcDB.is_copy then
            goto continue
        end
        if npcDB.copy_name ~= "Copy_Map4" then
            goto continue
        end
        Game:CreateNpc(npcDB.idx, scene:Name(), npcDB.x, npcDB.y, npcDB.z)
        ::continue::
    end
end

local monster_config = {
    [1] = {
        name = "迷雾狼统领",
        x = 26418,
        y = 25153
    }
}

---初始化场景怪物
local function InitMonster(scene)
    for index, config in ipairs(monster_config) do
        Game:CreateMonsterByName(config.name, scene:Name(), config.x, config.y)
    end
end

---地图传送触发 副本五1去2
---@param player Player
---@return boolean false:无法传送 true:允许传送
function m.OnPointTrigger_1(player)
    local scene = Game:GetSceneByName(player:SceneName())
    if scene:GetMonsterCount() > 0 then
        player:SendMsg(3, "提示：当前副本中的怪物未清理完，无法使用传送点！")
        return false
    end
    return true
end



function m.OnClickMain_1(npc, player)
    local content = [[你好呀！%s 
    怎么？你想要放弃挑战？
    ]]

    local select = {
        "我要回城|OnClickGoHome",
        "离开|Exit"
    }

    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

---@param npc Npc
---@param player Player
function m.OnClickGoHome(npc, player)
    player:MapMoveEx("Main_Scene", player:GoHomeX(),  player:GoHomeY(),  player:GoHomeZ())
end

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。你想挑战副本地图吗？
    ]]

    local select = {
        "我要挑战副本4|OnClickEnterCopy(Copy_Map4)",
        "我要挑战副本5|OnClickEnterCopy(Copy_Map5)",
        "离开|Exit"
    }

    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickEnterCopy(npc, player, args)
    local copyName = args[1]
    if copyName == nil then
        return
    end
    if Game:GetSceneCount(copyName) > 1 then
        player:SendMsg(3, "提示：当前副本地图已满，请稍后再试！")
        return
    end
    Game:AsyncCreateScene(copyName, function (scene)
        if scene == nil  then
            player:SendMsg(3, string.format("提示：创建副本失败，未获取到地图 %s 配置...", copyName))
            return
        end
        InitNpc(scene)
        InitMonster(scene)
        player:MapMoveEx(scene:Name(), 26467, 25141, -3998);
    end)
end


---@param npc Npc
---@param player Player
function m.OnClickSetGoHome(npc, player)
    player:SetGomePos(player:PosX(), player:PosY())
    player:SendMsg(3, "提示：您设置了新的回城坐标！")
end




CopyMap4Npc = m
return m