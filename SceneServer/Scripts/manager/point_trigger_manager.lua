

---@class PointTriggerMnager
local m = {
    point = {}
}

---传入一个坐标获取指定范围内的所有坐标
---@param x number
---@param y number
---@param range number
---@return table
local function getCoordinatesInRange(x, y, range)
    local tab = {}
    local startX = x - range;
    local endX = x + range;
    local startY = y - range;
    local endY = y + range;
    --log(string.format("getCoordinatesInRange %s %s, %s %s, %s", x, y, startX, endX, range))
    --log(string.format("getCoordinatesInRange %s, %s %s", startY, endY, range))

    for _x = startX, endX, 1 do
        for _y = startY, endY, 1 do
            local point = {}
            point.x = _x
            point.y = _y
            table.insert(tab, point)
        end
    end
    return tab
end

---初始化传送点坐标
function m.Init()
    local pointConfig = LuaConfig.GetPointTriggerConfig()

    local tempTab = {}
    for key, value in pairs(pointConfig) do
        local tabPoint = getCoordinatesInRange(value.x, value.y, value.range)
        for _, point in pairs(tabPoint) do
            if tempTab[point.x] == nil then
                tempTab[point.x] = {}
            end
            tempTab[point.x][point.y] = value
        end
    end
    m.point = tempTab
end
GameManager.ScriptLoadedEvent:addAction(m.Init)

---点位移动触发
---@param player any
---@param x any
---@param y any
---@param z any
function m.PointMapMove(player, x, y, z)
    if m.point[x] == nil then
        return
    end
    if m.point[x][y] == nil then
        return
    end
    ---@type kx_point_trigger_data
    local pointConfig = m.point[x][y]
    player:MapMoveEx("Main_Scene", pointConfig.target_x, pointConfig.target_y, pointConfig.target_z);
   
end

PointTriggerMnager = m
return