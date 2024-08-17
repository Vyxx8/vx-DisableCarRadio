QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if not QBCore.Functions.GetPlayerData().citizenid then
            Citizen.Wait(5000)
        else
            PlayerData = QBCore.Functions.GetPlayerData()
            break
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if IsPedInAnyVehicle(PlayerPedId()) then
            SetUserRadioControlEnabled(false)
            if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()), "OFF")
            end
        end
    end
end)
