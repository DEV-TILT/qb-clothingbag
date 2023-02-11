local QBCore = exports['qb-core']:GetCoreObject()

local Objects = {}

local function CreateObjectId()
    if Objects then
        local objectId = math.random(10000, 99999)
        while Objects[objectId] do
            objectId = math.random(10000, 99999)
        end
        return objectId
    else
        local objectId = math.random(10000, 99999)
        return objectId
    end
end

QBCore.Functions.CreateUseableItem('clothingbag', function(source, item)TriggerClientEvent("qb-clothingbag:Client:spawnLight", source)end)

RegisterNetEvent('qb-clothingbag:Server:Spawnclothingbag', function(type)
    local src = source
    local objectId = CreateObjectId()
    Objects[objectId] = type
    TriggerClientEvent("qb-clothingbag:Client:Spawnclothingbag", src, objectId, type, src)
end)

RegisterNetEvent('qb-clothingbag:Server:RemoveItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
end)

RegisterNetEvent('qb-clothingbag:Server:AddItem', function(item, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem(item, amount)
end)


--[[ RegisterNetEvent('qb-clothingbag:Client:Menuclothingbag', function()
   QBCore.Functions.Progressbar("ems bag", "Taking Back the Paramedic Bag...", 1500, false, true, {
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
    exports['qb-menu']:openMenu({
        { header = "Clothing Bag", txt = "", isMenuHeader = true },
        { header = "Outfity", txt = "Vaše uložené outfity.", params = { event = "qb-clothing:client:openOutfitMenu" } },
        { header = "", txt = "❌ Close", params = { event = "qb-menu:closeMenu" } },
    })
end) --]]


