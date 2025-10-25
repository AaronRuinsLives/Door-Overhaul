--AaronRuinsLives
local normalDoorFilenames = {
    --[[Default]] [0] = { doors = {"normaldoor.png"}, weights = {1}, redRoom = "Reds/normaldoor_redroom.png" },

    --[[Basement]] [1] = { doors = {"01_basement_a.png", "01_basement_b.png"}, weights = {1, 1}, redRoom = "Reds/01_basement_redroom.png" },
    --[[Cellar]] [2] = { doors = {"01a_cellar_a.png", "01a_cellar_b.png"}, weights = {1, 0.5}, redRoom = "Reds/01a_cellar_redroom.png" },
    --[[Burning Basement]] [3] = { doors = {"01b_burning_a.png", "01b_burning_b.png", "01b_burning_c.png", "01b_burning_d.png"}, weights = {1, 1, 0.75, 0.75}, redRoom = "Reds/01b_burning_redroom.png" },
    --[[Downpour]] [31] = { doors = {"01c_downpour_a.png"}, weights = {1}, redRoom = "Reds/01c_downpour_redroom.png" },
    --[[Dross]] [45] = { doors = {"01d_dross_a.png", "01d_dross_b.png"}, weights = {1, 1}, redRoom = "Reds/01d_dross_redroom.png" },

    --[[Caves]] [4] = { doors = {"02_caves_a.png", "02_caves_b.png"}, weights = {1, 0.25}, redRoom = "Reds/02_caves_redroom.png" },
    --[[Catacombs]] [5] = { doors = {"02a_catacombs_a.png"}, weights = {1}, redRoom = "Reds/02a_catacombs_redroom.png" }, 
    --[[Flooded Caves]] [6] = { doors = {"02b_flooded_a.png"}, weights = {1}, redRoom = "Reds/02b_flooded_redroom.png" },
    --[[Mines]] [32] = { doors = {"02c_mines_a.png"}, weights = {1}, redRoom = "Reds/02c_mines_redroom.png" },
    --[[Mines Shaft]] [58] = { doors = {"02c_mines_a.png"}, weights = {1}, redRoom = "Reds/02c_mines_redroom.png" }, 
    --[[Ashpit]] [46] = { doors = {"02d_ashpit_a.png", "02d_ashpit_b.png"}, weights = {1, 1}, redRoom = "Reds/02d_ashpit_redroom.png" },
    --[[Ashpit Shaft]] [59] = { doors = {"02d_ashpit_a.png", "02d_ashpit_b.png"}, weights = {1, 1}, redRoom = "Reds/02d_ashpit_redroom.png" },
 
    --[[Depths]] [7] = { doors = {"03_depths_a.png"}, weights = {1}, redRoom = "Reds/03_depths_redroom.png" },
    --[[Necropolis]] [8] = { doors = {"03a_necropolis_a.png"}, weights = {1}, redRoom = "Reds/03a_necropolis_redroom.png" },
    --[[Dank Depths]] [9] = { doors = {"03b_dank_a.png"}, weights = {1}, redRoom = "Reds/03b_dank_redroom.png" },
    --[[Mausoleum #1]] [33] = { doors = {"03c_mausoleum_a.png", "03c_mausoleum_b.png"}, weights = {1, 0.5}, redRoom = "Reds/03c_mausoleum_redroom.png" },
    --[[Mausoleum #2]] [40] = { doors = {"03c_mausoleum_a.png", "03c_mausoleum_b.png"}, weights = {1, 0.5}, redRoom = "Reds/03c_mausoleum_redroom.png" },
    --[[Mausoleum #3]] [41] = { doors = {"03c_mausoleum_a.png", "03c_mausoleum_b.png"}, weights = {1, 0.5}, redRoom = "Reds/03c_mausoleum_redroom.png" },
    --[[Mausoleum #4]] [42] = { doors = {"03c_mausoleum_a.png", "03c_mausoleum_b.png"}, weights = {1, 0.5}, redRoom = "Reds/03c_mausoleum_redroom.png" },
    --[[Gehenna]] [47] = { doors = {"03d_gehenna_a.png"}, weights = {1}, redRoom = "Reds/03d_gehenna_redroom.png" },
   
    --[[Womb]] [10] = { doors = {"04_womb_a.png"}, weights = {1}, redRoom = "Reds/04_womb_redroom.png" },
    --[[Utero]] [11] = { doors = {"04a_utero_a.png"}, weights = {1}, redRoom = "Reds/04a_utero_redroom.png" },
    --[[Scarred Womb]] [12] = { doors = {"04b_scarred_a.png"}, weights = {1}, redRoom = "Reds/04b_scarred_redroom.png" },
    --[[Corpse #1]] [34] = { doors = {"04c_corpseA_a.png"}, weights = {1}, redRoom = "Reds/04c_corpseA_redroom.png" },
    --[[Corpse #2]] [43] = { doors = {"04c_corpseB_a.png"}, weights = {1}, redRoom = "Reds/04c_corpseB_redroom.png" },
    --[[Corpse #3]] [44] = { doors = {"04c_corpseC_a.png"}, weights = {1}, redRoom = "Reds/04c_corpseC_redroom.png" },
    --[[Blue Womb]] [13] = { doors = {"04x_blue_a.png"}, weights = {1}, redRoom = "Reds/04x_blue_redroom.png" },
   
    --[[Sheol]] [14] = { doors = {"05_sheol_a.png"}, weights = {1}, redRoom = "Reds/05_sheol_redroom.png" }, 
    --[[Cathedral]] [15] = { doors = {"05a_cathedral_a.png"}, weights = {1}, redRoom = "Reds/05a_cathedral_redroom.png", anm2 = "cathedral.anm2" },
    --[[Darkroom]] [16] = { doors = {"06_darkroom_a.png"}, weights = {1}, redRoom = "Reds/06_darkroom_redroom.png" },
    --[[Chest]] [17] = { doors = {"06a_chest_a.png"}, weights = {1}, redRoom = "Reds/06a_chest_redroom.png" },
   
    --[[Isaac's Bedroom]] [49] = { doors = {"07_house_a.png"}, weights = {1}, redRoom = "Reds/07_house_redroom.png" },
    --[[Hallway]] [50] = { doors = {"07_house_a.png"}, weights = {1}, redRoom = "Reds/tainted_closet.png" },
    --[[Mom's Bedroom]] [51] = { doors = {"07_house_a.png"}, weights = {1}, redRoom = "Reds/07_house_redroom.png" },
    --[[Closet #1]] [52] = { doors = {"07_house_a.png"}, weights = {1}, redRoom = "Reds/07_house_redroom.png" },
    --[[Closet #2]] [53] = { doors = {"07a_darkhouse_a.png"}, weights = {1}, redRoom = "Reds/07a_darkhouse_redroom.png" },
    --[[Closet #3]] [60] = { doors = {"07a_darkhouse_a.png"}, weights = {1}, redRoom = "Reds/07a_darkhouse_redroom.png" },
}

local specialDoorFilenames = {
    --[[Shop]] [1] = { doors = {"00_shop.png"}, redRoom = "Reds/00_shop_redroom.png", allowFlip = false },
    --[[Tainted Shop]] [2] = { doors = {"00_shop_tainted.png"}, redRoom = "Reds/00_shop_tainted_redroom.png", allowFlip = false },
    --[[Treasure]] [3] = { doors = {"00_treasure.png"}, redRoom = "Reds/00_treasure_redroom.png", allowFlip = false },
    --[[Devil Treasure]] [4] = { doors = {"00_treasure_devil.png"}, redRoom = "Reds/00_treasure_devil_redroom.png", allowFlip = false },
    --[[Greed Treasure]] [5] = { doors = {"00_treasure_greed.png"}, redRoom = "Reds/00_treasure_greed_redroom.png", allowFlip = false },
    --[[Boss]] [6] = { doors = {"00_boss.png"}, redRoom = "Reds/00_boss_redroom.png", anm2 = "boss.anm2", allowFlip = false },
    --[[Arcade]] [7] = { doors = {"00_arcade.png"}, redRoom = "Reds/00_arcade_redroom.png", anm2 = "arcade.anm2", allowFlip = false },
    --[[Curse]] [8] = { doors = {"00_curse.png"}, redRoom = "Reds/00_curse_redroom.png", allowFlip = false },
    --[[Curse (No Spikes)]] [9] = { doors = {"00_curse_nospikes.png"}, redRoom = "Reds/00_curse_nospikes_redroom.png", allowFlip = false },
    --[[Challenge]] [10] = { doors = {"00_challenge.png"}, redRoom = "Reds/00_challenge_redroom.png", allowFlip = false },
    --[[Boss Challenge]] [11] = { doors = {"00_challenge_boss.png"}, redRoom = "Reds/00_boss_challenge_redroom.png", allowFlip = false },
    --[[Library]] [12] = { doors = {"00_library.png"}, redRoom = "Reds/00_library_redroom.png", allowFlip = false },
    --[[Sacrifice]] [13] = { doors = {"00_sacrifice.png"}, redRoom = "Reds/00_sacrifice_redroom.png", allowFlip = false },
    --[[Devil]] [14] = { doors = {"00_devil.png"}, redRoom = "Reds/00_devil_redroom.png", allowFlip = false },
    --[[Angel]] [15] = { doors = {"00_angel.png"}, redRoom = "Reds/00_angel_redroom.png", anm2 = "cathedral.anm2", allowFlip = false },
    --[[Bedroom]] [16] = { doors = {"00_bedroom.png"}, redRoom = "Reds/00_bedroom_redroom.png", allowFlip = false },
    --[[Bedroom (Barren)]] [17] = { doors = {"00_bedroom.png"}, redRoom = "Reds/00_bedroom_redroom.png", allowFlip = false },
    --[[Chest]] [18] = { doors = {"00_chest.png"}, redRoom = "Reds/00_chest_redroom.png", allowFlip = false },
    --[[Dice]] [19] = { doors = {"00_dice.png"}, redRoom = "Reds/00_dice_redroom.png", allowFlip = false },
    --[[Black Market]] [20] = { doors = {"00_blackmarket.png"}, redRoom = "Reds/00_blackmarket_redroom.png", anm2 = "exit.anm2", allowFlip = false },
    --[[Planetarium]] [21] = { doors = {"00_planetarium.png"}, redroom = "Reds/00_planetarium_redroom.png", allowFlip = false },
}

local storyDoorFilenames = {
    --[[Greed Exit]] [1] = { doors = {"00_greed_exit.png"}, anm2 = "exit.anm2", allowFlip = false },
    --[[Downpour Entrance]] [2] = { doors = {"00_entrance_downpour.png"}, allowFlip = false },
    --[[Mines Entrance]] [3] = { doors = {"00_entrance_mines.png"}, allowFlip = false },
    --[[Mausoleum Entrance]] [4] = { doors = {"00_entrance_mausoleum.png"}, anm2 = "entrance_mausoleum.anm2", allowFlip = false },
    --[[Corpse Entrance]] [5] = { doors = {"00_entrance_corpse.png"}, allowFlip = false },
    --[[Mirror]] [6] = { doors = {"00_mirror.png"}, anm2 = "mirror.anm2", allowFlip = false },
    --[[Mineshaft Mines]] [7] = { doors = {"02c_mines_a.png"}, weights = {1} },
    --[[Mineshaft Ashpit]] [8] = { doors = {"02d_ashpit_a.png"}, weights = {1} },
}

--Check if a set of provided room flags has a certain flag
local function hasFlag(roomFlags, flag)
    return roomFlags & flag ~= 0
end

--Determines what the current door should be replaced with
local function getDoorInfo(indexedDoor, currentRoom, settings)

    local currentType = indexedDoor.CurrentRoomType
    local targetType = indexedDoor.TargetRoomType
    local currentRoomFlags = Game():GetLevel():GetCurrentRoomDesc().Flags
    local targetRoomFlags = Game():GetLevel():GetRoomByIdx(indexedDoor.TargetRoomIndex).Flags

    local stageEnum = Game():GetLevel():GetStage()
    local backdropEnum = currentRoom:GetBackdropType()

    local doorTable = nil
    local doorIndex = nil
    local doorType = 0

    --Exclusions

    --Secret
    if currentType == RoomType.ROOM_SECRET or currentType == RoomType.ROOM_SUPERSECRET or currentType == RoomType.ROOM_ULTRASECRET or targetType == RoomType.ROOM_SECRET or targetType == RoomType.ROOM_SUPERSECRET or targetType == RoomType.ROOM_ULTRASECRET then return end
        
    --Boss Rush
    if currentType == RoomType.ROOM_BOSSRUSH or targetType == RoomType.ROOM_BOSSRUSH then return end

    --Hush
    if Game():GetLevel():GetCurrentRoomIndex() == GridRooms.ROOM_BLUE_WOOM_IDX or indexedDoor.TargetRoomIndex == GridRooms.ROOM_BLUE_WOOM_IDX then return end

    --Mega Satan
    if Game():GetLevel():GetCurrentRoomIndex() == GridRooms.ROOM_MEGA_SATAN_IDX or indexedDoor.TargetRoomIndex == GridRooms.ROOM_MEGA_SATAN_IDX then return end

    --The Void
    if Game():GetLevel():GetCurrentRoomIndex() == GridRooms.ROOM_THE_VOID_IDX or indexedDoor.TargetRoomIndex == GridRooms.ROOM_THE_VOID_IDX then return end

    --Polaroid Door
    if (currentType == RoomType.ROOM_SECRET_EXIT or targetType == RoomType.ROOM_SECRET_EXIT) and (Game():GetLevel():GetCurrentRoomIndex() == 84 or indexedDoor.TargetRoomIndex == 84) and (stageEnum == 5 or stageEnum == 6) then return end

    --Normal Doors
    if settings.normalDoors then

        --Normal
        if currentType == RoomType.ROOM_DEFAULT or targetType == RoomType.ROOM_DEFAULT then
            doorIndex = backdropEnum
            doorType = 1
        end

        --Miniboss
        if currentType == RoomType.ROOM_MINIBOSS or targetType == RoomType.ROOM_MINIBOSS then
            doorIndex = backdropEnum
            doorType = 1
        end

        --Error
        if currentType == RoomType.ROOM_ERROR or targetType == RoomType.ROOM_ERROR then
            doorIndex = backdropEnum
            doorType = 1
        end
    end
    
    --Special Doors
    if settings.specialDoors then

        --Black Market
        if currentType == RoomType.ROOM_BLACK_MARKET or targetType == RoomType.ROOM_BLACK_MARKET then
            doorType = 2
            doorIndex = 20
        end

        --Bedroom
        if currentType == RoomType.ROOM_ISAACS or targetType == RoomType.ROOM_ISAACS then
            doorType = 2
            doorIndex = 16
        end

        --Bedroom (Barren)
        if currentType == RoomType.ROOM_BARREN or targetType == RoomType.ROOM_BARREN then
            doorType = 2
            doorIndex = 17
        end

        --Chest
        if currentType == RoomType.ROOM_CHEST or targetType == RoomType.ROOM_CHEST then
            doorType = 2
            doorIndex = 18
        end

        --Library
        if currentType == RoomType.ROOM_LIBRARY or targetType == RoomType.ROOM_LIBRARY then
            doorType = 2
            doorIndex = 12
        end

        --Arcade
        if currentType == RoomType.ROOM_ARCADE or targetType == RoomType.ROOM_ARCADE then
            doorType = 2
            doorIndex = 7
        end

        --Sacrifice
        if currentType == RoomType.ROOM_SACRIFICE or targetType == RoomType.ROOM_SACRIFICE then
            doorType = 2
            doorIndex = 13
        end

        --Dice 
        if currentType == RoomType.ROOM_DICE or targetType == RoomType.ROOM_DICE then
            doorType = 2
            doorIndex = 19
        end

        --Shop
        if currentType == RoomType.ROOM_SHOP or targetType == RoomType.ROOM_SHOP then
            doorType = 2
            doorIndex = 1

            --Tainted Shop
            for x = 0, Game():GetNumPlayers() - 1, 1 do
                if Game():GetPlayer(x):GetPlayerType() == PlayerType.PLAYER_KEEPER_B then 
                    doorIndex = 2
                    break
                end
            end
        end

        --Treasure
        if currentType == RoomType.ROOM_TREASURE or targetType == RoomType.ROOM_TREASURE then
            doorType = 2
            doorIndex = 3

            --Devil Treasure
            if hasFlag(currentRoomFlags, RoomDescriptor.FLAG_DEVIL_TREASURE) or hasFlag(targetRoomFlags, RoomDescriptor.FLAG_DEVIL_TREASURE) then
                doorIndex = 4
            end

            --Greed Treasure
            if Game():IsGreedMode() and (indexedDoor.Slot == 6 or (indexedDoor.Slot == 0 and Game():GetLevel():GetCurrentRoomIndex() == 98)) then
                doorIndex = 5
            end
        end

        --Planetarium
        if currentType == RoomType.ROOM_PLANETARIUM or targetType == RoomType.ROOM_PLANETARIUM then
            doorType = 2
            doorIndex = 21
        end

        --Angel
        if currentType == RoomType.ROOM_ANGEL or targetType == RoomType.ROOM_ANGEL then
            doorType = 2
            doorIndex = 15
        end

        --Devil
        if currentType == RoomType.ROOM_DEVIL or targetType == RoomType.ROOM_DEVIL then
            doorType = 2
            doorIndex = 14
        end

        --Challenge
        if currentType == RoomType.ROOM_CHALLENGE or targetType == RoomType.ROOM_CHALLENGE then
            doorType = 2
            doorIndex = 10

            --Boss Challenge
            if stageEnum == 2 or stageEnum == 4 or stageEnum == 6 or stageEnum == 8 then
                doorIndex = 11
            end
        end

        --Curse
        if currentType == RoomType.ROOM_CURSE or targetType == RoomType.ROOM_CURSE then
            doorType = 2
            doorIndex = 8

            --Curse (No Spikes)
            for x = 0, Game():GetNumPlayers()-1, 1 do
                if Game():GetPlayer(x):HasTrinket(TrinketType.TRINKET_FLAT_FILE) then
                    doorIndex = 9
                    break
                end
            end
        end

        --Boss
        if currentType == RoomType.ROOM_BOSS or targetType == RoomType.ROOM_BOSS then
            doorType = 2
            doorIndex = 6

            --Hush
            if (Game():GetLevel():GetCurrentRoomIndex() == 59 or Game():GetLevel():GetCurrentRoomIndex() == 71 or indexedDoor.TargetRoomIndex == 71) and stageEnum == 9 then return end
        end

    end

    --Story Doors
    if settings.storyDoors then

        --Greed Exit
        if currentType == RoomType.ROOM_GREED_EXIT or targetType == RoomType.ROOM_GREED_EXIT then
            doorType = 3
            doorIndex = 1
        end

        --Downpour / Alt Mines Entrances
        if (currentType == RoomType.ROOM_SECRET_EXIT or targetType == RoomType.ROOM_SECRET_EXIT) and (stageEnum == 1 or stageEnum == 2) then
            doorType = 3
            doorIndex = 2

            local stageType = Game():GetLevel():GetStageType()

            --Lead to Mines if already on an alt floor
            if stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
                doorIndex = 3
            end
        end

        --Mines / Alt Mausoleum Entrances
        if (currentType == RoomType.ROOM_SECRET_EXIT or targetType == RoomType.ROOM_SECRET_EXIT) and (stageEnum == 3 or stageEnum == 4) then
            doorType = 3
            doorIndex = 3

            local stageType = Game():GetLevel():GetStageType()
            
            --Lead to Mausoleum if already on an alt floor
            if stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B then
                doorIndex = 4
            end
        end

        --Mausoleum Entrance
        if (currentType == RoomType.ROOM_SECRET_EXIT or targetType == RoomType.ROOM_SECRET_EXIT) and (stageEnum == 5 or stageEnum == 6) then
            doorType = 3
            doorIndex = 4
        end

        --Corpse Entrance (Outside)
        if targetType == RoomType.ROOM_BOSS and indexedDoor.TargetRoomIndex == GridRooms.ROOM_SECRET_EXIT_IDX and (stageEnum == 5 or stageEnum == 6) then
            doorType = 3
            doorIndex = 5
        end

        --Corpse Entrance (Inside)
        if currentType == RoomType.ROOM_BOSS and backdropEnum == BackdropType.WOMB and (stageEnum == 5 or stageEnum == 6) then
            doorType = 3
            doorIndex = 5
        end

        --Mirror
        if indexedDoor.TargetRoomIndex == GridRooms.ROOM_MIRROR_IDX then
            doorType = 3
            doorIndex = 6
        end

        --Mineshaft Mines
        if indexedDoor.TargetRoomIndex == GridRooms.ROOM_MINESHAFT_IDX and (backdropEnum == BackdropType.MINES or backdropEnum == BackdropType.MINES_SHAFT) then
            doorType = 3
            doorIndex = 7
        end

        --Mineshaft Ashpit
        if indexedDoor.TargetRoomIndex == GridRooms.ROOM_MINESHAFT_IDX and (backdropEnum == BackdropType.ASHPIT or backdropEnum == BackdropType.ASHPIT_SHAFT) then
            doorType = 3
            doorIndex = 8
        end
    end

    --Get the table with the doors info. Return blank if none was ever found or its toggled off in the settings
    if doorType == 0 then return

    elseif doorType == 1 then
        if settings.normalDoorTable[doorIndex] == 3 then return end

        doorTable = normalDoorFilenames[doorIndex]

    elseif doorType == 2 then
        if settings.specialDoorTable[doorIndex] == false then return end

        doorTable = specialDoorFilenames[doorIndex]

    elseif doorType == 3 then
        if settings.storyDoorTable[doorIndex] == false then return end

        doorTable = storyDoorFilenames[doorIndex]
    end

    --Set the defaults of missing values in the tables
    if type(doorTable) ~= "table" then return end
    if type(doorTable.doors) ~= "table" then doorTable.doors = {"normaldoor.png"} end
    if type(doorTable.weights) ~= "table" then doorTable.weights = {1} end
    if type(doorTable.redRoom) ~= "string" then doorTable.redRoom = "Reds/normaldoor_redroom.png" end
    if type(doorTable.anm2) ~= "string" then doorTable.anm2 = "default.anm2" end
    if type(doorTable.allowFlip) ~= "boolean" then doorTable.allowFlip = true end

    --The final file the door will end up being
    local doorFile = doorTable.doors[1]

    --Choose the door variant based on a random value and variant weights
    if settings.variants and (doorType ~= 1 or settings.normalDoorTable[doorIndex] == 1) then
        local weightMax = 0
        
        for x = 1, #doorTable.weights, 1 do
            weightMax = weightMax + doorTable.weights[x]
        end
        
        --Set the seed based on the decoration seed and door slot so that doors will stay consistent when reentering a room
        math.randomseed(currentRoom:GetDecorationSeed() + indexedDoor.Slot)
        local doorValue = math.random() * weightMax

        for x = 1, #doorTable.weights, 1 do
            doorValue = doorValue - doorTable.weights[x]
            if doorValue <= 0 then
                doorFile = doorTable.doors[x]
                break
            end
        end
    end

    --Flipping doors randomly 50/50 and deciding what axis they're flipped on
    if settings.variants and settings.flipping and doorTable.allowFlip == true then

        --Set the seed based on the decoration seed and door slot so that doors will stay consistent when reentering a room
        math.randomseed(currentRoom:GetDecorationSeed() + indexedDoor.Slot)
        if math.random(0, 1) == 1 then
            if indexedDoor.Direction == 0 or indexedDoor.Direction == 2 then indexedDoor:GetSprite().FlipY = true end
            if indexedDoor.Direction == 1 or indexedDoor.Direction == 3 then indexedDoor:GetSprite().FlipX = true end
        end
    end

    --For doors that LEAD INTO a red room, as doors inside of a red room already inherit the wall color
    if not hasFlag(currentRoomFlags, RoomDescriptor.FLAG_RED_ROOM) and hasFlag(targetRoomFlags, RoomDescriptor.FLAG_RED_ROOM) then
        doorFile = doorTable.redRoom
    end

    return {file = doorFile, anm2 = doorTable.anm2}
end


--The actual code that goes through, checks, and replaces each door
return function(settings)
    local currentRoom = Game():GetRoom()

    --Loop through all door slots and check for a door. If so, get the new file and replace
    for x = 0, 7, 1 do
        local indexedDoor = currentRoom:GetDoor(x)
        if indexedDoor == nil then goto loopSkip end

        local doorSprite = indexedDoor:GetSprite()
        local currentAnim = doorSprite:GetAnimation()
        local currentFrame = doorSprite:GetFrame()

        local doorInfo = getDoorInfo(indexedDoor, currentRoom, settings);
        if doorInfo == nil then goto loopSkip end
        if doorInfo.file == nil then goto loopSkip end
        if doorInfo.anm2 == nil then goto loopSkip end

        doorSprite:Load(doorInfo.anm2, false)

        --Replace all layers of the spritesheet
        for y = 0, doorSprite:GetLayerCount()-1, 1 do
            doorSprite:ReplaceSpritesheet(y, doorInfo.file)
        end

        doorSprite:Play(currentAnim)
        doorSprite:SetFrame(currentFrame)

        doorSprite:LoadGraphics()

        ::loopSkip::
    end
end