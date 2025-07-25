--A list of all backdrop ID's with their corosponding normal doors
local normalRoomFilenames = {
    --[[NULL]] [0] = { default = "rd_normaldoor" },
    --[[Basement]] [1] = { default = "01_rd_basement_a", variants = {"01_rd_basement_a", "01_rd_basement_b"}, redRoom = "rd_basement_redroom", allowFlip = true },
    --[[Cellar]] [2] = { default = "01a_rd_cellar_a", variants = {"01a_rd_cellar_a"}, allowFlip = true },
    --[[Burning Basement]] [3] = { default = "01b_rd_burning_a", variants = {"01b_rd_burning_a", "01b_rd_burning_b", "01b_rd_burning_c", "01b_rd_burning_d"}, allowFlip = true },
    --[[Downpour]] [31] = { default = "01c_rd_downpour_a", variants = {"01c_rd_downpour_a"}, allowFlip = true },
    --[[Dross]] [45] = { default = "01d_rd_dross_a", variants = {"01d_rd_dross_a"}, allowFlip = true },
    --[[Caves]] [4] = { default = "02_rd_caves_a", variants = {"02_rd_caves_a", "02_rd_caves_b"}, allowFlip = true },
    --[[Catacombs]] [5] = { default = "02a_rd_catacombs_a", variants = {"02a_rd_catacombs_a"}, allowFlip = true }, 
    --[[Flooded Caves]] [6] = { default = "02b_rd_flooded_a", variants = {"02b_rd_flooded_a"}, allowFlip = true },
    --[[Mines]] [32] = { default = "02c_rd_mines_a", variants = {"02c_rd_mines_a"}, allowFlip = true },
    --[[Mines Shaft]] [58] = { default = "02c_rd_mines_a", variants = {"02c_rd_mines_a"}, allowFlip = true }, --No idea where this would be used but just in case
    --[[Ashpit]] [46] = { default = "02d_rd_ashpit_a", variants = {"02d_rd_ashpit_a", "02d_rd_ashpit_b"}, allowFlip = true },
    --[[Ashpit Shaft]] [59] = { default = "02d_rd_ashpit_a", variants = {"02d_rd_ashpit_a", "02d_rd_ashpit_b"}, allowFlip = true },  --No idea where this would be used but just in case
    --[[Depths]] [7] = { default = "03_rd_depths_a", variants = {"03_rd_depths_a"}, allowFlip = true },
    --[[Necropolis]] [8] = { default = "03a_rd_necropolis_a", variants = {"03a_rd_necropolis_a"}, allowFlip = true },
    --[[Dank Depths]] [9] = { default = "03b_rd_dank_a", variants = {"03b_rd_dank_a"}, allowFlip = true },
    --[[Mausoleum 1]] [33] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, allowFlip = true },
    --[[Mausoleum 2]] [40] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, allowFlip = true },
    --[[Mausoleum 3]] [41] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, allowFlip = true },
    --[[Mausoleum 4]] [42] = { default = "03c_rd_mausoleum_a", variants = {"03c_rd_mausoleum_a"}, allowFlip = true },
    --[[Gehenna]] [47] = { default = "03d_rd_gehenna_a", variants = {"03d_rd_gehenna_a"}, allowFlip = true },
    --[[Womb]] [10] = { default = "04_rd_womb_a", variants = {"04_rd_womb_a"}, allowFlip = true },
    --[[Utero]] [11] = { default = "04a_rd_utero_a", variants = {"04a_rd_utero_a"}, allowFlip = true },
    --[[Scarred]] [12] = { default = "04b_rd_scarred_a", variants = {"04b_rd_scarred_a"}, allowFlip = true },
    --[[Blue Womb]] [13] = { default = "04x_rd_blue_a", variants = {"04x_rd_blue_a"}, allowFlip = true }, --No idea where this would be used but just in case
    --[[Corpse 1]] [34] = { default = "04c_rd_corpseA_a", variants = {"04c_rd_corpseA_a"}, allowFlip = true },
    --[[Corpse 2]] [43] = { default = "04c_rd_corpseB_a", variants = {"04c_rd_corpseB_a"}, allowFlip = true },
    --[[Corpse 3]] [44] = { default = "04c_rd_corpseC_a", variants = {"04c_rd_corpseC_a"}, allowFlip = true },
    --[[Sheol]] [14] = { default = "05_rd_sheol_a", variants = {"05_rd_sheol_a"}, allowFlip = true }, 
    --[[Cathedral]] [15] = { default = "05a_rd_cathedral_a", variants = {"05a_rd_cathedral_a"}, anm2 = "rd_cathedral", allowFlip = true },
    --[[Darkroom]] [16] = { default = "06_rd_darkroom_a", variants = {"06_rd_darkroom_a"}, allowFlip = true }, --make anm2
    --[[Chest]] [17] = { default = "06a_rd_chest_a", variants = {"06a_rd_chest_a"}, allowFlip = true },
    --[[Isaac's Bedroom]] [49] = { default = "13_rd_house_a", variants = {"13_rd_house_a"} },
    --[[Hallway]] [50] = { default = "13_rd_house_a", variants = {"13_rd_house_a"}, redRoom = "rd_house_tainted" },
    --[[Mom's Bedroom]] [51] = { default = "13_rd_house_a", variants = {"13_rd_house_a"} },
    --[[Closet]] [52] = { default = "13_rd_house_a", variants = {"13_rd_house_a"} },
    --[[Closet 2]] [53] = { default = "13a_rd_darkhouse_a", variants = {"13a_rd_darkhouse_a"} },
    --[[Closet 3]] [60] = { default = "13a_rd_darkhouse_a", variants = {"13a_rd_darkhouse_a"} },
}

--Same as normalRoomFilenames but for special rooms and indexed by roomType instead
local roomFilenames = {
    --[[Shop]] [2] = { default = "00_rd_shopdoor" },
    --[[Treasure]] [4] = { default = "00_rd_treasuredoor", redRoom = "rd_treasuredoor_redroom" },
    --[[Greed Treasure]] [-4] = { default = "00_rd_treasuredoor_greed" },
    --[[Devil Treasure]] [-5] = { default = "00_rd_treasuredoor_devil" },
    --[[Boss]] [5] = { default = "00_rd_bossdoor", anm2 = "rd_boss" },
    --[[Arcade]] [9] = { default = "00_rd_arcade", anm2 = "rd_arcade" },
    --[[Curse]] [10] = { default = "00_rd_cursedoor" },
    --[[Curse No Spikes]] [-10] = { default = "00_rd_cursedoor_nospikes" },
    --[[Challenge]] [11] = { default = "00_rd_challenge", redRoom = "rd_challenge_redroom"  },
    --[[Boss Challenge]] [-11] = { default = "00_rd_challenge_boss", redRoom = "rd_challenge_redroom"  },
    --[[Library]] [12] = { default = "00_rd_library" },
    --[[Sacrifice]] [13] = { default = "00_rd_sacrifice", redRoom = "rd_sacrifice_redroom" },
    --[[Devil]] [14] = { default = "00_rd_devil" },
    --[[Angel]] [15] = { default = "00_rd_angel", anm2 = "rd_cathedral" },
    --[[Bedroom]] [18] = { default = "00_rd_bedroom"},
    --[[Barren]] [19] = { default = "00_rd_bedroom"},
    --[[Chest]] [20] = { default = "00_rd_chest" },
    --[[Dice]] [21] = { default = "00_rd_diceroom" },
    --[[Planetarium]] [24] = { default = "00_rd_planetarium", }, --make anm2
    --[[Blue Womb]] [28] = { default = "04x_rd_blue_a", variants = {"04x_rd_blue_a"}, allowFlip = true },
    --[[Downpour Entrance]] [50] = { default = "00_rd_entrance_downpour", },
    --[[Mines Entrance]] [51] = { default = "00_rd_entrance_mines" },
    --[[Corpse Entrance]] [52] = { default = "00_rd_shopdoor" },
    --[[Mirror]] [54] = { default = "00_rd_mirror", anm2 = "00_rd_mirror" },
    --[[Mineshaft Mines]] [55] = { default = "02c_rd_mines_a" },
    --[[Mineshaft Ashpit]] [-55] = { default = "02d_rd_ashpit_a" },
}

--Determines what door should be shown
local function getDoorInfo(indexedDoor, currentRoom, currentRoomFlags, targetRoomFlags, settings)

    --Gets the current roomtype of the current room you're in and the target room of the door
    local current = indexedDoor.CurrentRoomType
    local target = indexedDoor.TargetRoomType
    local stageEnum = Game():GetLevel():GetStage()

    local doorTable = nil
 
    --This next section prioritizes showing some rooms over others, such as special rooms or curse doors

    --Normal Rooms
    if (current == 1 or current == 6) and (target == 1 or target == 6) and indexedDoor.TargetRoomIndex ~= -100 and indexedDoor.TargetRoomIndex ~= -101 then                                                                         
        if settings.normalDoors == false or settings.normalTable[tostring(currentRoom:GetBackdropType())] == "Off" then return nil end 

        doorTable = normalRoomFilenames[currentRoom:GetBackdropType()]

    --Special Rooms
    elseif settings.specialDoors == false then return nil end

    --Alt Path Entrances
    if indexedDoor.TargetRoomIndex == -10 and (stageEnum == 1 or stageEnum == 2) and settings.specialTable["50"] == true then
        doorTable = roomFilenames[50]

    elseif indexedDoor.TargetRoomIndex == -10 and (stageEnum == 3 or stageEnum == 4) and settings.specialTable["51"] == true then
        doorTable = roomFilenames[51]

    elseif indexedDoor.TargetRoomIndex == -10 and (stageEnum == 5 or stageEnum == 6) and settings.specialTable["52"] == true then
        doorTable = roomFilenames[52]

    --Mirror
    elseif indexedDoor.TargetRoomIndex == -100 and settings.specialTable["54"] then
        doorTable = roomFilenames[54]

    --Mineshaft
    elseif indexedDoor.TargetRoomIndex == -101 and settings.specialTable["55"] == true then
        --Mines
        doorTable = roomFilenames[55]

        --Ashpit
        if currentRoom:GetBackdropType() == 46 or currentRoom:GetBackdropType() == 59 then 
            doorTable = roomFilenames[-55]
        end

    --Secret
    elseif (current == 7 or current == 8 or current == 29 or target == 7 or target == 8 or target == 29) then 
        return nil
    --Curse Rooms
    elseif (current == 10 or target == 10) and settings.specialTable["10"] == true then                                                                      
        doorTable = roomFilenames[10]

        for i = 0, Game():GetNumPlayers()-1, 1 do
            if Game():GetPlayer(i):HasTrinket(TrinketType.TRINKET_FLAT_FILE) then
                doorTable = roomFilenames[-10]
                break
            end
        end

    --Boss Rooms
    elseif (current == 5 or target == 5) and settings.specialTable["5"] == true then                                                                      
        doorTable = roomFilenames[5]

        --Boss Rush
        if indexedDoor.TargetRoomIndex == -5 then
            return nil
        end

        --Hush
        if indexedDoor.TargetRoomIndex == -8 or stageEnum == 9 then
            return nil
        end

        --Corpse Entrance
        if stageEnum == 6 and currentRoom:GetBackdropType() == 10 then
            doorTable = roomFilenames[52]
        end

        --Mega Satan
        if indexedDoor.TargetRoomIndex == -7 then
            return nil
        end
        
    --Treasure Rooms
    elseif (current == 4 or target == 4) and settings.specialTable["4"] == true then   
        doorTable = roomFilenames[4]                                                      

        --Greed Boss Treasure Rooms
        if Game():IsGreedMode() and (indexedDoor.Slot == 6 or (Game():GetLevel():GetCurrentRoomIndex() == 98 and indexedDoor.Slot == 0)) then
            doorTable = roomFilenames[-4]

        --Devil Treasure Rooms
        elseif currentRoomFlags>>11 == 1 or targetRoomFlags>>11 == 1 then
            doorTable = roomFilenames[-5]
        end   
    --Challenge and Boss Challenge     
    elseif (current == 11 or target == 11) and settings.specialTable["11"] == true then
        doorTable = roomFilenames[11]

        if stageEnum == 2 or stageEnum == 4 or stageEnum == 6 or stageEnum == 8 then
            doorTable = roomFilenames[-11]
        end


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
    if doorTable.redRoom == nil then doorTable.redRoom = doorTable.default end
    if doorTable.anm2 == nil then doorTable.anm2 = "rd_default" end
    if doorTable.allowFlip == nil then doorTable.allowFlip = false end

    --Variants
    local doorFile = doorTable.default
    if settings.variants == true and settings.normalTable[tostring(currentRoom:GetBackdropType())] == "On" then                                                                    
        math.randomseed(currentRoom:GetDecorationSeed() + indexedDoor.Slot)
        doorFile = doorTable.variants[math.random(#doorTable.variants)]
    end

    --Randomly Flip Doors
    if settings.variants == true  and settings.flipping == true and doorTable.allowFlip == true then                                                  
        local willFlip = math.random(0, 1)
        if ((indexedDoor:GetSprite().Rotation / 90) % 2) == 0 and willFlip == 1 then indexedDoor:GetSprite().FlipX = true end
        if ((indexedDoor:GetSprite().Rotation / 90) % 2) == 1 and willFlip == 1 then indexedDoor:GetSprite().FlipY = true end
    end

    --For doors that LEAD INTO a red room, as doors inside of a red room already inherit the wall color
    if ((targetRoomFlags & RoomDescriptor.FLAG_RED_ROOM) ~= 0) and not ((currentRoomFlags & RoomDescriptor.FLAG_RED_ROOM) ~= 0) then
        doorFile = "Red Rooms/" .. doorTable.redRoom
    end


    return {file = doorFile, anm2 = doorTable.anm2}
end



--The actual code that goes through, checks, and replaces each door
return function(settings)
    local currentRoom = Game():GetRoom()

    --Loop through all door slots and check for a door. If so, get new file and replace
    for x = 0, 7, 1 do
        local indexedDoor = currentRoom:GetDoor(x)
        if indexedDoor == nil then goto loopSkip end

        local doorSprite = indexedDoor:GetSprite()
        local currentAnim = doorSprite:GetAnimation()
        local currentFrame = doorSprite:GetFrame()

        local currentRoomFlags = Game():GetLevel():GetCurrentRoomDesc().Flags
        local targetRoomFlags = Game():GetLevel():GetRoomByIdx(indexedDoor.TargetRoomIndex).Flags

        local doorInfo = getDoorInfo(indexedDoor, currentRoom, currentRoomFlags, targetRoomFlags, settings);
        if doorInfo == nil then goto loopSkip end

        if doorInfo.anm2 ~= nil then doorSprite:Load("gfx/grid/" .. doorInfo.anm2 .. ".anm2", false) end

        --Replace all layers of the spritesheet
        for y = 0, doorSprite:GetLayerCount()-1, 1 do
            doorSprite:ReplaceSpritesheet(y, "gfx/grid/" .. doorInfo.file .. ".png")
        end

        doorSprite:Play(currentAnim)
        doorSprite:SetFrame(currentFrame)

        doorSprite:LoadGraphics()

        ::loopSkip::
    end
end
