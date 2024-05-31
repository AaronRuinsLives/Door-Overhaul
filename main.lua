RedoneDoors = RegisterMod("Redone Doors", 1)

local json = require("json")

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
        ["15"] = "On",
    },

   specialTable = {
        ["2"] = true,
        ["4"] = true,
        ["-4"] = true,
        ["10"] = true,
    },
}

local function save()
    local data = json.encode(settings)
    RedoneDoors:SaveData(data)
end

local function load()
    if not RedoneDoors:HasData() then return end

    local data = RedoneDoors:LoadData()
    settings = json.decode(data)
end

local function setupConfig()
    ModConfigMenu.RemoveCategory("Redone Doors")
    ModConfigMenu.UpdateCategory("Redone Doors", {
        Name = "Redone Doors",
        Info = "Settings for your new doors"
    })

    ------------------------------General------------------------------

    ModConfigMenu.AddSetting("Redone Doors", "General", { --Variants

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

    ModConfigMenu.AddSetting("Redone Doors", "General", { --Flipping

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

    ModConfigMenu.AddSetting("Redone Doors", "General", { --Normal Doors

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

    ModConfigMenu.AddSetting("Redone Doors", "General", { --Special Doors
        
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

    ModConfigMenu.AddSpace("Redone Doors", "General")
    ModConfigMenu.AddSpace("Redone Doors", "General")
    ModConfigMenu.AddText("Redone Doors", "General", "By: AaronRuinsLives")


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
    
    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Default

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Basement

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Cellar

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Burning

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Caves

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Catacombs

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Flooded

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Depths

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

    ModConfigMenu.AddSetting("Redone Doors", "Normal", { --Cathedral

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

    ModConfigMenu.AddSetting("Redone Doors", "Special", { --Shop

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

    ModConfigMenu.AddSetting("Redone Doors", "Special", { --Treasure

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

    ModConfigMenu.AddSetting("Redone Doors", "Special", { --Greed Treasure

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

    ModConfigMenu.AddSetting("Redone Doors", "Special", { --Curse

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
end



local replaceDoors = require("replacement")
RedoneDoors:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function() replaceDoors(settings) end)

--ModConfigMenu
if ModConfigMenu == nil then return end

RedoneDoors:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function() 
    load()
    setupConfig()
end)