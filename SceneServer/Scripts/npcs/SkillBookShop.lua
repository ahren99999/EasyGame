local m = {}


local skillBookConfig = require('table\\kx_skill_bool')

---获取职业技能列表
---@param jobName string 职业名字
---@return string[]
local function getSkiilSub(jobName)
    local result = {}
    for index, value in ipairs(skillBookConfig) do
        if string.find(value.job_name, jobName)
            and Utility.VecIndexOf(result, value.skill_name) == -1 then
            table.insert(result, value.skill_name)
        end
    end
    
    return result
end

---获取技能书列表
---@param skillName any
---@return kx_skill_bool_data[]
local function getSkillBook(skillName)
    ---@type kx_skill_bool_data[]
    local result = {}
    for index, value in ipairs(skillBookConfig) do
        if value.skill_name == skillName
            and Utility.VecIndexOf(result, value.book_name) == -1 then
            table.insert(result, value)
        end
    end

    table.sort(result, function (a, b)
        return a.idx < b.idx
    end)
    return result
end



function m.OnClickMain(npc, player)
    local content = [[你好呀！%s|欢迎来到%s。
    作为这里的店主，我为您提供各种各样的高级技能书！
    ]]

    local select = {
        "我想要兑换单手剑士技能书|OnClickSelectJob(单手剑士)",
        "我想要兑换斗士技能书|OnClickSelectJob(斗士)",
        "我想要兑换红魔法师技能书|OnClickSelectJob(红魔法师)",
        "我想要兑换弓箭手技能书|OnClickSelectJob(弓箭手)",
        "我想要兑换蓝魔法师技能书|OnClickSelectJob(蓝魔法师)",
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end

function m.OnClickSelectJob(npc, player, args)
    local select = {}
    local jobName = args[1]
    local skillSub = getSkiilSub(jobName)
    for index, value in ipairs(skillSub) do
        table.insert(select, string.format("%s|OnClickSelectSkillSub(%s)", value, value))
    end

    local content = [[请选择您想要兑换的技能！]]
    npc:Say(player, content, select)
end

function m.OnClickSelectSkillSub(npc, player, args)
    local select = {}
    local skillName = args[1]
    local skillBook = getSkillBook(skillName)
    for index, value in ipairs(skillBook) do
        table.insert(select, string.format("%s|OnClickSelectSkillBook(%s)", value.book_name, value.idx))
    end

    local content = [[请选择您想要兑换的技能书！]]
    npc:Say(player, content, select)
end

function m.OnClickSelectSkillBook(npc, player, args)
    local config = skillBookConfig[tonumber(args[1])]
    local content = [[兑换 %s |需要:%s  
    ]]

    local select = {
        string.format("我确认要兑换%s|OnClickConfirmSkillBook(%s)", config.book_name, config.idx),
        "离开|Exit",
    }
    content = string.format(content, config.book_name, Utility.NeedItemToStr(config.need_item, config.need_count))
    npc:Say(player, content, select)
end

---确认兑换技能书
---@param npc Npc
---@param player Player
---@param args any
function m.OnClickConfirmSkillBook(npc, player, args)
    local config = skillBookConfig[tonumber(args[1])]
    if not player:CheckBagSize(2, 2) then
        player:SendMsg(3, "提示：操作失败，背包空位不足！")
        return
    end

    if not Utility.CheckHasNeedItem(player, config.need_item, config.need_count) then
        player:SendMsg(3, "提示：操作失败，您的材料不足！")
        return
    end

    ---批量扣除道具
    Utility.TakeItems(player, config.need_item, config.need_count)

    player:GiveItem(config.book_name, 1, "技能书兑换")
    player:SendMsg(3, string.format("提示：兑换成功，获得: %s", config.book_name))
end








function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


SkillBookShopNpc = m
return m