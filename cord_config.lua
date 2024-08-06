Config = {}
Config.ShopCoords = { -- I was a bit slow when i made this script and cant be asked fixing it but vector3(x,y,z) works just fine
    ["shop_general"] = { x = 24.44, y = -1346.66, z = 28.54, h = 275.08},
    ["shop_general1"] = { x = -706.14, y = -913.68, z = 18.24, h = 91.68},
    ["shop_general2"] = { x = 372.49, y = 326.43, z = 102.58, h = 253.14},
    ["shop_general3"] = { x = -46.7, y = -1757.97, z = 28.24, h = 56.08},
    ["shop_general4"] = { x = 1164.66, y = -322.77, z = 68.24, h =100.94},
    ["shop_general5"] = { x = -3039.08, y = 584.53, z = 6.94, 15.43},
    ["shop_general6"] = { x = 1960.13, y = 3740.0, z = 31.34, h = 299.51},
    ["shop_general7"] = { x = 1698.08, y = 4922.91, z = 41.06, h = 332.81},
    ["shop_general8"] = { x = 1727.91, y = 6415.3, z = 34.06, h = 235.02},
    ["shop_general9"] = { x = 2557.13, y = 380.76, z = 107.74, h = 353.52},
    ["shop_general10"] = { x = 2678.13, y = 3279.32, z = 54.24, h = 330.21},
    ["shop_weapons"] = { x = 23.29, y = -1105.69, z = 28.82, h = 157.23},
    ["shop_weapons1"] = { x = -661.54, y = -933.61, z = 21.83, h = 177.06},
    ["shop_weapons2"] = { x = 1692.76, y = 3761.44, z = 33.7, h = 226.16},
    ["shop_weapons3"] = { x = 2567.08, y = 292.64, z = 107.73, h = 357.65},
    ["shop_hardware"] = { x = 182.34, y = -1319.12, z = 28.32, h = 244.89},
}

RegisterNetEvent('shop:getCoords')
AddEventHandler('shop:getCoords', function(shopKey)
    -- Check if the shopKey exists in the Config.ShopCoords table
    if Config.ShopCoords[shopKey] then
        print(shopKey)
        -- Send the shopCoords value to the client
        TriggerClientEvent('shop:receiveCoords', source, Config.ShopCoords[shopKey], shopKey)
    end
end)
