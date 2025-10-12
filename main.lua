--AaronRuinsLives
local json = require("json")
DoorOverhaul = RegisterMod("Door Overhaul", 1)

local settings = {
    normalDoors = true,
    specialDoors = true,
    storyDoors = true,
    variants = true,
    flipping = true,

    --Indexes in this table represent the enum of the backdrop this door should show up in
    normalDoorTable = {
        --[[Default]] [0] = 1,
        --[[Basement]] [1] = 1,
        --[[Cellar]] [2] = 1,
        --[[Burning Basement]] [3] = 1,
        --[[Downpour]] [31] = 1,
        --[[Dross]] [45] = 1,

        --[[Caves]] [4] = 1,
        --[[Catacombs]] [5] = 1, 
        --[[Flooded Caves]] [6] = 1,
        --[[Mines]] [32] = 1,
        --[[Mines Shaft]] [58] = 1,
        --[[Ashpit]] [46] = 1,
        --[[Ashpit Shaft]] [59] = 1,
    
        --[[Depths]] [7] = 1,
        --[[Necropolis]] [8] = 1,
        --[[Dank Depths]] [9] = 1,
        --[[Mausoleum #1]] [33] = 1,
        --[[Mausoleum #2]] [40] = 1,
        --[[Mausoleum #3]] [41] = 1,
        --[[Mausoleum #4]] [42] = 1,
        --[[Gehenna]] [47] = 1,

        --[[Womb]] [10] = 1,
        --[[Utero]] [11] = 1,
        --[[Scarred Womb]] [12] = 1,
        --[[Corpse #1]] [34] = 1,
        --[[Corpse #2]] [43] = 1,
        --[[Corpse #3]] [44] = 1,
        --[[Blue Womb]] [13] = 1,

        --[[Sheol]] [14] = 1, 
        --[[Cathedral]] [15] = 1,
        --[[Darkroom]] [16] = 1,
        --[[Chest]] [17] = 1,

        --[[Isaac's Bedroom]] [49] = 1,
        --[[Hallway]] [50] = 1,
        --[[Mom's Bedroom]] [51] = 1,
        --[[Closet #1]] [52] = 1,
        --[[Closet #2]] [53] = 1,
        --[[Closet #3]] [60] = 1,
    },

    specialDoorTable = {
        --[[Shop]] [1] = true,
        --[[Tainted Shop]] [2] = true, 
        --[[Treasure]] [3] = true,
        --[[Devil Treasure]] [4] = true, 
        --[[Greed Treasure]] [5] = true,
        --[[Boss]] [6] = true,
        --[[Arcade]] [7] = true,
        --[[Curse]] [8] = true,
        --[[Curse (No Spikes)]] [9] = true,
        --[[Challenge]] [10] = true,
        --[[Boss Challenge]] [11] = true,
        --[[Library]] [12] = true,
        --[[Sacrifice]] [13] = true,
        --[[Devil]] [14] = true,
        --[[Angel]] [15] = true,
        --[[Bedroom]] [16] = true,
        --[[Bedroom (Barren)]] [17] = true,
        --[[Chest]] [18] = true,
        --[[Dice]] [19] = true,
        --[[Black Market]] [20] = true,
        --[[Planetarium]] [21] = true,
    },

    storyDoorTable = {
        --[[Greed Exit]] [1] = true,
        --[[Downpour Entrance]] [2] = true,
        --[[Mines Entrance]] [3] = true,
        --[[Mausoleum Entrance]] [4] = true,
        --[[Corpse Entrance]] [5] = true,
        --[[Mirror]] [6] = true,
        --[[Mineshaft Mines]] [7] = true,
        --[[Mineshaft Ashpit]] [8] = true,
    },
}

local function save()
    local data = json.encode(settings)
    DoorOverhaul:SaveData(data)
end

local function load()
    if not DoorOverhaul:HasData() then return end

    local data = DoorOverhaul:LoadData()
    loadedSettings = json.decode(data)

    --Set missing or wrong values
    if type(loadedSettings.normalDoors) ~= "boolean" then loadedSettings.normalDoors = true end
    if type(loadedSettings.specialDoors) ~= "boolean" then loadedSettings.specialDoors = true end
    if type(loadedSettings.storyDoors) ~= "boolean" then loadedSettings.storyDoors = true end
    if type(loadedSettings.variants) ~= "boolean" then loadedSettings.variants = true end
    if type(loadedSettings.flipping) ~= "boolean" then loadedSettings.flipping = true end
    if type(loadedSettings.normalDoorTable) ~= "table" then loadedSettings.normalDoorTable = {} end
    if type(loadedSettings.specialDoorTable) ~= "table" then loadedSettings.specialDoorTable = {} end
    if type(loadedSettings.storyDoorTable) ~= "table" then loadedSettings.storyDoorTable = {} end

    --Fill in missing or wrong values in the tables
    for key, value in pairs(settings.normalDoorTable) do
        if type(loadedSettings.normalDoorTable[key]) ~= "number" or value < 1 or 3 < value then
            loadedSettings.normalDoorTable[key] = 1
        end
    end

    for key, value in pairs(settings.specialDoorTable) do
        if type(loadedSettings.specialDoorTable[key]) ~= "boolean" then
            loadedSettings.specialDoorTable[key] = true
        end
    end

    for key, value in pairs(settings.storyDoorTable) do
        if type(loadedSettings.storyDoorTable[key]) ~= "boolean" then
            loadedSettings.storyDoorTable[key] = true
        end
    end

    settings = loadedSettings
end

--Quickly adds a setting for a door into the "Normal" tab
local function addNormalDoorSetting(label, keys)

    --First value is what gets displayed but all other values the setting controls should also be the same
    ModConfigMenu.AddSetting("Door Overhaul", "Normal", {
        Type = ModConfigMenu.OptionType.NUMBER,

        Default = 1,
        CurrentSetting = function() return settings.normalDoorTable[keys[1]] end,

        Display = function()

                local choices = {
                    "On",
                    "No Variants",
                    "Off",
                }

                local finalString = label .. choices[ settings.normalDoorTable[keys[1]] ]

                if not settings.normalDoors then
                    finalString = "X " .. finalString .. " X"
                end

                return finalString
            end,

        OnChange = function(new)
            if not settings.normalDoors then return end

            for key, value in pairs(keys) do
                settings.normalDoorTable[value] = new
            end

            save()
        end,

        Minimum = 1,
        Maximum = 3,
        Info = { "Toggle individual doors" }
    })
    
end

--Quickly adds a setting for a door into the "Special" tab
local function addSpecialDoorSetting(label, keys)

    ModConfigMenu.AddSetting("Door Overhaul", "Special", {
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,
        CurrentSetting = function() return settings.specialDoorTable[keys[1]] end,

        Display = function() return (settings.specialDoors and "" or "X  ") .. label .. (settings.specialDoorTable[keys[1]] and "On" or "Off") .. (settings.specialDoors and "" or "  X") end,

        OnChange = function(new)
            if not settings.specialDoors then return end

            for key, value in pairs(keys) do
                settings.specialDoorTable[value] = new
            end

            save()
        end,

        Info = { "Toggle individual doors" }
    })
    
end

--Quickly adds a setting for a door into the "Story" tab
local function addStoryDoorSetting(label, keys)

    ModConfigMenu.AddSetting("Door Overhaul", "Story", {
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,
        CurrentSetting = function() return settings.storyDoorTable[keys[1]] end,

        Display = function() return (settings.storyDoors and "" or "X  ") .. label .. (settings.storyDoorTable[keys[1]] and "On" or "Off") .. (settings.storyDoors and "" or "  X") end,

        OnChange = function(new)
            if not settings.storyDoors then return end

            for key, value in pairs(keys) do
                settings.storyDoorTable[value] = new
            end

            save()
        end,
        
        Info = { "Toggle individual doors" }
    })
    
end

--Adds all the door settings to the Mod Config Menu
local function setupConfig()
    ModConfigMenu.RemoveCategory("Door Overhaul")
    ModConfigMenu.UpdateCategory("Door Overhaul", {
        Name = "Door Overhaul",
        Info = "Settings for your new doors"
    })

    --General

    --Normal Doors
    ModConfigMenu.AddSetting("Door Overhaul", "General", {
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,
        CurrentSetting = function() return settings.normalDoors end,

        Display = function() return "Normal Doors: " .. (settings.normalDoors and "On" or "Off") end,

        OnChange = function(new)
            settings.normalDoors = new
            save()
        end,
        
        Info = { "Toggles whether normal doors are changed" }
    })

    --Special Doors
    ModConfigMenu.AddSetting("Door Overhaul", "General", {
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,
        CurrentSetting = function() return settings.specialDoors end,

        Display = function() return "Special Doors: " .. (settings.specialDoors and "On" or "Off") end,

        OnChange = function(new)
            settings.specialDoors = new
            save()
        end,
        
        Info = { "Toggles whether special doors are changed" }
    })

    --Story Doors
    ModConfigMenu.AddSetting("Door Overhaul", "General", {
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,
        CurrentSetting = function() return settings.storyDoors end,

        Display = function() return "Story Doors: " .. (settings.storyDoors and "On" or "Off") end,

        OnChange = function(new)
            settings.storyDoors = new
            save()
        end,
        
        Info = { "Toggles whether some story essential doors are changed" }
    })

    --Variants
    ModConfigMenu.AddSetting("Door Overhaul", "General", {
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,
        CurrentSetting = function() return settings.variants end,

        Display = function() return "Variants: " .. (settings.variants and "On" or "Off") end,

        OnChange = function(new)
            settings.variants = new
            save()
        end,
        
        Info = { "Toggle if variants of doors can appear" }
    })

    --Flipping
    ModConfigMenu.AddSetting("Door Overhaul", "General", {
        Type = ModConfigMenu.OptionType.BOOLEAN,

        Default = true,
        CurrentSetting = function() return settings.flipping end,

        Display = function() return (settings.variants and "" or "X  ") .. "Flipping: " .. (settings.flipping and "On" or "Off") .. (settings.variants and "" or "  X") end,

        OnChange = function(new)
            if not settings.variants then return end

            settings.flipping = new
            save()
        end,
        
        Info = { "Toggle if doors are randomly flipped" }
    })

    --Normal
    addNormalDoorSetting("Default: ", {0})
    ModConfigMenu.AddSpace("Door Overhaul", "Normal")

    addNormalDoorSetting("Basement: ", {1}) 
    addNormalDoorSetting("Cellar: ", {2}) 
    addNormalDoorSetting("Burning Basement: ", {3}) 
    addNormalDoorSetting("Downpour: ", {31}) 
    addNormalDoorSetting("Dross: ", {45}) 
    ModConfigMenu.AddSpace("Door Overhaul", "Normal")

    addNormalDoorSetting("Caves: ", {4}) 
    addNormalDoorSetting("Catacombs: ", {5})
    addNormalDoorSetting("Flooded Caves: ", {6}) 
    addNormalDoorSetting("Mines: ", {32, 58}) 
    addNormalDoorSetting("Ashpit: ", {46, 59}) 
    ModConfigMenu.AddSpace("Door Overhaul", "Normal")

    addNormalDoorSetting("Depths: ", {7})
    addNormalDoorSetting("Necropolis: ", {8}) 
    addNormalDoorSetting("Dank Depths: ", {9}) 
    addNormalDoorSetting("Mausoleum: ", {33, 40, 41, 42}) 
    addNormalDoorSetting("Gehenna: ", {47}) 
    ModConfigMenu.AddSpace("Door Overhaul", "Normal")

    addNormalDoorSetting("Womb: ", {10}) 
    addNormalDoorSetting("Utero: ", {11})
    addNormalDoorSetting("Scarred Womb: ", {12}) 
    addNormalDoorSetting("Corpse: ", {34, 43, 44}) 
    addNormalDoorSetting("Blue Womb: ", {13}) 
    ModConfigMenu.AddSpace("Door Overhaul", "Normal")

    addNormalDoorSetting("Sheol: ", {14})
    addNormalDoorSetting("Cathedral: ", {15})
    ModConfigMenu.AddSpace("Door Overhaul", "Normal")

    addNormalDoorSetting("Darkroom: ", {16})
    addNormalDoorSetting("Chest: ", {17}) 
    ModConfigMenu.AddSpace("Door Overhaul", "Normal")

    addNormalDoorSetting("Home: ", {49, 50, 51, 52, 53, 60})

    --Special
    addSpecialDoorSetting("Shop: ", {1})
    addSpecialDoorSetting("Tainted Shop: ", {2})
    addSpecialDoorSetting("Treasure: ", {3}) 
    addSpecialDoorSetting("Devil Treasure: ", {4}) 
    addSpecialDoorSetting("Greed Treasure: ", {5}) 
    addSpecialDoorSetting("Boss: ", {6})
    addSpecialDoorSetting("Arcade: ", {7})
    addSpecialDoorSetting("Curse: ", {8, 9})
    addSpecialDoorSetting("Challenge: ", {10})
    addSpecialDoorSetting("Boss Challenge: ", {11})
    addSpecialDoorSetting("Library: ", {12})
    addSpecialDoorSetting("Sacrifice: ", {13})
    addSpecialDoorSetting("Devil: ", {14})
    addSpecialDoorSetting("Angel: ", {15}) 
    addSpecialDoorSetting("Bedroom: ", {16, 17})
    addSpecialDoorSetting("Chest: ", {18})
    addSpecialDoorSetting("Dice: ", {19})
    addSpecialDoorSetting("Black Market: ", {20})
    addSpecialDoorSetting("Planetarium: ", {21})
    addSpecialDoorSetting("Blue Key: ", {22}) 

    --Story
    addStoryDoorSetting("Greed Exit: ", {1})
    addStoryDoorSetting("Downpour Entrance: ", {2})
    addStoryDoorSetting("Mines Entrance: ", {3}) 
    addStoryDoorSetting("Mausoleum Entrance: ", {4}) 
    addStoryDoorSetting("Corpse Entrance: ", {5}) 
    addStoryDoorSetting("Mirror: ", {6}) 
    addStoryDoorSetting("Mineshaft (Mines): ", {7}) 
    addStoryDoorSetting("Mineshaft (Ashpit): ", {8}) 
    
end

--Check for ModConfigMenu and set it up
if ModConfigMenu ~= nil then
    DoorOverhaul:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function() 
        load()
        setupConfig()
    end)
end

--Add the door replacement function to the callbacks
local replaceDoors = require("replacement")
DoorOverhaul:AddCallback(ModCallbacks.MC_POST_RENDER, function() replaceDoors(settings) end)
DoorOverhaul:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function() replaceDoors(settings) end)