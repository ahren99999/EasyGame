
---@class LuaConfig
local m = {}

---@type kx_item_data[]
m.itemConfig= nil
function m.GetItemConfig()
    package.loaded["table\\kx_item"] = nil 
    m.itemConfig = require("table\\kx_item")
    return m.itemConfig
end

m.monsterConfig = nil
function m.GetMonsterConfig()
    package.loaded["table\\kx_monster"] = nil 
    m.monsterConfig = require("table\\kx_monster")
    return m.monsterConfig
end

m.skillConfig = nil
function m.GetSkillConfig()
    package.loaded["table\\kx_skill"] = nil 
    m.skillConfig = require("table\\kx_skill")
    return m.skillConfig
end

m.itemAttrConfig =nil
function m.GetItemAttrConfig()
    package.loaded["table\\kx_item_attr"] = nil 
    m.itemAttrConfig = require("table\\kx_item_attr")
    return m.itemAttrConfig
end

m.mapConfig = nil
function m.GetMapConfig()
    package.loaded["table\\kx_map"] = nil 
    m.mapConfig = require("table\\kx_map")
    return m.mapConfig
end

m.msgConfig = nil
function m.GetMsgConfig()
    package.loaded["table\\kx_msg"] = nil 
    m.msgConfig = require("table\\kx_msg")
    return m.msgConfig
end

m.gemComfig = nil
function m.GetGemConfig()
    package.loaded["table\\kx_gem"] = nil 
    m.gemComfig = require("table\\kx_gem")
    return m.gemComfig
end

m.itemAttrCustom = nil
function m.GetItemAttrCustom()
    package.loaded["table\\kx_item_attr_custom"] = nil 
    m.itemAttrCustom = require("table\\kx_item_attr_custom")
    return m.itemAttrCustom
end

m.attrRoleConfig = nil
function m.GetAttrRoleConfig()
    package.loaded["table\\kx_attr_role"] = nil 
    m.attrRoleConfig = require("table\\kx_attr_role")
    return m.attrRoleConfig
end

m.newPlayerConfig = nil
function m.NewPlayerConfig()
    package.loaded["table\\kx_new_player"] = nil 
    m.newPlayerConfig = require("table\\kx_new_player")
    return m.newPlayerConfig
end

m.npcConfig = nil
function m.GetNpcConfig()
    package.loaded["table\\kx_npc"] = nil 
    m.npcConfig = require("table\\kx_npc")
    return m.npcConfig
end

m.shopConfig = nil
function m.GetShopConfig()
    package.loaded["table\\kx_shops"] = nil 
    m.shopConfig = require("table\\kx_shops")
    return m.shopConfig
end

m.monsterGenConfig = nil
function m.GetMonsterGenConfig()
    package.loaded["table\\kx_monster_mongen"] = nil 
    m.monsterGenConfig = require("table\\kx_monster_mongen")
    return m.monsterGenConfig
end

m.expConfig = nil
function m.GetExpConfig()
    package.loaded["table\\kx_exp"] = nil 
    m.expConfig = require("table\\kx_exp")
    return m.expConfig
end

m.buffConfig = nil
function m.GetBuffConfig()
    package.loaded["table\\kx_buff"] = nil 
    m.buffConfig = require("table\\kx_buff")
    return m.buffConfig
end

m.sceneConfig = nil
function m.GetSceneConfig()
    package.loaded["table\\kx_scene"] = nil 
    m.sceneConfig = require("table\\kx_scene")
    return m.sceneConfig
end

m.petConfig = nil
function m.GetPetConfig()
    package.loaded["table\\kx_pet"] = nil 
    m.petConfig = require("table\\kx_pet")
    return m.petConfig
end

m.petExpConfig = nil
function m.GetPetExpConfig()
    package.loaded["table\\kx_pet_exp"] = nil 
    m.petExpConfig = require("table\\kx_pet_exp")
    return m.petExpConfig
end

m.pointTriggerConfig = nil
function m.GetPointTriggerConfig()
    package.loaded["table\\kx_point_trigger"] = nil 
    m.pointTriggerConfig = require("table\\kx_point_trigger")
    return m.pointTriggerConfig
end

m.itemAttrUpgrade = nil
function m.GetItemAttrUpgrade()
    package.loaded["table\\kx_item_attr_upgrade"] = nil 
    m.itemAttrUpgrade = require("table\\kx_item_attr_upgrade")
    return m.itemAttrUpgrade
end

m.globalTimer = nil
function m.GetGlobalTimer()
    package.loaded["table\\kx_global_timer"] = nil 
    m.globalTimer = require("table\\kx_global_timer")
    return m.globalTimer
end

m.gameLog = nil
function m.GetGameLog()
    package.loaded["table\\kx_game_log"] = nil
    m.gameLog = require("table\\kx_game_log")
    return m.gameLog
end

LuaConfig = m
return m