local QBCore = exports['qb-core']:GetCoreObject()

QBCore = nil
local ragdoll = false

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('qb-core', function(obj) QBCore = obj end)
        Wait(0)
    end
end)

local blips = {
    {title="Sex Shop", colour=48, id=188, x = -175.01593017578, y = 230.1903613281, z = 88.0590311050415},
}

Citizen.CreateThread(function()

for _, info in pairs(blips) do
  info.blip = AddBlipForCoord(info.x, info.y, info.z)
  SetBlipSprite(info.blip, info.id)
  SetBlipDisplay(info.blip, 4)
  SetBlipScale(info.blip, 0.9)
  SetBlipColour(info.blip, info.colour)
  SetBlipAsShortRange(info.blip, true)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(info.title)
  EndTextCommandSetBlipName(info.blip)
end
end)

RegisterNetEvent('scully:org')
AddEventHandler('scully:org', function()   
TriggerEvent("scully:black")
TriggerEvent("Ragdoll")
	Wait(1000)
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.9, 'stupid1', 0.6)
	Wait(5000)
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.9, 'stupid', 0.6)
	Wait(3000)
TriggerEvent("pNotify:SendNotification", {text = "You just had an orgasm", type = "error", timeout = 2400, layout = "centerLeft"})
	Wait(1000)
TriggerEvent("Ragdoll")
end)

RegisterNetEvent('scully:org2')
AddEventHandler('scully:org2', function()   
   TriggerEvent("scully:black")
TriggerEvent("Ragdoll")
	Wait(1000)
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.9, 'stupid2', 0.6)
	Wait(5000)
TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 0.9, 'stupid', 0.6)
	Wait(3000)
TriggerEvent("pNotify:SendNotification", {text = "You just had an orgasm", type = "error", timeout = 2400, layout = "centerLeft"})
	Wait(1000)
TriggerEvent("Ragdoll")
end)

RegisterNetEvent('scully:black')
AddEventHandler('scully:black', function()
   DoScreenFadeOut(100)
   while not IsScreenFadedOut() do
		Wait(0)
   end
		Wait(8000)
   DoScreenFadeIn(250)
end)

function setRagdoll(flag)
ragdoll = flag
end
Citizen.CreateThread(function()
  while true do
    Wait(0)
    if ragdoll then
      SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
    end
  end
end)

orgasm = true
RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
if ( orgasm ) then
	setRagdoll(true)
	orgasm = false
else
	setRagdoll(false)
	orgasm = true
    end
end)
