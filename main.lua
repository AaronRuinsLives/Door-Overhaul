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
        --[[Tainted Arcade)]] [22] = true,
        --[[Curse]] [8] = true,
        --[[Curse (No Spikes)]] [9] = true,
        --[[Tainted Curse]] [23] = true,
        --[[Tainted Curse (No Spikes)]] [24] = true,
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

load()

--Add the door replacement function to the callbacks
local replaceDoors = require("replacement")
DoorOverhaul:AddCallback(ModCallbacks.MC_POST_UPDATE, function() replaceDoors(settings) end)
DoorOverhaul:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function() replaceDoors(settings) end)

--Check for ModConfigMenu and set it up
if ModConfigMenu ~= nil then
    local setupConfig = require("modconfigmenu")
    DoorOverhaul:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function() setupConfig(settings) end)
end