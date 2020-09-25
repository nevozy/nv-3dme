RegisterCommand('me', function(source, args)
    DoScreenHUD(source, 1, table.concat(args, " "))
end)

RegisterCommand('do', function(source, args)
    DoScreenHUD(source, 0, table.concat(args, " "))
end)

function DoScreenHUD(source, type, message)
    local src = source
    if (type == 0 or type == 1) and (message) then
        TriggerClientEvent("3dme:DoScreenHUD", -1, src, type, message)
    end
end