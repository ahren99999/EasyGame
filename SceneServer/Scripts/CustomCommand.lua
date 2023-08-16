


local m = {}



local function CustomCommand_MakeItem(player, args)
    local itemName = args[2]
    local itemNum = args[3] == nil and 1 or tonumber(args[3])
    if itemName ~= nil then
        player:GiveItem(itemName, itemNum, "GM制造")
    end
end

---/刷怪
---@param player Player
---@param args any
local function CustomCommand_CreateMonster(player, args)
    local monsterName = args[2]
    local itemNum = args[3] == nil and 1 or tonumber(args[3])
    if monsterName ~= nil then
        if player == nil then
            return
        end
        local x = player:PosX() + 1;
        local y = player:PosY() + 1;
        Game:CreateMonsterByName(monsterName, player:SceneName(),x, y)
    end
end

local function CustomCommand_AddSkill(player, args)
    local skillName = args[2]
    local level = args[3] == nil and 1 or tonumber(args[3])
    if skillName == nil then
        return
    end

    if player == nil then
        return
    end
    player:AddSkill(skillName)
end

local function CustomCommand_RefreshSkillAll(player, args)
   if player == nil then
        return
   end
   player:RefreshSkillAll()
end

local function CustomCommand_MapMove(player, args)
    local sceneName = args[2]
    local x = tonumber(args[3])
    local y = tonumber(args[4])
    log("aaaaaaaa" .. x .. y)
    if player == nil then
        return
    end
    player:MapMove(sceneName, x, y)
end

local function CustomCommand_Map(player, args)
    player:SendMsg(3, string.format("系统：地图：%s X：%s Y：%s Z：%s", 
        player:SceneName(), player:PosX(), player:PosY(), player:PosZ()))
end

m.cmd = {
    ["11"] = {gm_level = 10, fun = CustomCommand_MakeItem},
    ["Map"] = {gm_level = 0, fun = CustomCommand_Map},
    ["移动"] = {gm_level = 10, fun = CustomCommand_MapMove},
    ["刷怪"] = {gm_level = 10, fun = CustomCommand_CreateMonster},
    ["增加技能"] = {gm_level = 10, fun = CustomCommand_AddSkill},
    ["刷新技能"] = {gm_level = 10, fun = CustomCommand_RefreshSkillAll},
}

---处理客户端发起的自定义命令
---@param player Player 使用命令的玩家对象
---@param args table 客户端发来的参数列表
function m.HandleCustomCommand(player, args)
    local cmd = m.cmd[args[1]]

    if cmd == nil then
        return
    end

    ---如果权限等级小于命令所需权限
    if player:GetNumber("管理员_权限等级", 0) < cmd.gm_level then
        player:SendMsg(3, "提示：权限不足！")
        return
    end

    if cmd then
        cmd.fun(player, args)
    end
end

CustomCommand = m
return m