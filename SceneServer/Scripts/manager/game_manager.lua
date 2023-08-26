

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

    -- package.cpath = package.cpath .. ";c:/Users/Administrator/.vscode/extensions/tangzx.emmylua-0.5.17/debugger/emmy/windows/x64/?.dll"
    -- local dbg = require("emmy_core")
    -- dbg.tcpListen("localhost", 9966)
end

GameManager = m
return m
