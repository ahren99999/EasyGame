

local m = {}
m.ScriptLoadedEvent = Event.newEvent()
---comment
function m.ScriptLoaded(game)

    m.ScriptLoadedEvent:trigger(game)

    log("Lua ScriptLoaded...")
    --ItemUpgrade.Init()
    --PlayerManager.Init()
    --GlobalTimerManager.Init()
    --PointTriggerMnager.Init();
end

GameManager = m
return m
