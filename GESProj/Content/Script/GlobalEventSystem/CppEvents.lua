---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by lixiaohua.
--- DateTime: 2023/12/18 15:10
---

--- GES Container Type
local CT = UE4.EGESContainerType
--- GES Event Data Cpp Type
local EDC = UE4.EGESCppType

---
---CppEvents Definition
---
--local EventTable = {
--    Name="",    -- Event name
--    Data= {     -- Event data array
--        [1] = {
--            ContainerType = CT.None,      -- Container type, see cpp type 'UE4.EGESContainerType'
--            CppType = EDC.None,           -- Cpp type, see cpp type 'UE4.EGESCppType'
--            CppSubTypeName = "",          -- Cpp sub type name, UObject:UClass name, UStruct: Struct name without prefix 'F', UEnum: Enum name must with prefix 'E'
--            ValueType = EDC.None,         -- Only when ContainerType is TMap<Key, Value>, CppType & CppSubTypeName is used for 'Key', ValueType & ValueSubTypeName is used for 'Value'
--            ValueSubTypeName = "",        -- TMap Value sub type
--        },
--        -- Add more if necessary
--        [2] = {
--            ...
--        },
--        [3] = {
--            ...
--        }
--        ...
--    }
--}

--- Cpp events define
CppEvents = {
    BoolTestEvent = {
        Name = "BoolTestEvent",
        Data = { [1] = { CppType=EDC.Bool, }, },
    },
    IntegerTestEvent = {
        Name = "IntegerTestEvent",
        Data = { [1] = { CppType=EDC.Integer, }, },
    },
    FloatTestEvent = {
        Name = "FloatTestEvent",
        Data = { [1] = { CppType=EDC.Float, }, },
    },
    StringTestEvent = {
        Name = "StringTestEvent",
        Data = { [1] = { CppType=EDC.FString, }, },
    },
    NameTestEvent = {
        Name = "NameTestEvent",
        Data = { [1] = { CppType=EDC.FName, }, },
    },
    TextTestEvent = {
        Name = "TextTestEvent",
        Data = { [1] = { CppType=EDC.FText, }, },
    },
    EnumTestEvent = {
        Name = "EnumTestEvent",
        Data = { [1] = { CppType=EDC.UEnum,     CppSubTypeName="EGESCppType" }, },
    },
    StructTestEvent = {
        Name = "StructTestEvent",
        Data = { [1] = { CppType=EDC.UStruct,   CppSubTypeName="Vector" }, },
    },
    ObjectTestEvent = {
        Name = "ObjectTestEvent",
        Data = { [1] = { CppType=EDC.UObject,   CppSubTypeName="GESTest" }, },
    },
    ClassTestEvent = {
        Name = "ClassTestEvent",
        Data = { [1] = { CppType=EDC.UClass,    CppSubTypeName="BP_GESTest_C" }, },
    },
    ArrayTestEvent = {
        Name = "ArrayTestEvent",
        Data = {
            [1] = { ContainerType= CT.TArray,   CppType=EDC.Integer, },
        },
    },
    SetTestEvent = {
        Name = "SetTestEvent",
        Data = {
            [1] = { ContainerType= CT.TSet,     CppType=EDC.Integer, },
        },
    },
    MapTestEvent = {
        Name = "MapTestEvent",
        Data = {
            [1] = { ContainerType= CT.TMap,     CppType=EDC.Integer,    CppSubTypeName="",  ValueType=EDC.UStruct,   ValueSubTypeName="Vector" },
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
