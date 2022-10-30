RegisterServerEvent('bberry:addDollars')
AddEventHandler('bberry:addDollars', function()			
 local _source = source
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		if user ~= nil then
			user.addMoney(100)
		end
	end)			
end)

RegisterServerEvent('wmenu:kick')
AddEventHandler('wmenu:kick', function(selectedPlayer)
  local _source = source
    TriggerEvent('redemrp:getPlayerFromId', source, function(user)
        DropPlayer(selectedPlayer, ' You have been kicked by an Admin - Please open a MOD Ticket in Discord for more Info')
    end)
end)

RegisterServerEvent('bberry:checkgroup')
AddEventHandler('bberry:checkgroup', function()
 local _source = source
	TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
		if user ~= nil then
			user.getGroup()
			if user.getGroup() == 'modo' or user.getGroup() == 'admin' or user.getGroup() == 'superadmin' then
			TriggerClientEvent('bberry:menu', source)
			end
		end
	end) 
end)
