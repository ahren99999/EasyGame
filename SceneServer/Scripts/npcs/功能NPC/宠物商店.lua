

local m = {}

function m.OnClickMain(npc, player)
    local content = [[你好呀！%s 
    欢迎来到%s。我非常高兴能为您提供各种宠物用品。有什么可以帮到您的吗？
    ]]

    local select = {
        "我想要购买宠物用品|OnClickOpenShop",
        "使用宠物加点|OnClickUsePoint",
        "取消|Exit"
    }
    content = string.format(content, player:Name(), npc:District())
    npc:Say(player, content, select)
end


function m.OnClickOpenShop(npc, player)
    npc:OpenShop(player)
end


function m.OnClickUsePoint(npc, player)
    local content = [[请选择您宠物的属性点！
    ]]

    local select = {
        "宠物攻击|OnClickPetAttk",
        "宠物血量|OnClickPetHP",
        "宠物蓝量|OnClickPetMP",
        "宠物背包|OnClickPerBag",
        "取消|Exit"
    }
    npc:Say(player, content, select)
end

local function AddPetPoint(npc, player, point)
    if not player:IsEnablePet() then
        player:SendMsg(3, "提示：请先出战宠物后在使用此功能！")
        return
    end

    local total = player:GetPetPoint(emPetPoint.TotalPoint)

    if total <= 0 then
        player:SendMsg(3, "提示：宠物可用属性点不足！")
        return
    end

    local pointNum = player:GetPetPoint(point)

    if pointNum >= 200 then
        player:SendMsg(3, "提示：当前宠物点数已达上限！")
        return
    end

    player:SetPetPoint(emPetPoint.TotalPoint, total - 1)
    player:SetPetPoint(point, pointNum + 1)
    player:SendMsg(3, "提示：宠物属性已修改！")
end

function m.OnClickPetAttk(npc, player)
    AddPetPoint(npc, player, emPetPoint.AttkPoint)
end

function m.OnClickPetHP(npc, player)
    AddPetPoint(npc, player, emPetPoint.HPPoint)
end

function m.OnClickPetMP(npc, player)
    AddPetPoint(npc, player, emPetPoint.MPPoint)
end

function m.OnClickPerBag(npc, player)
    AddPetPoint(npc, player, emPetPoint.BagPoint)
end

PetShopNpc = m
return m