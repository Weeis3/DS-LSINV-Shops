
local QBCore = exports['qb-core']:GetCoreObject()

-- Just Remove these if you dont want a debug command
RegisterCommand("generalshop", function()
    local ped = PlayerPedId()
    TriggerEvent("shop:open", ped, "shop_general")
end, false)
RegisterCommand("weaponsshop", function()
    local ped = PlayerPedId()
    TriggerEvent("shop:open", ped, "shop_weapons")
end, false)
RegisterCommand("hardwareshop", function()
    local ped = PlayerPedId()
    TriggerEvent("shop:open", ped, "shop_hardware")
end, true)

RegisterNetEvent('shop:open')
AddEventHandler('shop:open', function(source, shopKey)
    print(shopKey)
    exports["ls-inventoryhud"]:ShopInventory("SHOP-"..Config.Shops[shopKey].name, "shop1", true, Config.Shops[shopKey].items)
end)
local function addBlip(coords, text)
    print(text)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    if text == "24/7" then
        SetBlipSprite(blip, 59)
        SetBlipColour(blip, 2)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, 250)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        PulseBlip(blip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(text)
        EndTextCommandSetBlipName(blip)
        return blip
    elseif text == "Ammunation" then
        SetBlipSprite(blip, 110)
        SetBlipColour(blip, 2)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, 250)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        PulseBlip(blip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(text)
        EndTextCommandSetBlipName(blip)
        return blip
    elseif text == "Hardware Store" then
        SetBlipSprite(blip, 402)
        SetBlipColour(blip, 2)
        SetBlipDisplay(blip, 4)
        SetBlipAlpha(blip, 250)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        PulseBlip(blip)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(text)
        EndTextCommandSetBlipName(blip)
        return blip
    end
end
RegisterNetEvent('shop:receiveCoords')
AddEventHandler('shop:receiveCoords', function(shopCoords, shopKey)
    local coords = shopCoords
    local pedModel = GetHashKey(Config.Shops[shopKey].ped) 
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Citizen.Wait(10)
    end
    local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z, coords.h, false, true)
    if shopKey ~= "blackmarket" then 
        addBlip(coords, Config.Shops[shopKey].label)
    end

    local player = PlayerPedId()

    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    TaskStartScenarioInPlace(ped, Config.Shops[shopKey].anim, 0, true)
    exports['qb-target']:AddTargetEntity(ped, { 
        options = { 
            { 
                type = "client", 
                action = function(entity)
                    TriggerEvent('shop:open', entity, shopKey)
                end,
                targeticon = 'fa-solid fa-basket-shopping', 
                label = 'Open Shop', 
            }
        },
        distance = 2.5, 
    })
end)
local blackmarket = nil
CreateThread(function()
    -- Now coords are set, proceed with creating Peds
    for shopKey, shopValue in pairs(Config.Shops) do
        TriggerServerEvent("shop:getCoords", shopKey)
    end

end)


