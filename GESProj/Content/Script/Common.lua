---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lixiaohua.
--- DateTime: 2023/12/27 11:39
---

local PrintUEString = UE.UKismetSystemLibrary.PrintString

function printf(formatString, ...)
    print(string.format("[Lua_GESTest] " .. formatString, ...))
end

function print_screen(text, color, duration)
    color = color or UE.FLinearColor(1, 1, 1, 1)
    duration = duration or 10
    PrintUEString(nil, text, true, false, color, duration)
end

function dump_map(map)
    local keys = map:Keys()
    for i = 1, keys:Length() do
        local key = keys:Get(i)
        local value = map:Find(key)
        printf("MapValue[%s]=%s", tostring(key), tostring(value))
    end
end