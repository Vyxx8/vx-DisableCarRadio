Citizen.CreateThread(function()
    local lastVehicle = nil

    while true do
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(playerPed, false)

        if vehicle ~= 0 then
            if vehicle ~= lastVehicle then
                SetVehicleRadioEnabled(vehicle, false)
                SetVehRadioStation(vehicle, "OFF")
                lastVehicle = vehicle
            end

            if GetIsVehicleRadioActive(vehicle) then
                SetVehicleRadioEnabled(vehicle, false)
                SetVehRadioStation(vehicle, "OFF")
            end

            SetUserRadioControlEnabled(false)
        else
            lastVehicle = nil
        end

        Citizen.Wait(100)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
        if vehicle ~= 0 then
            SetVehicleRadioEnabled(vehicle, false)
            SetVehRadioStation(vehicle, "OFF")
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        local vehicles = GetGamePool('CVehicle')
        for _, vehicle in ipairs(vehicles) do
            if DoesEntityExist(vehicle) then
                SetVehicleRadioEnabled(vehicle, false)
                SetVehRadioStation(vehicle, "OFF")
            end
        end
    end
end)
