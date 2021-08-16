isLoggedIn = false

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    isLoggedIn = true
end)

local banlength = nil
local banreason = 'Unknown'
local kickreason = 'Unknown'
local menu = MenuV:CreateMenu(false, 'Admin Menu', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test')
local menu2 = MenuV:CreateMenu(false, 'Admin Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test1')
local menu4 = MenuV:CreateMenu(false, 'Online Players', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test3')
local menu5 = MenuV:CreateMenu(false, 'Manage Server', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test4')
local menu6 = MenuV:CreateMenu(false, 'Available Weather Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test5')
local menu7 = MenuV:CreateMenu(false, 'Check Current/Add Dealers', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test6')
local menu8 = MenuV:CreateMenu(false, 'Ban', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test7')
local menu9 = MenuV:CreateMenu(false, 'Kick', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test8')
local menu10 = MenuV:CreateMenu(false, 'Permissions', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test9')
local menu11 = MenuV:CreateMenu(false, 'Developer Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test10')
local menu12 = MenuV:CreateMenu(false, 'Vehicle Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv', 'test11')

RegisterNetEvent('qb-admin:client:openMenu')
AddEventHandler('qb-admin:client:openMenu', function()
    MenuV:OpenMenu(menu)
end)

Citizen.CreateThread(function()
	Citizen.Wait(1000)
    while true do
        if isLoggedIn then
        if IsControlPressed(0, 344) and GetLastInputMethod(0) then
            Citizen.Wait(100)
			TriggerServerEvent('qb-admin:checkperm')
        end
        if IsControlJustPressed(0, 121) and GetLastInputMethod(0) then
			TriggerServerEvent('qb-admin:checkperms')
		end
	  	Citizen.Wait(0)
        else
        Citizen.Wait(30000)
        end
    end
end)

RegisterNetEvent('qb-admin:client:toggleNoclip')
AddEventHandler('qb-admin:client:toggleNoclip', function()
    ToggleNoClipMode()
end)

local menu_button = menu:AddButton({
    icon = '😃',
    label = 'Admin Options',
    value = menu2,
    description = 'Misc. Admin Options'
})
local menu_button2 = menu:AddButton({
    icon = '🙍‍♂️',
    label = 'Player Management',
    value = menu4,
    description = 'View List Of Players'
})
local menu_button3 = menu:AddButton({
    icon = '🎮',
    label = 'Server Management',
    value = menu5,
    description = 'Misc. Server Options'
})
local menu_button5 = menu2:AddCheckbox({
    icon = '🎥',
    label = 'NoClip',
    value = menu2,
    description = 'Enable/Disable NoClip'
})
local menu_button6 = menu2:AddButton({
    icon = '🏥',
    label = 'Revive',
    value = menu2,
    description = 'Revive Yourself'
})
local menu_button7 = menu2:AddCheckbox({
    icon = '👻',
    label = 'Invisible',
    value = menu2,
    description = 'Enable/Disable Invisibility'
})
local menu_button8 = menu2:AddCheckbox({
    icon = '⚡',
    label = 'Godmode',
    value = menu2,
    description = 'Enable/Disable God Mode'
})
local menu_button11 = menu5:AddButton({
    icon = '🌡️',
    label = 'Weather Options',
    value = menu6,
    description = 'Change The Weather'
})
local menu_button13 = menu5:AddSlider({
    icon = '⏲️',
    label = 'Server Time',
    value = GetClockHours(),
    values = {{
        label = '00',
        value = '00',
        description = 'Time'
    }, {
        label = '01',
        value = '01',
        description = 'Time'
    }, {
        label = '02',
        value = '02',
        description = 'Time'
    }, {
        label = '03',
        value = '03',
        description = 'Time'
    }, {
        label = '04',
        value = '04',
        description = 'Time'
    }, {
        label = '05',
        value = '05',
        description = 'Time'
    }, {
        label = '06',
        value = '06',
        description = 'Time'
    }, {
        label = '07',
        value = '07',
        description = 'Time'
    }, {
        label = '08',
        value = '08',
        description = 'Time'
    }, {
        label = '09',
        value = '09',
        description = 'Time'
    }, {
        label = '10',
        value = '10',
        description = 'Time'
    }, {
        label = '11',
        value = '11',
        description = 'Time'
    }, {
        label = '12',
        value = '12',
        description = 'Time'
    }, {
        label = '13',
        value = '13',
        description = 'Time'
    }, {
        label = '14',
        value = '14',
        description = 'Time'
    }, {
        label = '15',
        value = '15',
        description = 'Time'
    }, {
        label = '16',
        value = '16',
        description = 'Time'
    }, {
        label = '17',
        value = '17',
        description = 'Time'
    }, {
        label = '18',
        value = '18',
        description = 'Time'
    }, {
        label = '19',
        value = '19',
        description = 'Time'
    }, {
        label = '20',
        value = '20',
        description = 'Time'
    }, {
        label = '21',
        value = '21',
        description = 'Time'
    }, {
        label = '22',
        value = '22',
        description = 'Time'
    }, {
        label = '23',
        value = '23',
        description = 'Time'
    }}
})

menu_button11:On("select",function()
    menu6:ClearItems()
    local elements = {
        [1] = {
            icon = '☀️',
            label = 'Extra Sunny',
            value = "EXTRASUNNY",
            description = 'I\'m Melting!'
        },
        [2] = {
            icon = '☀️',
            label = 'Clear',
            value = "CLEAR",
            description = 'The Perfect Day!'
        },
        [3] = {
            icon = '☀️',
            label = 'Neutral',
            value = "NEUTRAL",
            description = 'Just A Regular Day!'
        },
        [4] = {
            icon = '🌁',
            label = 'Smog',
            value = "SMOG",
            description = 'Smoke Machine!'
        },
        [5] = {
            icon = '🌫️',
            label = 'Foggy',
            value = "FOGGY",
            description = 'Smoke Machine x2!'
        },
        [6] = {
            icon = '⛅',
            label = 'Overcast',
            value = "OVERCAST",
            description = 'Not Too Sunny!'
        },
        [7] = {
            icon = '☁️',
            label = 'Clouds',
            value = "CLOUDS",
            description = 'Where\'s The Sun?'
        },
        [8] = {
            icon = '🌤️',
            label = 'Clearing',
            value = "CLEARING",
            description = 'Clouds Start To Clear!'
        },
        [9] = {
            icon = '☂️',
            label = 'Rain',
            value = "RAIN",
            description = 'Make It Rain!'
        },
       
        [10] = {
            icon = '⛈️',
            label = 'Thunder',
            value = "THUNDER",
            description = 'Run and Hide!'
        },
        [11] = {
            icon = '❄️',
            label = 'Snow',
            value = "SNOW",
            description = 'Is It Cold Out Here?'
        },
        [12] = {
            icon = '🌨️',
            label = 'Blizzard',
            value = "BLIZZARD",
            description = 'Snow Machine?'
        },
        [13] = {
            icon = '❄️',
            label = 'Light Snow',
            value = "SNOWLIGHT",
            description = 'Starting To Feel Like Christmas!'
        },
        [14] = {
            icon = '🌨️',
            label = 'Heavy Snow (XMAS)',
            value = "XMAS",
            description = 'Snowball Fight!'
        },
        [15] = {
            icon = '🎃',
            label = 'Halloween',
            value = "HALLOWEEN",
            description = 'What Was That Noise?!'
        }
    }
    for k,v in ipairs(elements) do
        local menu_button14 = menu6:AddButton({icon = v.icon,label = v.label,value = v,description = v.description,select = function(btn)
            local selection = btn.Value
            TriggerServerEvent('qb-weathersync:server:setWeather', selection.value)
            QBCore.Functions.Notify('Weather Changed To: '..selection.label)
        end})
    end
end)

local menu_button29 = menu7:AddButton({
    icon = '🔌',
    label = 'Existing Dealers',
    value = menu7,
    description = 'Created Dealers'
})
local menu_button30 = menu7:AddButton({
    icon = '➕',
    label = 'Create Dealer',
    value = menu7,
    description = 'Make A New Dealer'
})

local menu_button69 = menu:AddButton({
    icon = '🔧',
    label = 'Developer Options',
    value = menu11,
    description = 'Misc. Dev Options'
})

local menu_button12 = menu:AddButton({
    icon = '🚘',
    label = 'Vehicle Options',
    value = menu12,
    description = 'Misc. Vehicle Options'
})

local coords_button = menu11:AddButton({
    icon = '📋',
    label = 'Copy Coords',
    value = 'coords',
    description = 'Copy Coords To Clipboard'
})
local togglecoords_button = menu11:AddCheckbox({
    icon = '📍',
    label = 'Display Coords',
    value = nil,
    description = 'Show Coords On Screen'
})

local heading_button = menu11:AddButton({
    icon = '📋',
    label = 'Copy Heading',
    value = 'heading',
    description = 'Copy Heading to Clipboard'
})

local noclip_button = menu11:AddCheckbox({
    icon = '🎥',
    label = 'NoClip',
    value = menu11,
    description = 'Enable/Disable NoClip'
})

local deletelazer_button = menu11:AddCheckbox({
    icon = '🔫',
    label = 'Delete Laser',
    value = menu11,
    description = 'Enable/Disable Laser'
})

local vehicledev_button = menu12:AddButton({
    icon = '🚘',
    label = 'Vehicle Dev Mode',
    value = nil,
    description = 'Display Vehicle Information'
})

local maxupgrade_button = menu12:AddButton({
    icon = '🔧',
    label = 'Max Upgrades',
    value = 'maxupgrade',
    description = 'Max Upgrade a vehicle'
})

local repairveh_button = menu12:AddButton({
    icon = '🧰',
    label = 'Repair Vehicle',
    value = 'repairveh',
    description = 'Repair a vehicle'
})

local delveh_button = menu12:AddButton({
    icon = '🧹',
    label = 'Delete Vehicle',
    value = 'delveh',
    description = 'Delete a vehicle'
})

local unlockveh_button = menu12:AddButton({
    icon = '🔑',
    label = 'Unlock Vehicle',
    value = 'unlockveh',
    description = 'Unlock a vehicle'
})

local passenger_button = menu12:AddButton({
    icon = '🚗',
    label = 'Set Passenger',
    value = 'passengerveh',
    description = 'Set Passenger of a Vehicle'
})

local drive_button = menu12:AddButton({
    icon = '🚗',
    label = 'Set Driver',
    value = 'driverveh',
    description = 'Set Driver of a Vehicle'
})

local cleanveh_button = menu12:AddButton({
    icon = '🧽',
    label = 'Clean Vehicle',
    value = 'cleanveh',
    description = 'Clean the Vehicle'
})

local deleteLazer = false
deletelazer_button:On('change', function(item, newValue, oldValue)
    deleteLazer = not deleteLazer
end)

coords_button:On("select", function()
    CopyToClipboard('coords')
end)

heading_button:On("select", function()
    CopyToClipboard('heading')
end)

vehicledev_button:On('change', function()
    vehicleDevMode = not vehicleDevMode
    ToggleVehicleDeveloperMode()
end)

noclip_button:On('change', function(item, newValue, oldValue)
    ToggleNoClipMode()
end)

maxupgrade_button:On("select", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    SetVehicleUndriveable(vehicle,false)
    SetVehicleBodyHealth(vehicle,1000)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleEngineHealth(vehicle, 1000)
    SetVehicleEngineOn( vehicle, true, true )
    SetVehicleFixed(vehicle)
    SetVehicleOnGroundProperly(vehicle)
    SetVehicleGravity(vehicle, true)
    TriggerServerEvent("qb-log:server:CreateLog", "adminlogs", "Admin Repair", "red", GetPlayerName(PlayerId()).." has repaired their vehicle")
end)

repairveh_button:On("select", function()
    SetVehicleModKit(GetVehiclePedIsIn(PlayerPedId(), false), 0)
    SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 11, GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), 11) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 12, GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), 12) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 13, GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), 13) - 1, false)
    SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 15, GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), 15) - 2, false)
    SetVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 16, GetNumVehicleMods(GetVehiclePedIsIn(PlayerPedId(), false), 16) - 1, false)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 17, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 18, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 19, true)
    ToggleVehicleMod(GetVehiclePedIsIn(PlayerPedId(), false), 21, true)
    TriggerServerEvent("qb-log:server:CreateLog", "adminlogs", "Admin Max Upgrades", "red", GetPlayerName(PlayerId()).." has max upgraded their vehicle")
end)

passenger_button:On("select", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if seat == nil then
        seat = 0
    elseif tonumber(seat) == 3 then
        seat = 1
    elseif tonumber(seat) == 4 then
        seat = 2
    end
    if IsVehicleSeatFree(vehicle,seat) then
        SetPedIntoVehicle(PlayerPedId(),vehicle,seat)
    else
        QBCore.Functions.Notify('Vehicle seats are not empty')
    end
end)

drive_button:On("select", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if IsVehicleSeatFree(vehicle,-1) then
        SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
    end
end)

cleanveh_button:On("select", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    SetVehicleDirtLevel(vehicle, 0)
end)

delveh_button:On("select", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    if IsVehicleSeatFree(vehicle,-1) then
        SetPedIntoVehicle(PlayerPedId(),vehicle,-1)
        Citizen.Wait(1000)
        DeleteVehicle(vehicle)
    end
end)

unlockveh_button:On("select", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    SetVehicleDoorsLockedForAllPlayers(vehicle,false)
    SetVehicleDoorsLocked(vehicle, 1)
    PlayVehicleDoorOpenSound(vehicle, 0)
end)


togglecoords_button:On('change', function()
    ToggleShowCoordinates()
end)

-- Player List
menu_button2:On('select', function(item)
    menu4:ClearItems()
    QBCore.Functions.TriggerCallback('test:getplayers', function(players)
        for k, v in pairs(players) do
            local menu_button10 = menu4:AddButton({
                label = 'ID:' .. v["id"] .. ' | ' .. v["name"],
                value = v,
                description = 'Player Name',
                select = function(btn)
                    local select = btn.Value -- get all the values from v!

                    OpenPlayerMenus(select) -- only pass what i select nothing else
                end
            }) -- WORKS
        end
    end)
end)

menu_button13:On("select", function(item, value)
    TriggerServerEvent("qb-weathersync:server:setTime", value, value)
    QBCore.Functions.Notify("Time changed to " .. value .. " hs 00 min")

end)

function OpenPlayerMenus(player)

    local Players = MenuV:CreateMenu(false, player.cid .. ' Options', 'topright', 155, 0, 0, 'size-125', 'none', 'menuv') -- Players Sub Menu
    Players:ClearItems()
    MenuV:OpenMenu(Players)
    local elements = {
        [1] = {
            icon = '💀',
            label = "Kill",
            value = "kill",
            description = "Kill " .. player.cid
        },
        [2] = {
            icon = '🏥',
            label = "Revive",
            value = "revive",
            description = "Revive " .. player.cid
        },
        [3] = {
            icon = '🥶',
            label = "Freeze",
            value = "freeze",
            description = "Freeze " .. player.cid
        },
        [4] = {
            icon = '👀',
            label = "Spectate",
            value = "spectate",
            description = "Spectate " .. player.cid
        },
        [5] = {
            icon = '➡️',
            label = "Go To",
            value = "goto",
            description = "Go to " .. player.cid .. " Position"
        },
        [6] = {
            icon = '⬅️',
            label = "Bring",
            value = "bring",
            description = "Bring " .. player.cid .. " to your position"
        },
        [7] = {
            icon = '🎒',
            label = "Open Inventory",
            value = "inventory",
            description = "Open " .. player.cid .. " inventorys"
        },
        [8] = {
            icon = '👕',
            label = "Give Clothing Menu",
            value = "cloth",
            description = "Give the Cloth menu to " .. player.cid
        },
        [9] = {
            icon = '🥾',
            label = "Kick",
            value = "kick",
            description = "Kick " .. player.cid .. " you need to give a reason"
        },
        [10] = {
            icon = '🚫',
            label = "Ban",
            value = "ban",
            description = "Ban " .. player.cid .. " you need to give a reason"
        },
        [11] = {
            icon = '🎟️',
            label = "Permissions",
            value = "perms",
            description = "Give " .. player.cid .. " Permissions"
        }
    }
    for k, v in ipairs(elements) do
        local menu_button10 = Players:AddButton({
            icon = v.icon,
            label = ' ' .. v.label,
            value = v.value,
            description = v.description,
            select = function(btn)
                local values = btn.Value
                if values ~= "ban" and values ~= "kick" and values ~= "perms" then
                    TriggerServerEvent('qb-admin:server:'..values, player)
                elseif values == "ban" then
                    OpenBanMenu(player)
                elseif values == "kick" then
                    OpenKickMenu(player)
                elseif values == "perms" then
                    OpenPermsMenu(player)
                end
            end
        })
    end
end

function OpenBanMenu(banplayer)
    MenuV:OpenMenu(menu8)
    menu8:ClearItems()
    local menu_button15 = menu8:AddButton({
        icon = '',
        label = 'Reason',
        value = "reason",
        description = 'Ban reason',
        select = function(btn)
            banreason = LocalInput('Ban Reason', 255, 'Reason')
        end
    })

    local menu_button16 = menu8:AddSlider({
        icon = '⏲️',
        label = 'Length',
        value = '3600',
        values = {{
            label = '1 hour',
            value = '3600',
            description = 'Ban Length'
        }, {
            label = '6 hours',
            value ='21600',
            description = 'Ban Length'
        }, {
            label = '12 hours',
            value = '43200',
            description = 'Ban Length'
        }, {
            label = '1 day',
            value = '86400',
            description = 'Ban Length'
        }, {
            label = '3 days',
            value = '259200',
            description = 'Ban Length'
        }, {
            label = '1 week',
            value = '604800',
            description = 'Ban Length'
        }, {
            label = '1 month',
            value = '2678400',
            description = 'Ban Length'
        }, {
            label = '3 months',
            value = '8035200',
            description = 'Ban Length'
        }, {
            label = '6 months',
            value = '16070400',
            description = 'Ban Length'
        }, {
            label = '1 year',
            value = '32140800',
            description = 'Ban Length'
        }, {
            label = 'Permanent',
            value = '99999999999',
            description = 'Ban Length'
        }, {
            label = 'Self',
            value = "self",
            description = 'Ban Length'
        }},
        select = function(btn, newValue, oldValue)
            if newValue == "self" then
                banlength = LocalInputInt('Ban Length', 11, 'Seconds')
            else
                banlength = newValue
            end
        end
    })

    local menu_button17 = menu8:AddButton({
        icon = '',
        label = 'Confirm',
        value = "ban",
        description = 'Confirm the ban',
        select = function(btn)
            if banreason ~= 'Unknown' and banlength ~= nil then
                TriggerServerEvent('qb-admin:server:ban', banplayer, banlength, banreason)
                banreason = 'Unknown'
                banlength = nil
            else
                QBCore.Functions.Notify('You must give a Reason and set a Length for the ban!', 'error')
            end
        end
    })
end

function OpenKickMenu(kickplayer)
    MenuV:OpenMenu(menu9)
    menu9:ClearItems()
    local menu_button19 = menu9:AddButton({
        icon = '',
        label = 'Reason',
        value = "reason",
        description = 'Kick reason',
        select = function(btn)
            kickreason = LocalInput('Kick Reason', 255, 'Reason')
        end
    })

    local menu_button18 = menu9:AddButton({
        icon = '',
        label = 'Confirm',
        value = "kick",
        description = 'Confirm the kick',
        select = function(btn)
            if kickreason ~= 'Unknown' then
                TriggerServerEvent('qb-admin:server:kick', kickplayer, kickreason)
                kickreason = 'Unknown'
            else
                QBCore.Functions.Notify('You must give a reason!', 'error')
            end
        end
    })
end

function OpenPermsMenu(permsply)
    QBCore.Functions.TriggerCallback('qb-admin:server:getrank', function(rank)
        if rank then
            local selectedgroup = 'Unknown'
            MenuV:OpenMenu(menu10)
            menu10:ClearItems()
            local menu_button20 = menu10:AddSlider({
                icon = '',
                label = 'Group',
                value = 'user',
                values = {{
                    label = 'User',
                    value = 'user',
                    description = 'Group'
                }, {
                    label = 'Admin',
                    value = 'admin',
                    description = 'Group'
                }, {
                    label = 'God',
                    value = 'god',
                    description = 'Group'
                }},
                change = function(item, newValue, oldValue)
                    local vcal = newValue
                    if vcal == 1 then
                        selectedgroup = {}
                        table.insert(selectedgroup, {rank = "user", label = "User"})
                    elseif vcal == 2 then
                        selectedgroup = {}
                        table.insert(selectedgroup, {rank = "admin", label = "Admin"})
                    elseif vcal == 3 then
                        selectedgroup = {}
                        table.insert(selectedgroup, {rank = "god", label = "God"})
                    end
                end
            })

            local menu_button21 = menu10:AddButton({
                icon = '',
                label = 'Confirm',
                value = "giveperms",
                description = 'Give the permission group',
                select = function(btn)
                    if selectedgroup ~= 'Unknown' then
                        TriggerServerEvent('qb-admin:server:setPermissions', permsply.id, selectedgroup)
			QBCore.Functions.Notify('Authority group changed!', 'success')
                        selectedgroup = 'Unknown'
                    else
                        QBCore.Functions.Notify('Choose a group!', 'error')
                    end
                end
            })
        else
            MenuV:CloseMenu(menu)
        end
    end)
end

-- Toggle NoClip

menu_button5:On('change', function(item, newValue, oldValue)
    ToggleNoClipMode()
end)

-- Revive Self

menu_button6:On('select', function(item)
    TriggerEvent('hospital:client:Revive', PlayerPedId())
end)

-- Invisible

local invisible = false
menu_button7:On('change', function(item, newValue, oldValue)
    if not invisible then
        invisible = true
        SetEntityVisible(PlayerPedId(), false, 0)
    else
        invisible = false
        SetEntityVisible(PlayerPedId(), true, 0)
    end
end)

-- Godmode

local godmode = false
menu_button8:On('change', function(item, newValue, oldValue)
    godmode = not godmode

    if godmode then
        while godmode do
            Citizen.Wait(0)
            SetPlayerInvincible(PlayerId(), true)
        end
        SetPlayerInvincible(PlayerId(), false)
    end
end)

function RotationToDirection(rotation)
	local adjustedRotation =
	{
		x = (math.pi / 180) * rotation.x,
		y = (math.pi / 180) * rotation.y,
		z = (math.pi / 180) * rotation.z
	}
	local direction =
	{
		x = -math.sin(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		y = math.cos(adjustedRotation.z) * math.abs(math.cos(adjustedRotation.x)),
		z = math.sin(adjustedRotation.x)
	}
	return direction
end

function RayCastGamePlayCamera(distance)
    local cameraRotation = GetGameplayCamRot()
	local cameraCoord = GetGameplayCamCoord()
	local direction = RotationToDirection(cameraRotation)
	local destination =
	{
		x = cameraCoord.x + direction.x * distance,
		y = cameraCoord.y + direction.y * distance,
		z = cameraCoord.z + direction.z * distance
	}
	local a, b, c, d, e = GetShapeTestResult(StartShapeTestRay(cameraCoord.x, cameraCoord.y, cameraCoord.z, destination.x, destination.y, destination.z, -1, PlayerPedId(), 0))
	return b, c, e
end

function DrawEntityBoundingBox(entity, color)
    local model = GetEntityModel(entity)
    local min, max = GetModelDimensions(model)
    local rightVector, forwardVector, upVector, position = GetEntityMatrix(entity)

    -- Calculate size
    local dim =
	{
		x = 0.5*(max.x - min.x),
		y = 0.5*(max.y - min.y),
		z = 0.5*(max.z - min.z)
	}

    local FUR =
    {
		x = position.x + dim.y*rightVector.x + dim.x*forwardVector.x + dim.z*upVector.x,
		y = position.y + dim.y*rightVector.y + dim.x*forwardVector.y + dim.z*upVector.y,
		z = 0
    }

    local FUR_bool, FUR_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    FUR.z = FUR_z
    FUR.z = FUR.z + 2 * dim.z

    local BLL =
    {
        x = position.x - dim.y*rightVector.x - dim.x*forwardVector.x - dim.z*upVector.x,
        y = position.y - dim.y*rightVector.y - dim.x*forwardVector.y - dim.z*upVector.y,
        z = 0
    }
    local BLL_bool, BLL_z = GetGroundZFor_3dCoord(FUR.x, FUR.y, 1000.0, 0)
    BLL.z = BLL_z

    -- DEBUG
    local edge1 = BLL
    local edge5 = FUR

    local edge2 =
    {
        x = edge1.x + 2 * dim.y*rightVector.x,
        y = edge1.y + 2 * dim.y*rightVector.y,
        z = edge1.z + 2 * dim.y*rightVector.z
    }

    local edge3 =
    {
        x = edge2.x + 2 * dim.z*upVector.x,
        y = edge2.y + 2 * dim.z*upVector.y,
        z = edge2.z + 2 * dim.z*upVector.z
    }

    local edge4 =
    {
        x = edge1.x + 2 * dim.z*upVector.x,
        y = edge1.y + 2 * dim.z*upVector.y,
        z = edge1.z + 2 * dim.z*upVector.z
    }

    local edge6 =
    {
        x = edge5.x - 2 * dim.y*rightVector.x,
        y = edge5.y - 2 * dim.y*rightVector.y,
        z = edge5.z - 2 * dim.y*rightVector.z
    }

    local edge7 =
    {
        x = edge6.x - 2 * dim.z*upVector.x,
        y = edge6.y - 2 * dim.z*upVector.y,
        z = edge6.z - 2 * dim.z*upVector.z
    }

    local edge8 =
    {
        x = edge5.x - 2 * dim.z*upVector.x,
        y = edge5.y - 2 * dim.z*upVector.y,
        z = edge5.z - 2 * dim.z*upVector.z
    }

    DrawLine(edge1.x, edge1.y, edge1.z, edge2.x, edge2.y, edge2.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge3.x, edge3.y, edge3.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge4.x, edge4.y, edge4.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
    DrawLine(edge5.x, edge5.y, edge5.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge6.x, edge6.y, edge6.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge7.x, edge7.y, edge7.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge1.x, edge1.y, edge1.z, edge7.x, edge7.y, edge7.z, color.r, color.g, color.b, color.a)
    DrawLine(edge2.x, edge2.y, edge2.z, edge8.x, edge8.y, edge8.z, color.r, color.g, color.b, color.a)
    DrawLine(edge3.x, edge3.y, edge3.z, edge5.x, edge5.y, edge5.z, color.r, color.g, color.b, color.a)
    DrawLine(edge4.x, edge4.y, edge4.z, edge6.x, edge6.y, edge6.z, color.r, color.g, color.b, color.a)
end

Citizen.CreateThread(function()	-- While loop needed for delete lazer
	while true do
        local Wait = 7
        if deleteLazer then
            local color = {r = 255, g = 255, b = 255, a = 200}
            local position = GetEntityCoords(PlayerPedId())
            local hit, coords, entity = RayCastGamePlayCamera(1000.0)
            -- If entity is found then verifie entity
            if hit and (IsEntityAVehicle(entity) or IsEntityAPed(entity) or IsEntityAnObject(entity)) then
                local entityCoord = GetEntityCoords(entity)
                local minimum, maximum = GetModelDimensions(GetEntityModel(entity))
                DrawEntityBoundingBox(entity, color)
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                Draw2DText('Obj: ~b~' .. entity .. '~w~ Model: ~b~' .. GetEntityModel(entity), 4, {255, 255, 255}, 0.4, 0.55, 0.888)
                Draw2DText('If you want to delete the object click on ~g~E', 4, {255, 255, 255}, 0.4, 0.55, 0.888 + 0.025)
                -- When E pressed then remove targeted entity
                if IsControlJustReleased(0, 38) then
                    -- Set as missionEntity so the object can be remove (Even map objects)
                    SetEntityAsMissionEntity(entity, true, true)
                    --SetEntityAsNoLongerNeeded(entity)
                    --RequestNetworkControl(entity)
                    DeleteEntity(entity)
                end
            -- Only draw of not center of map
            elseif coords.x ~= 0.0 and coords.y ~= 0.0 then
                -- Draws line to targeted position
                DrawLine(position.x, position.y, position.z, coords.x, coords.y, coords.z, color.r, color.g, color.b, color.a)
                DrawMarker(28, coords.x, coords.y, coords.z, 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 0.1, 0.1, 0.1, color.r, color.g, color.b, color.a, false, true, 2, nil, nil, false)
            end
        else
            local Wait = 500
        end
        Citizen.Wait(Wait)
	end
end)
