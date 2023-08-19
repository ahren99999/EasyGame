

local m = {}

---comment
function m.ScriptLoaded(game)

    ItemUpgrade.Init()
    PlayerManager.Init()
    GlobalTimerManager.Init()
    PointTriggerMnager.Init();

end

GameManager = m
return m
