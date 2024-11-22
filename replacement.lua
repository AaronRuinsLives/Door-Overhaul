
--A list of all backdrop ID's with their corosponding normal doors
local normalRoomFilenames = {
    --[[NULL]] [0] = { default = "rd_normaldoor" },
    --[[Basement]] [1] = { default = "01_rd_basement_a", variants = {"01_rd_basement_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Cellar]] [2] = { default = "01a_rd_cellar_a", variants = {"01a_rd_cellar_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Burning Basement]] [3] = { default = "01b_rd_burning_a", variants = {"01b_rd_burning_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Downpour]] [31] = { default = "01c_rd_downpour_a", variants = {"01c_rd_downpour_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Dross]] [45] = { default = "01d_rd_dross_a", variants = {"01d_rd_dross_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Caves]] [4] = { default = "02_rd_caves_a", variants = {"02_rd_caves_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Catacombs]] [5] = { default = "02a_rd_catacombs_a", variants = {"02a_rd_catacombs_a"}, anm2 = "rd_default", allowFlip = true }, --Change destroyed frame
    --[[Flooded Caves]] [6] = { default = "02b_rd_flooded_a", variants = {"02b_rd_flooded_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Mines]] [32] = { default = "02c_rd_mines_a", variants = {"02c_rd_mines_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Mines Shaft]] [58] = { default = "02c_rd_mines_a", variants = {"02c_rd_mines_a"}, anm2 = "rd_default", allowFlip = true }, --No idea where this would be used but just in case
    --[[Ashpit]] [46] = { default = "02d_rd_ashpit_a", variants = {"02d_rd_ashpit_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Ashpit Shaft]] [59] = { default = "02d_rd_ashpit_a", variants = {"02d_rd_ashpit_a"}, anm2 = "rd_default", allowFlip = true },  --No idea where this would be used but just in case
    --[[Depths]] [7] = { default = "03_rd_depths_a", variants = {"03_rd_depths_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Necropolis]] [8] = { default = "03a_rd_necropolis_a", variants = {"03a_rd_necropolis_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Dank Depths]] [9] = { default = "03b_rd_dank_a", variants = {"03b_rd_dank_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Mausoleum 1]] [33] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Mausoleum 2]] [40] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Mausoleum 3]] [41] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Mausoleum 4]] [42] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Gehenna]] [47] = { default = "03d_rd_gehenna_a", variants = {"03d_rd_gehenna_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Womb]] [10] = { default = "04_rd_womb_a", variants = {"04_rd_womb_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Utero]] [11] = { default = "04a_rd_utero_a", variants = {"04a_rd_utero_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Scarred]] [12] = { default = "04b_rd_scarred_a", variants = {"04b_rd_scarred_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Blue Womb]] [13] = { default = "04x_rd_blue_a", variants = {"04x_rd_blue_a"}, anm2 = "rd_default", allowFlip = true }, --No idea where this would be used but just in case
    --[[Corpse 1]] [34] = { default = "04c_rd_corpseA_a", variants = {"04c_rd_corpseA_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Corpse 2]] [43] = { default = "04c_rd_corpseB_a", variants = {"04c_rd_corpseB_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Corpse 3]] [44] = { default = "04c_rd_corpseC_a", variants = {"04c_rd_corpseC_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Sheol]] [14] = { default = "05_rd_sheol_a", variants = {"05_rd_sheol_a"}, anm2 = "rd_default", allowFlip = true }, --Change destroyed frame
    --[[Cathedral]] [15] = { default = "05a_rd_cathedral_a", variants = {"05a_rd_cathedral_a"}, anm2 = "rd_cathedral", allowFlip = true },
    --[[Darkroom]] [16] = { default = "06_rd_darkroom_a", variants = {"06_rd_darkroom_a"}, anm2 = "rd_default", allowFlip = true }, --make anm2
    --[[Chest]] [17] = { default = "06a_rd_chest_a", variants = {"06a_rd_chest_a"}, anm2 = "rd_default", allowFlip = true },

}

--Same as normalRoomFilenames but for special rooms and indexed by roomType instead
local roomFilenames = {
    --[[Shop]] [2] = { default = "00_rd_shopdoor", anm2 = "rd_default" },
    --[[Treasure]] [4] = { default = "00_rd_treasuredoor", anm2 = "rd_default" },
    --[[Greed Treasure]] [-4] = { default = "00_rd_treasuredoor_greed", anm2 = "rd_default" },
    --[[Boss]] [5] = { default = "00_rd_bossdoor", anm2 = "rd_boss" },
    --[[Curse]] [10] = { default = "00_rd_cursedoor", anm2 = "rd_default" },
    --[[Sacrafice]] [13] = { default = "00_rd_sacrafice", anm2 = "rd_default" },
    --[[Devil]] --[14] = { default = "00_rd_angel", anm2 = "rd_default" },
    --[[Angel]] [15] = { default = "00_rd_angel", anm2 = "rd_cathedral" },
    --[[Chest]] [20] = { default = "00_rd_chest", anm2 = "rd_default" },
    --[[Dice]] [21] = { default = "00_rd_diceroom", anm2 = "rd_default" },
    --[[Planetarium]] [24] = { default = "00_rd_planetarium", anm2 = "rd_lit" }, --make anm2
    --[[Blue Womb]] [28] = { default = "04x_rd_blue_a", variants = {"04x_rd_blue_a"}, anm2 = "rd_default", allowFlip = true }, --Blue Key 
}

local function getDoorInfo(indexedDoor, currentRoom, settings)

    --Gets the current roomtype of the current room you're in and the target room of the door
    local current = indexedDoor.CurrentRoomType
    local target = indexedDoor.TargetRoomType

    local doorTable = nil


    --This next section prioritizes showing some rooms over others, such as special rooms or curse doors
    
    
    --Normal Rooms
    if ((current == 1 or current == 6) and (target == 1 or target == 6)) then                                                                         
        if settings.normalDoors == false or settings.normalTable[tostring(currentRoom:GetBackdropType())] == "Off" then return nil end 

        doorTable = normalRoomFilenames[currentRoom:GetBackdropType()]

    elseif settings.specialDoors == false then return nil  
    elseif (current == 7 or current == 8 or current == 29 or target == 7 or target == 8 or target == 29) then return nil                                                                               --Secret

    --Curse Rooms (As current)
    elseif current == 10 and settings.specialTable[tostring(current)] == true then                                                                      
        doorTable = roomFilenames[current]
    --Curse Rooms (As target)
    elseif target == 10 and settings.specialTable[tostring(target)] == true then                                                                      
        doorTable = roomFilenames[target]
        
    --Treasure Rooms
    elseif target == 4 and settings.specialTable[tostring(target)] == true then                                                                       

    --Greed Boss Treasure Rooms
        if Game():IsGreedMode() and (indexedDoor.Slot == 6 or (Game():GetLevel():GetCurrentRoomIndex() == 98 and indexedDoor.Slot == 0)) then
            target = -4
        end

        doorTable = roomFilenames[target]

    --All Other Special Rooms
    else                                                                                                                                           
        if target ~= 1 then 
            if settings.specialTable[tostring(target)] == true then doorTable = roomFilenames[target] end
        else 
            if settings.specialTable[tostring(current)] == true then doorTable = roomFilenames[current] end
        end
    end

    --Set defaults for missing parts of the table
    if doorTable == nil then return nil end

    if doorTable.default == nil then doorTable.default = "rd_normaldoor" end
    if doorTable.variants == nil then doorTable.variants = {doorTable.default} end
    if doorTable.anm2 == nil then doorTable.anm2 = nil end
    if doorTable.allowFlip == nil then doorTable.allowFlip = false end

    local doorFile = doorTable.default
    if settings.variants == true and settings.normalTable[tostring(currentRoom:GetBackdropType())] == "On" then                                                                    --Variants
        math.randomseed(currentRoom:GetDecorationSeed() + indexedDoor.Slot)
        doorFile = doorTable.variants[math.random(#doorTable.variants)]
    end

    --Randomly Flip Doors
    if settings.variants == true  and settings.flipping == true and doorTable.allowFlip == true then                                                  
        local willFlip = math.random(0, 1)
        if ((indexedDoor:GetSprite().Rotation / 90) % 2) == 0 and willFlip == 1 then indexedDoor:GetSprite().FlipX = true end
        if ((indexedDoor:GetSprite().Rotation / 90) % 2) == 1 and willFlip == 1 then indexedDoor:GetSprite().FlipY = true end
    end

    return {file = doorFile , anm2 = doorTable.anm2}
end

--The actual code that goes through, checks, and replaces each door
return function(settings)
    local currentRoom = Game():GetRoom()

    for x = 0, 7, 1 do
        local indexedDoor = currentRoom:GetDoor(x)
        if indexedDoor == nil then goto loopSkip end

        local doorInfo = getDoorInfo(indexedDoor, currentRoom, settings)
        if doorInfo == nil then goto loopSkip end

        local doorSprite = indexedDoor:GetSprite()

        if doorInfo.anm2 ~= nil then doorSprite:Load("gfx/grid/" .. doorInfo.anm2 .. ".anm2", false) end

        for y = 0, doorSprite:GetLayerCount()-1, 1 do
            doorSprite:ReplaceSpritesheet(y, "gfx/grid/" .. doorInfo.file .. ".png")
        end

        --Dont know why I gotta do this but it works
        if not indexedDoor:IsOpen() then
            doorSprite:Play("Close")
            if indexedDoor:IsLocked() then 
            doorSprite:Play("KeyClosed")

            for i = 0, Game():GetNumPlayers()-1, 1 do
                if Game():GetPlayer(i):HasCollectible(CollectibleType.COLLECTIBLE_PAY_TO_PLAY) then
                    doorSprite:Play("CoinClosed")
                    break
                end
            end
            end
        end

        doorSprite:LoadGraphics()
        ::loopSkip::
    end
end
