RegisterNetEvent('pls_mb:server:revive')
AddEventHandler('pls_mb:server:revive', function(serverid)
    exports.ox_inventory:RemoveItem(source,"medicbag",1)
    if GetResourceState("es_extended") == "started" then
        TriggerClientEvent('esx_ambulancejob:revive',  serverid)
    elseif GetResourceState("qb-core") == "started" then
        TriggerClientEvent('hospital:client:Revive', serverid)
    end
end)
 
