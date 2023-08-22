
---@class PetManager
local m = {}

---重新加载脚本事件
function m.Init()
    PlayerManager.RefreshAttributeEvent:addAction(m.OnPetRefreshAttribute)
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

---宠物刷新加成计算
---@param player Player
function m.OnPetRefreshAttribute(player)
    local attkPoint = player:GetPetPoint(emPetPoint.AttkPoint)
    
    if attkPoint <= 0 then
        return
    end
    local minDC = attkPoint * 7
    local maxDC = minDC * 2
    local minMC = attkPoint * 12
    local maxMc = minMC * 2
    player:IncAttr(emBaseAttr.MinDC, math.floor(minDC));
    player:IncAttr(emBaseAttr.MaxDC, math.floor(maxDC));
    player:IncAttr(emBaseAttr.MinMC, math.floor(minMC));
    player:IncAttr(emBaseAttr.MaxMC, math.floor(maxMc));
end

--local json = require "cjson"

local function get_look(stage)
    local looks = {}
    local configs = LuaConfig.petConfig

    for key, value in pairs(configs) do
        if value.stage == stage then
            table.insert(looks, value.look)
        end
    end
    log(string.format("get_look state %s = %s", stage, json.encode(looks)))
    return looks[Random(#looks) + 1]
end

---宠物进阶事件
---@param player Player
---@param item Item
function m.StageUpEvent(player, item)
    local stage = item:Pet_GetPoint(emPetPoint.Stage)
    local level = item:Pet_GetPoint(emPetPoint.Level)

    if stage == 0 and level == 5 then
        local look = get_look(stage + 1)

        if look == nil then
            error("Lua PetManager.StageUpEvent error look is nil")
            return
        end

        item:Pet_SetLook(look);
        item:Pet_SetPoint(emPetPoint.Stage, 1)
        return
    end

    if stage == 1 and level == 15 then
        local look = get_look(stage + 1)
        if look == nil then
            error("Lua PetManager.StageUpEvent error look is nil")
            return
        end

        item:Pet_SetLook(look);
        item:Pet_SetPoint(emPetPoint.Stage, 2)
        return
    end

    if stage == 2 and level == 25 then
        local look = get_look(stage + 1)
        if look == nil then
            error("Lua PetManager.StageUpEvent error look is nil")
            return
        end

        item:Pet_SetLook(look);
        item:Pet_SetPoint(emPetPoint.Stage, 3)
        item:Pet_SetPoint(emPetPoint.Color, Random(5))
        return
    end

    player:SendMsg(3, string.format("提示：失去物品 妖精粉末*1, 宠物未发生任何变化！", item:Name()))
end


PetManager = m
return m