local json = require("json")
DoorOverhaul = RegisterMod("Door Overhaul", 1)

--Set defaults idiot style
local settings = {
    variants = true,
    flipping = true,
    normalDoors = true,
    specialDoors = true,

    normalTable = { 
        ["0"] = "On",
        ["1"] = "On",
        ["2"] = "On",
        ["3"] = "On",
        ["4"] = "On",
        ["5"] = "On",
        ["6"] = "On",
        ["7"] = "On",
        ["8"] = "On",
        ["9"] = "On",
        ["10"] = "On",
        ["11"] = "On",
        ["12"] = "On",
        ["13"] = "On",
        ["14"] = "On",
        ["15"] = "On",
        ["16"] = "On",
        ["17"] = "On",
        ["31"] = "On",
        ["32"] = "On",
        ["33"] = "On",
        ["34"] = "On",
        ["40"] = "On",
        ["41"] = "On",
        ["42"] = "On",
        ["43"] = "On",
        ["44"] = "On",
        ["45"] = "On",
        ["46"] = "On",
        ["47"] = "On",
        ["49"] = "On",
        ["50"] = "On",
        ["51"] = "On",
        ["52"] = "On",
        ["53"] = "On",
        ["58"] = "On",
        ["59"] = "On",
        ["60"] = "On",
    },

    specialTable = {
        ["2"] = true,
        ["4"] = true,
        ["-4"] = true,
        ["-5"] = true,
        ["5"] = true,
        ["9"] = true,
        ["10"] = true,
        ["11"] = true,
        ["-11"] = true,
        ["12"] = true,
        ["13"] = true,
        ["14"] = true,
        ["15"] = true,
        ["18"] = true,
        ["19"] = true,
        ["20"] = true,
        ["21"] = true,
        ["24"] = true,
        ["28"] = true,
        ["49"] = true,
        ["50"] = true,
        ["51"] = true,
        ["52"] = true,
        ["53"] = true,
        ["54"] = true,
        ["55"] = true,
        ["-55"] = true,
    },
}

local function save()
    local data = json.encode(settings)
    DoorOverhaul:SaveData(data)
end

local function load()
    if not DoorOverhaul:HasData() then return end

    local data = DoorOverhaul:LoadData()
    settings = json.decode(data)

    --Set missing values
    if settings.variants == nil then settings.variants = true end
    if settings.flipping == nil then settings.flipping = true end
    if settings.normalDoors == nil then settings.normalDoors = true end
    if settings.specialDoors == nil then settings.specialDoors = true end

    for key, value in pairs(normalTable) do
        if settings.normalTable[key] == nil then
            settings.normalTable[key] = "On"
        end
    end

    for key, value in pairs(specialTable) do
        if settings.specialTable[key] == nil then
            settings.specialTable[key] = "On"
        end
    end
end

local function setupConfig()
    ModConfigMenu.RemoveCategory("Door Overhaul")
    ModConfigMenu.UpdateCategory("Door Overhaul", {
        Name = "Door Overhaul",
        Info = "Settings for your new doors"
    })

    ------------------------------General------------------------------

    ModConfigMenu.AddSetting("Door Overhaul", "General", { --Variants

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.variants end,
        
        Display = function() return "Variants: " .. (settings.variants and "On" or "Off") end,

        OnChange = function(new)
            settings.variants = new
            save()
        end,

        Info = { "Choose between multiple variations for some doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "General", { --Flipping

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.flipping end,
        
        Display = function() return (settings.variants and "" or "X  ") .. "Flip Doors: " .. (settings.flipping and settings.variants and "On" or "Off") .. (settings.variants and "" or "  X") end,

        OnChange = function(new)
            if settings.variants == false then return end
            
            settings.flipping = new
            save()
        end,

        Info = { "Toggles if doors are randomly flipped for more variety" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "General", { --Normal Doors

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.normalDoors end,
        
        Display = function() return "Normal Doors: " .. (settings.normalDoors and "On" or "Off") end,

        OnChange = function(new)
            settings.normalDoors = new
            save()
        end,

        Info = { "Toggles the new normal doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "General", { --Special Doors
        
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialDoors end,
        
        Display = function() return "Special Doors: " .. (settings.specialDoors and "On" or "Off") end,

        OnChange = function(new)
            settings.specialDoors = new
            save()
        end,

        Info = { "Toggles custom doors for special rooms" }
    })

    ModConfigMenu.AddSpace("Door Overhaul", "General")
    ModConfigMenu.AddSpace("Door Overhaul", "General")
    ModConfigMenu.AddText("Door Overhaul", "General", "By: AaronRuinsLives")


    ------------------------------Normal Doors------------------------------

    local choices = {
        [1] = "On",
        [2] = "No Variants",
        [3] = "Off",
    }

    local function getIndex(setting)
        for i, v in ipairs(choices) do
            if v == setting then return i end
        end
        return 1
    end
    
    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Default

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["0"]) end,
        
        Display = function() return (settings.normalDoors and "" or "X  ") .. "Default: " .. settings.normalTable["0"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["0"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Basement

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["1"]) end,
    
        Display = function() return (settings.normalDoors and "" or "X  ") .. "Basement: " .. settings.normalTable["1"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["1"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Cellar

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["2"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Cellar: " .. settings.normalTable["2"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["2"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Burning

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["3"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Burning Basement: " .. settings.normalTable["3"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["3"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Caves

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["4"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Caves: " .. settings.normalTable["4"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["4"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Catacombs

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["5"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Catacombs: " .. settings.normalTable["5"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["5"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Flooded

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["6"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Flooded Caves: " .. settings.normalTable["6"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["6"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Mines

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["32"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Mines: " .. settings.normalTable["32"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["32"] = choices[new]
            settings.normalTable["58"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Ashpit

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["46"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Ashpit: " .. settings.normalTable["46"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["46"] = choices[new]
            settings.normalTable["59"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Depths

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["7"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Depths: " .. settings.normalTable["7"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["7"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Necropolis

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["8"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Necropolis: " .. settings.normalTable["8"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["8"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Dank Depths

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["9"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Dank Depths: " .. settings.normalTable["9"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["9"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Womb

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["10"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Womb: " .. settings.normalTable["10"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["10"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Utero

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["11"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Utero: " .. settings.normalTable["11"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["11"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Scarred Womb

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["12"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Scarred Womb: " .. settings.normalTable["12"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["12"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Corpse

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["34"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Corpse: " .. settings.normalTable["34"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["34"] = choices[new]
            settings.normalTable["43"] = choices[new]
            settings.normalTable["44"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Normal", { --Cathedral

        Type = ModConfigMenu.OptionType.NUMBER,

        CurrentSetting = function() return getIndex(settings.normalTable["15"]) end,

        Display = function() return (settings.normalDoors and "" or "X  ") .. "Cathedral: " .. settings.normalTable["15"] .. (settings.normalDoors and "" or "  X")  end,

        OnChange = function(new)
            if settings.normalDoors == false then return end

            settings.normalTable["15"] = choices[new]
            save()
        end,

        Minimum = 1,

        Maximum = 3,

        Info = { "Toggle visibility for individual doors" }
    })

    ------------------------------Special Doors------------------------------

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Shop

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["2"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Shop: " .. (settings.specialTable["2"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["2"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Treasure

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["4"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Treasure: " .. (settings.specialTable["4"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["4"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Greed Treasure

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["-4"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Greed Treasure: " .. (settings.specialTable["-4"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["-4"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Devil Treasure

    Type = ModConfigMenu.OptionType.BOOLEAN,

    Default = true,

    CurrentSetting = function() return settings.specialTable["-5"] end,
    
    Display = function() return (settings.specialDoors and "" or "X  ") .. "Devil Treasure: " .. (settings.specialTable["-5"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

    OnChange = function(new)
        if settings.specialDoors == false then return end

        settings.specialTable["-5"] = new
        save()
    end,

    Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Boss

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["5"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Boss: " .. (settings.specialTable["5"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["5"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })
    
    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Curse

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["10"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Curse: " .. (settings.specialTable["10"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["10"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Challange

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["11"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Challange: " .. (settings.specialTable["11"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["11"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Challange

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["-11"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Boss Challange: " .. (settings.specialTable["-11"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["-11"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })
    
    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Sacrifice

    Type = ModConfigMenu.OptionType.BOOLEAN,

    Default = true,

    CurrentSetting = function() return settings.specialTable["13"] end,
    
    Display = function() return (settings.specialDoors and "" or "X  ") .. "Sacrifice: " .. (settings.specialTable["13"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

    OnChange = function(new)
        if settings.specialDoors == false then return end

        settings.specialTable["13"] = new
        save()
    end,

    Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Devil

    Type = ModConfigMenu.OptionType.BOOLEAN,

    Default = true,

    CurrentSetting = function() return settings.specialTable["14"] end,
    
    Display = function() return (settings.specialDoors and "" or "X  ") .. "Devil (IN PROGRESS): " .. (settings.specialTable["14"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

    OnChange = function(new)
        if settings.specialDoors == false then return end

        settings.specialTable["14"] = new
        save()
    end,

    Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Angel

    Type = ModConfigMenu.OptionType.BOOLEAN,

    Default = true,

    CurrentSetting = function() return settings.specialTable["15"] end,

    Display = function() return (settings.specialDoors and "" or "X  ") .. "Angel: " .. (settings.specialTable["15"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

    OnChange = function(new)
        if settings.specialDoors == false then return end

        settings.specialTable["15"] = new
        save()
    end,

    Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Bedroom

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["18"] end,
        
        Display = function() return (settings.specialDoors and "" or "X  ") .. "Bedroom " .. (settings.specialTable["18"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["18"] = new
            settings.specialTable["19"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Chest

    Type = ModConfigMenu.OptionType.BOOLEAN,

    Default = true,

    CurrentSetting = function() return settings.specialTable["20"] end,
    
    Display = function() return (settings.specialDoors and "" or "X  ") .. "Chest: " .. (settings.specialTable["20"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

    OnChange = function(new)
        if settings.specialDoors == false then return end

        settings.specialTable["20"] = new
        save()
    end,

    Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Dice

    Type = ModConfigMenu.OptionType.BOOLEAN,

    Default = true,

    CurrentSetting = function() return settings.specialTable["21"] end,
    
    Display = function() return (settings.specialDoors and "" or "X  ") .. "Dice: " .. (settings.specialTable["21"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

    OnChange = function(new)
        if settings.specialDoors == false then return end

        settings.specialTable["21"] = new
        save()
    end,

    Info = { "Toggle visibility for individual doors" }
    })

    ModConfigMenu.AddSetting("Door Overhaul", "Special", { --Planetarium

        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,

        CurrentSetting = function() return settings.specialTable["24"] end,

        Display = function() return (settings.specialDoors and "" or "X  ") .. "Planetarium: " .. (settings.specialTable["24"] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if settings.specialDoors == false then return end

            settings.specialTable["24"] = new
            save()
        end,

        Info = { "Toggle visibility for individual doors" }
    })

end



local replaceDoors = require("replacement")
DoorOverhaul:AddCallback(ModCallbacks.MC_POST_RENDER, function() replaceDoors(settings) end)
DoorOverhaul:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function() replaceDoors(settings) end)

--ModConfigMenu
if ModConfigMenu == nil then return end

DoorOverhaul:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function() 
    load()
    setupConfig()
end)