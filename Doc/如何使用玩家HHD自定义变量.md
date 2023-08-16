# 如何使用玩家HHD自定义变量

## 如何使用玩家HHD自定义变量
- 玩家的 HHD（硬盘）自定义变量是指在修改或读取时都涉及到硬盘操作。
- 这种操作通常用于充值、离线玩家变量修改、离线玩家封号等情况。
- 由于这种操作可能会比较耗时，下面是一个异步实现的示例代码：

```lua

---判断玩家是否封号
function IsBan(player)
    Game:GetCustomVar(player:Name(), "个人变量_是否封号", function(val)
        if val == nil then
            return
        end
        if val == false then
            return
        end
        player:SendMsg(3, "提示：您的角色已被Ban,请联系管理员")
        player:Kick()
    end)
end

---将玩家账号封禁
function Ban(playerName)
    Game:SetBoolVar(playerName, "个人变量_是否封号", true)
end