---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Ahren.
--- DateTime: 2022/7/29 13:43
---

--json = require "cjson"

local baseDB = BaseDB

function Login(player)
	if type(jit) == "table" then
		log("LuaJIT with JIT enabled")
	else
		log("Regular Lua without JIT")
	end
	return false
end

return 1