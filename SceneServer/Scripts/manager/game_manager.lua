

local m = {}
m.ScriptLoadedEvent = Event.newEvent()

---lua 脚本加载完成回调
---@param game any
function m.ScriptLoaded(game)

    m.ScriptLoadedEvent:trigger(game)

    log("Lua ScriptLoaded...")
    --ItemUpgrade.Init()
    --PlayerManager.Init()
    --GlobalTimerManager.Init()
    --PointTriggerMnager.Init();

end

---游戏启动完成事件
---@param game Game
function m.GameStartedEvent(game)


end



GameManager = m
return m
