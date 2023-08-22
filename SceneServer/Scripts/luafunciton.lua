---@class Utility
local m = {}



---获取元素在table的下标,没有找到返回0
---@param tab table
---@param item any
---@return number
function m.VecIndexOf(tab, item)
    local idx = 0
    for i = 0, #tab, 1 do
        if item == tab[i] then
            return idx
        end
        idx = idx + 1
    end
    return -1
end


---计算两个坐标点的距离
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function m.Distance(x1, y1, x2, y2)
    local dx = x2 - x1;
    local dy = y2 - y1;
    return math.sqrt(dx * dx + dy * dy)
end

function m.ConcatTable(tbl, indent)
    indent = indent or 0
    local result = ""

    for k, v in pairs(tbl) do
        if type(v) == "table" then
            result = result .. string.rep(" ", indent) .. k .. " (table):\n"
            result = result .. m.ConcatTable(v, indent + 4) -- 递归调用concatTable来拼接嵌套表
        else
            result = result .. string.rep(" ", indent) .. k .. " " .. tostring(v) .. "\n"
        end
    end

    return result
end

---奖励道具转换字符串
---@param tabRewards any
function m.RewardsToStr(tabRewards)
    local str = ""
    for index, value in ipairs(tabRewards) do
        if index ~= #tabRewards then
            str = string.format("%s%s*%s、", str, value.name, value.count)
        else
            str = string.format("%s%s*%s", str, value.name, value.count)
        end
    end
    return str
end

---批量给予玩家奖励
---@param player Player 玩家对象
---@param tabRewards TabRewards[] 奖励列表
---@param desc string 备注
function m.GiveRewards(player, tabRewards, desc)
    for index, value in ipairs(tabRewards) do
        if value.name == "金币" then
            player:IncGold(value.count)
        elseif value.name == "经验" then
            player:IncExp(value.count)
        else
            player:GiveItem(value.name, value.count, desc)
        end
    end
end


Utility = m
return m