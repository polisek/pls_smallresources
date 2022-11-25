RegisterNetEvent('pls:client:medicbaguse')
AddEventHandler('pls:client:medicbaguse', function()
    local count = exports.ox_inventory:Search('count', 'medicbag')
    if count >= 1 then
        if not IsPedDeadOrDying(PlayerPedId()) then
            local player, playerPed, playerCoords = lib.getClosestPlayer(GetEntityCoords(PlayerPedId()), 8.0)
            if playerPed ~= PlayerPedId() and playerPed ~= nil then
                if IsPedDeadOrDying(playerPed) then
                    if lib.progressBar({
                        duration = 5000,
                        label = 'Ošetřuješ..',
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                        },
                        anim = {
                            dict = 'mini@cpr@char_a@cpr_str',
                            clip = 'cpr_pumpchest' 
                        },
                    }) then 
                        TriggerServerEvent("pls_mb:server:revive",GetPlayerServerId(player))
                    else 
                        print("Přestal oživovat..")
                    end
                else
                    lib.notify({
                        title = 'Medic bag',
                        description = 'Vypadá to, že neumírá..',
                        type = 'error'
                    })
                end
            else
                lib.notify({
                    title = 'Medic bag',
                    description = 'Nikdo poblíž..',
                    type = 'error'
                })
            end
        end
    end
end)
