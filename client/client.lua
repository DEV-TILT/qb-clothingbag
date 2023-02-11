local QBCore = exports['qb-core']:GetCoreObject()
local clothingbag1 = nil
local function dropclothingbag()
    DetachEntity(clothingbag1)
    PlaceObjectOnGroundProperly(clothingbag1)
end
local function spawnclothingbag()
    local hasBag = true
    CreateThread(function()
        while hasBag do
            Wait(0)
            if IsControlJustReleased(0, 38) then -- If E is pressed it drop the  bag
                hasBag = false
                dropclothingbag()
                Wait(1500)
            end
        end
    end)
end
local ObjectList = {}

RegisterNetEvent('qb-clothingbag:Client:Spawnclothingbag', function()
    local hash = GetHashKey('prop_big_bag_01')
    local ped = PlayerPedId()
    local x, y, z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.5))
    QBCore.Functions.LoadModel(hash)
    clothingbag1 = CreateObjectNoOffset(hash, x, y, z, true, false)
    SetModelAsNoLongerNeeded(hash)
    AttachEntityToEntity(clothingbag1, ped, GetPedBoneIndex(ped, 57005), 0.30, 0, -0.05, 0.10, 270.0, 60.0, true, true, false,
        true, 1, true)
        spawnclothingbag()
    TriggerServerEvent("qb-clothingbag:Server:RemoveItem","clothingbag",1)
end)

RegisterNetEvent('qb-clothingbag:Client:spawnLight', function()

    TriggerServerEvent("qb-clothingbag:Server:Spawnclothingbag", "clothingbag")
end)

RegisterNetEvent('qb-clothingbag:Client:takeclothingbag')
AddEventHandler("qb-clothingbag:Client:takeclothingbag", function()
    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    local playerPedPos = GetEntityCoords(PlayerPedId(), true)
    local clothingbag = GetClosestObjectOfType(playerPedPos, 10.0, GetHashKey("prop_big_bag_01"), false, false, false)
    local playerPed = PlayerPedId()
    QBCore.Functions.Progressbar("ems bag", "Taking Back the Clothing Bag...", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
    end)
    Wait(1500)
    QBCore.Functions.Notify(("Clothing Bag Taken Back with success."), "success", 2500)
    SetEntityAsMissionEntity(clothingbag, 1, 1)
    DeleteObject(clothingbag)
    TriggerServerEvent("qb-clothingbag:Server:AddItem","clothingbag",1)
end)

RegisterNetEvent('qb-clothingbag:Client:openclothingbag')
AddEventHandler("qb-clothingbag:Client:openclothingbag", function()
    QBCore.Functions.Progressbar("ems bag", "Taking clothes from bag...", 1500, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'random@domestic',
        anim = 'pickup_low',
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())
    end)
    Wait(1600)
    TriggerEvent("qb-clothing:client:openOutfitMenu")
end)

local clothingbags = {
    `prop_big_bag_01`,
}

exports['qb-target']:AddTargetModel(clothingbags, {
    options = {
        {
            event = "qb-clothingbag:Client:openclothingbag",
            icon = "fa-solid fa-suitcase-medical",
            label = "Clothing Bag"
        },
        {
            event = "qb-clothingbag:Client:takeclothingbag",
            icon = "fa-solid fa-suitcase-medical",
            label = "Take Back Clothing Bag"
        }
    },
    distance = 2.5,
})

print('[QBCORE] Clothing Bag by TILT#5099 Download: https://discord.gg/NsgmZaTPa7')