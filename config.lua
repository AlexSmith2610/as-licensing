Config = {}

Config.LicensingJobs = { -- Job that is allowed to access the command/ped
    "mechanic",
    "police"
}

Config.TriggerType = "cmd" -- If cmd it will use a slash command, if ped it will use a spawned ped at the location below:
Config.PedLocation = vector4(426.6, -981.19, 30.71, 83.34) -- MUST be a vector4 coordinate or else it will not work! Ignored if Config.TriggerType = "cmd"

Config.MenuType = "ox" -- If ox it will use the ox_lib menu, if qb then it will use the qb-menu