local normalRoomFilenames = {
    --[[NULL]] [0] = { default = "rd_normaldoor" },
    --[[Basement]] [1] = { default = "01_rd_basement_a", variants = {"01_rd_basement_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Cellar]] [2] = { default = "01a_rd_cellar_a", variants = {"01a_rd_cellar_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Burning Basement]] [3] = { default = "01b_rd_burning_a", variants = {"01b_rd_burning_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Caves]] [4] = { default = "02_rd_caves_a", variants = {"02_rd_caves_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Catacombs]] [5] = { default = "02a_rd_catacombs_a", variants = {"02a_rd_catacombs_a"}, anm2 = "rd_default", allowFlip = true }, --Change destroyed frame
    --[[Flooded Caves]] [6] = { default = "02b_rd_flooded_a", variants = {"02b_rd_flooded_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Depths]] [7] = { default = "03_rd_depths_a", variants = {"03_rd_depths_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Necropolis]] [8] = { default = "03a_rd_necropolis_a", variants = {"03a_rd_necropolis_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Dank Depths]] [9] = { default = "03b_rd_dank_a", variants = {"03b_rd_dank_a"}, anm2 = "rd_default", allowFlip = true },
    --[[Cathedral]] [15] = { default = "05_rd_cathedral_a", variants = {"05_rd_cathedral_a"}, anm2 = "rd_cathedral", allowFlip = true },
}

local roomFilenames = {
    --[[Shop]] [2] = { default = "00_rd_shopdoor", anm2 = "rd_default" },
    --[[Treasure]] [4] = { default = "00_rd_treasuredoor", anm2 = "rd_default" },
    --[[Treasure]] [-4] = { default = "00_rd_treasuredoor_greed", anm2 = "rd_default" },
    --[[Boss]] [5] = { default = "00_rd_bossdoor", anm2 = "rd_boss" },
    --[[Curse]] [10] = { default = "00_rd_cursedoor", anm2 = "rd_default" },
}

local function getDoorInfo(indexedDoor, currentRoom, settings)
    local current = indexedDoor.CurrentRoomType
    local target = indexedDoor.TargetRoomType

    local doorTable = nil
            
    if ((current == 1 or current == 6) and (target == 1 or target == 6)) then                                                                         --Normal
        if settings.normalDoors == false or settings.normalTable[tostring(currentRoom:GetBackdropType())] == "Off" then return nil end 

        doorTable = normalRoomFilenames[currentRoom:GetBackdropType()]

    elseif settings.specialDoors == false then return nil  
    elseif (current == 7 or current == 8 or current == 29 or target == 7 or target == 8 or target == 29) then return nil                                                                               --Secret

    elseif settings.specialTable[tostring(target)] == true and target == 10 then                                                                      --Curse
        doorTable = roomFilenames[target]
        
    elseif settings.specialTable[tostring(target)] == true and target == 4 then                                                                       --Treasure

        if Game():IsGreedMode() and (indexedDoor.Slot == 6 or (Game():GetLevel():GetCurrentRoomIndex() == 98 and indexedDoor.Slot == 0)) then         --Greed
            if settings.specialTable["-4"] == false then return nil end
            target = -4
        end

        doorTable = roomFilenames[target]

    else                                                                                                                                              --Special
        if target ~= 1 then 
            if settings.specialTable[tostring(target)] == true then doorTable = roomFilenames[target] end
        else 
            if settings.specialTable[tostring(current)] == true then doorTable = roomFilenames[current] end
        end
    end

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

    if settings.variants == true  and settings.flipping == true and doorTable.allowFlip == true then                        --Flipping
        local willFlip = math.random(0, 1)
        if ((indexedDoor:GetSprite().Rotation / 90) % 2) == 0 and willFlip == 1 then indexedDoor:GetSprite().FlipX = true end
        if ((indexedDoor:GetSprite().Rotation / 90) % 2) == 1 and willFlip == 1 then indexedDoor:GetSprite().FlipY = true end
    end

    return {file = doorFile , anm2 = doorTable.anm2}
end

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

        if not indexedDoor:IsOpen() then
            doorSprite:Play("Close")
            if indexedDoor:IsLocked() then --Dont know why I gotta do this but it works
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
