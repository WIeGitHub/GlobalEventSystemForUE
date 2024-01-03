---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lixiaohua.
--- DateTime: 2023/12/18 15:10
---

--- GES Container Type
local CT = UE4.EGESContainerType
--- GES Event Data Cpp Type
local EDC = UE4.EGESCppType

--- Cpp events define
CppEvents = {
    MyTestEvent = {
        Name = "MyTestEvent",
        Data = {
            [1] = { ContainerType= CT.TArray,    CppType=EDC.Integer,    CppSubTypeName="",                      ValueType=EDC.None,     ValueSubTypeName="" },
            [2] = { ContainerType= CT.None,     CppType=EDC.UEnum,      CppSubTypeName="EGESEventDataCppType",  ValueType=EDC.None,     ValueSubTypeName="" },
            [3] = { ContainerType= CT.None,     CppType=EDC.UStruct,    CppSubTypeName="GESTestStruct",         ValueType=EDC.None,     ValueSubTypeName="" },
        },
    },
    MapTestEvent = {
        Name = "MapTestEvent",
        Data = {
            [1] = { ContainerType= CT.TMap,      CppType=EDC.Integer,    CppSubTypeName="",                      ValueType=EDC.UStruct,   ValueSubTypeName="Vector" },
        },
    },
}

--- Build cpp event config for GlobalEventSystem
function Global_GetCppEvents()
    local EventConfig = UE4.FGESEventConfig()

    for K,V in pairs(CppEvents) do
        local EventItem = UE4.FGESEventConfigItem()
        EventItem.EventType = V.Name
        for i=1,#V.Data do
            local EventDataType = UE4.FGESEventDataType()
            EventDataType.ContainerType = V.Data[i].ContainerType or CT.None
            EventDataType.CppType = V.Data[i].CppType or EDC.None
            EventDataType.CppSubTypeName = V.Data[i].CppSubTypeName or ""
            EventDataType.ValueType = V.Data[i].ValueType or EDC.None
            EventDataType.ValueSubTypeName = V.Data[i].ValueSubTypeName or ""
            EventItem.EventDataTypes:Add(EventDataType)
        end
        EventConfig.Events:Add(EventItem)
    end

    return EventConfig
end
