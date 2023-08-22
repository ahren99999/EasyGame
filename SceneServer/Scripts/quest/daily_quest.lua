

local m = {}

---怪物对象
---@type DailyQuest[]
local mapTarget = {}

---@class DailyQuest[]
local config = {
    [1] = {
        idx = 1,
        npc = "尤博",
        title = "小试牛刀",
        context = "请前往莱蒂尼斯城外击杀10只蜂王",
        hint = "已击杀 %s只，剩余 %s只",
        target = "蜂王",
        killCount = 10,
        rewards = {
            [1] = { name = "金币", count =  100000},
            [2] = { name = "经验", count =  100000},
            [3] = { name = "小型凯旋宝石", count =  1},
            [4] = { name = "小型生命血瓶", count =  20},
            [5] = { name = "小型魔法药瓶", count =  20},
        }
    },
    [2] = {
        idx = 2,
        npc = "杰克",
        title = "展露头角",
        context = "请前往莱蒂尼斯城外击杀10只魔犬",
        hint = "已击杀 %s只，剩余 %s只",
        target = "魔犬",
        killCount = 10,
        rewards = {
            ---@class TabRewards
            [1] = { name = "金币", count =  100000},
            [2] = { name = "经验", count =  100000},
            [3] = { name = "小型凯旋宝石", count =  1},
            [4] = { name = "小型生命血瓶", count =  20},
            [5] = { name = "小型魔法药瓶", count =  20},
        }
    }
}

---任务状态枚举
local emStatus = {
    ---未接取任务
    UnacceptedQuest = 0,
    ---已接取任务
    AcceptedQuest = 1,
    ---已完成任务
    CompletedQuest = 2,
}

---构建怪物触发索引
local function InitTargetMap()
    for index, value in ipairs(config) do
        mapTarget[value.target] = value
    end
end


---重新加载脚本事件target
function m.Init()
    ---构建怪物触发索引
    InitTargetMap()
    --注册怪物死亡事件
    MonsterManager.MonsterDiedEvent:addAction(m.OnMonsterDiedEvent)
    --注册打开任务界面事件
    PlayerManager.OpenQuestPanelEvent:addAction(m.OnOpenQuestPanelEvent)
    --注册每日自定义变量清理事件
    GlobalTimerManager.NewDayResetCustomCacheEvent:addAction(m.OnNewDayResetCustomCacheEvent);
end
GameManager.ScriptLoadedEvent:addAction(m.Init)





---通过npc名字获取任务配置
---@param npc Npc
---@return number, DailyQuest
local function getConfigByNpc(npc)
    local npcName = npc:Name()
    local idx = 0
    for index, value in ipairs(config) do
        if npcName == value.npc then
            idx = index
        end
    end
    return idx, config[idx]
end

---获取任务状态
---@param player Player 玩家对象
---@param questIdx number 循环任务号
---@return number
local function GetQuestStatus(player, questIdx)
    return player:GetNumber(string.format("每日任务_任务状态_%s", questIdx), emStatus.UnacceptedQuest)
end

---设置任务状态
---@param player Player 玩家对象
---@param questIdx number 循环任务号
---@param status number
local function SetQuestStatus(player, questIdx, status)
    player:SetNumber(string.format("每日任务_任务状态_%s", questIdx), status, true)
end

---获取杀怪数量
---@param player Player 玩家对象
---@param questIdx number 循环任务号
---@return number
local function GetQuestKillCount(player, questIdx)
    return player:GetNumber(string.format("每日任务_杀怪数量_%s", questIdx), 0)
end

---设置杀怪数量
---@param player Player 玩家对象
---@param questIdx number 循环任务号
local function SetQuestKillCount(player, questIdx, val)
    player:SetNumber(string.format("每日任务_杀怪数量_%s", questIdx), val, true)
end

---获取对话可选择的内容
---@param player Player 玩家对象
---@param questIdx number 循环任务号
local function GetSelectText(player, questIdx)

    local status = GetQuestStatus(player, questIdx)

    local text = ""
    if status == emStatus.UnacceptedQuest then
        text = string.format("接取任务|DailyQuest.OnClickAcceptQuest(%s)", questIdx)
    elseif status == emStatus.AcceptedQuest then
        text = string.format("完成任务|DailyQuest.OnClickCompleteQuest(%s)", questIdx)
    elseif status == emStatus.CompletedQuest then

    end
    return text
end


---获取任务的对话项
---@param npc Npc
---@param player Player
---@return string
function m.GetSelect(npc, player)
    local idx, questInfo = getConfigByNpc(npc)
    if questInfo == nil then
       return ""
    end
    ---如果任务已完成不需要显示选择项
    if GetQuestStatus(player, idx) == emStatus.CompletedQuest then
        return ""
    end
    return string.format("我想要完成每日任务|DailyQuest.OnClickDailyQuestMain(%s)", idx)
end

---点击了查看每日任务界面
---@param npc Npc npc对象
---@param player Player 玩家对象
---@param args string[] 参数列表
function m.OnClickDailyQuestMain(npc, player, args)
    if args == nil then
        return
    end
    local questIdx = tonumber(args[1])
    local questInfo = config[tonumber(questIdx)]
    local selectText = GetSelectText(player, questIdx)
    local content =
    [[
        |任务名称：%s|

        |任务描述：%s|

        |任务奖励：%s|
    ]]

    local select = {
        selectText,
        "离开|Exit"
    }

    content = string.format(content, questInfo.title, questInfo.context, Utility.RewardsToStr(questInfo.rewards))
    npc:Say(player, content, select)
end

---玩家点击接收任务
---@param npc Npc npc对象
---@param player Player 玩家对象
---@param args string[] 参数列表
function m.OnClickAcceptQuest(npc, player, args)
    local questIdx = tonumber(args[1])
    local questInfo = config[questIdx]
    if GetQuestStatus(player, questIdx) ~= emStatus.UnacceptedQuest then
        player:SendMsg(3, "提示：您已接取了任务，请勿重复接取！")
        return
    end

    SetQuestKillCount(player, questIdx, 0)
    SetQuestStatus(player, questIdx, emStatus.AcceptedQuest)
    player:SendMsg(3, string.format("提示：您接取了任务[%s],赶快去完成吧！", questInfo.title))
    --npc:Close()
end

---玩家点击完成
---@param npc Npc npc对象
---@param player Player 玩家对象
---@param args string[] 参数列表
function m.OnClickCompleteQuest(npc, player, args)
    local questIdx = tonumber(args[1])
    local questInfo = config[questIdx]
    if GetQuestStatus(player, questIdx) ~= emStatus.AcceptedQuest then
        player:SendMsg(3, "提示：您未接取任务！")
        return
    end

    if GetQuestKillCount(player, questIdx) < questInfo.killCount then
        player:SendMsg(3, "提示：您未完成任务目标！")
        return
    end
    ---判断背包空位是否足够
    if not player:CheckBagSize(1, 3) then
        player:SendMsg(3, "提示：您的背包空位不足，请清理后再来！")
        return
    end
    ---设置任务完成状态
    SetQuestStatus(player, questIdx, emStatus.CompletedQuest)
    ---给予玩家任务奖励
    Utility.GiveRewards(player, questInfo.rewards, questInfo.title)

    player:SendMsg(3, string.format("提示：恭喜您完成任务，获得：%s", Utility.RewardsToStr(questInfo.rewards)))
end


---怪物死亡事件
---@param killer Player 击杀玩家对象(可能为nil)
---@param monster Monster 怪物对象
function m.OnMonsterDiedEvent(killer , monster)

    if monster == nil then
        return
    end

    if killer == nil then
        return
    end

    local questConfig = mapTarget[monster:Name()]
    if questConfig == nil then
       return
    end

    ---没有接受任务不处理
    if GetQuestStatus(killer, questConfig.idx) ~= emStatus.AcceptedQuest then
        return
    end

    local currentKillCount = GetQuestKillCount(killer, questConfig.idx)

    ---任务杀怪数量大于任务要求数量
    if  currentKillCount >=  questConfig.killCount then
        killer:SendMsg(3, string.format("提示：您已经完成了[%s]，快去找[%s]领取奖励吧！", questConfig.title, questConfig.npc))
        return
    end
    currentKillCount = currentKillCount + 1
    SetQuestKillCount(killer, questConfig.idx, currentKillCount)
    killer:SendMsg(3, string.format("提示：任务[%s]杀怪数量+1，当前杀怪[%s]只，剩余[%s]只！",
        questConfig.title, 
        currentKillCount, 
        questConfig.killCount - currentKillCount))
end


---玩家打开任务界面
---@param player Player 玩家对象
---@param vIncompleteTasks Quest[] 未完成的任务
---@param vCompletedTasks string 已完成的任务
function m.OnOpenQuestPanelEvent(player, vIncompleteTasks, vCompletedTasks)
    for index, value in ipairs(config) do

        local status = GetQuestStatus(player, value.idx)
        if status == emStatus.CompletedQuest then
            vCompletedTasks:add(string.format("%s[已完成]", value.title))
            goto continue
        end

        local text = "" 
        if status == emStatus.UnacceptedQuest then
            text = "未接受"
        end
        if status == emStatus.AcceptedQuest then
            text = "进行中"
        end
        
        ---未完成的任务
        local count = GetQuestKillCount(player, value.idx)
        ---@type Quest
        local quest = {}
        quest.title = string.format("%s[%s]", value.title, text)
        quest.context = string.format("%s:%s",value.npc, value.context)
        quest.hint = string.format(value.hint, count, value.killCount - count)
        vIncompleteTasks:add(quest);
        ::continue::
    end
end

---每日自定义变量清理事件
---@param tabResetCustom ResetCustomCache[]
function m.OnNewDayResetCustomCacheEvent(tabResetCustom)
    ---将每日任务变量重置
    for index, value in ipairs(config) do
        ---@type ResetCustomCache
        local tabCustomCacheA = {}
        tabCustomCacheA.key = string.format("每日任务_任务状态_%s", index);
        tabCustomCacheA.type = "int"
        tabCustomCacheA.val = emStatus.UnacceptedQuest
        table.insert(tabResetCustom, tabCustomCacheA)
        
        ---@type ResetCustomCache
        local tabCustomCacheB = {}
        tabCustomCacheB.key = string.format("每日任务_杀怪数量_%s", index);
        tabCustomCacheB.type = "int"
        tabCustomCacheB.val = 0
        table.insert(tabResetCustom, tabCustomCacheB)
    end
end


DailyQuest = m
return m