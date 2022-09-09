local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('dildo', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('scully:org', source)
end)

QBCore.Functions.CreateUseableItem('dildo2', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
		if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
	TriggerClientEvent('scully:org2', source)
end)
