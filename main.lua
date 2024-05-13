RedoneDoors = RegisterMod("Redone Doors", 1)

local json = require("json")

local settings = {
    variants = true,
    flipping = true,
    normalDoors = true,
    specialDoors = true,
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
end

local replaceDoors = require("replacement")
RedoneDoors:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function() replaceDoors(settings) end)

--ModConfigMenu
if ModConfigMenu == nil then return end

RedoneDoors:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function() 
    load()
    setupConfig()
end)