local HUD = {}

RegisterNetEvent("3dme:DoScreenHUD")
AddEventHandler("3dme:DoScreenHUD", function(src, type, message)
    HUD[src] = { time = GetGameTimer()+8000, text = message, type = type }
end)

CreateThread(function()
    local lastHTML = ""
    while true do
        local currentHTML = ""
        local currentTime = GetGameTimer()
        local myPed = PlayerPedId()
    
        for k,v in pairs(HUD) do
            if v['time'] < currentTime then
                HUD[k] = nil
            else
                local player = GetPlayerFromServerId(k)
                local ped = GetPlayerPed(player)
                if NetworkIsPlayerActive(player) and DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    if #(GetEntityCoords(myPed) - GetEntityCoords(ped) < 8.0 and HasEntityClearLosToEntity(myPed, ped, 17 ) then
                        local retval, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z- (v.type == 1 and 0.4 or -0.4))
                        currentHTML = currentHTML .. '<p class="message" style="left: ' .. (x*100) .. '%;top: ' .. (y*100) .. '%; color: white;">' .. v.text .. '</p>'
                    end
                else
                    HUD[k] = nil
                end
            end
        end
    
        if currentHTML ~= lastHTML then
            lastHTML = currentHTML
            SendNUIMessage({ ['data'] = lastHTML })
            Wait(1)
        else
            Wait(200)
        end
    end
end)