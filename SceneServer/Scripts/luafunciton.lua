---@class Utility
local m = {}

---UE坐标转游戏坐标
---@param ueX any
---@param ueY any
---@return unknown
---@return unknown
function m.UEPosToGamePos(ueX, ueY)
    return math.floor(ueX / 100 + 26009), math.floor( ueY / 100 + 26009);
end

---游戏坐标转UE坐标
---@param gameX any
---@param gameY any
---@return unknown
---@return unknown
function m.GamePosToUEPos(gameX, gameY)
    return (gameX - 26009) * 100, (gameY + 26009) * 100
end


---获取元素在table的下标,没有找到返回-1
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

---需求道具转换字符串
---@param tabNeedItem any
---@param tabNeedCount any
function m.NeedItemToStr(tabNeedItem, tabNeedCount)
    local str = ""
    for index, value in ipairs(tabNeedItem) do
        if index ~= #tabNeedItem then
            str = string.format("%s%s*%s、", str, value, tabNeedCount[index])
        else
            str = string.format("%s%s*%s", str, value, tabNeedCount[index])
        end
    end
    return str
end

---判断是否拥有道具
---@param player Player
---@param tabNeedItem any
---@param tabNeedCount any
function m.CheckHasNeedItem(player, tabNeedItem, tabNeedCount)
    for index, value in ipairs(tabNeedItem) do
        local itemName = value
        local itemCount = tabNeedCount[index]

        if itemName == "金币" then
            if player:Gold() < itemCount then
                return false
            end
            goto continue
        end

        if player:GetItemNumByName(itemName) < itemCount then
            return false
        end
        ::continue::
    end
    return true
end

---批量扣除道具
---@param player Player
---@param tabNeedItem any
---@param tabNeedCount any
function m.TakeItems(player, tabNeedItem, tabNeedCount)
    for index, value in ipairs(tabNeedItem) do
        local itemName = value
        local itemCount = tabNeedCount[index]

        if itemName == "金币" then
            player:SubGold(itemCount)
            goto continue
        end
        
        player:TakeItemByName(itemName, itemCount)
        ::continue::
    end
end





---判断频道是否包含相同
---@param player Player
---@param otherPlayer Player
---@return boolean ture相同，false不相同
function m.CheckChannel(player, otherPlayer)
    local myLeft = player:ChatChannelLeft()
    local myRight = player:ChatChannelRight()
    local otherLeft = otherPlayer:ChatChannelLeft()
    local otherRight = otherPlayer:ChatChannelRight()

    if myLeft == otherLeft then
        return true
    end
    if myLeft == otherRight then
        return true
    end
    if myRight == otherLeft then
        return true
    end
    if myRight == otherRight then
        return true
    end
    return false
end

---判断频道是否相同阵营
---@param player Player
---@param otherPlayer Player
---@return boolean ture相同，false不相同
function m.IsSameSide(player, otherPlayer)
    if not otherPlayer then
        return false
    end
    local otherPlayerPtr = otherPlayer:GetPlayerPtr()
    ---判断频道是否相同
    if player:CheckChannel(otherPlayerPtr) then
        return true
    end
    ---判断队伍是否相同
    if player:IsSameTeam(otherPlayerPtr) then
        return true
    end

    return false
end


Utility = m
return m