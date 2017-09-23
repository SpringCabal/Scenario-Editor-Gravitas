return {
    events = {
        {
            humanName = "Gate opened",
            name = "GATE_OPENED",
            param = "unit",
        },
        {
            humanName = "Gate closed",
            name = "GATE_CLOSED",
            param = "unit",
        },
    },
    functions = {
        {
            humanName = "Electrafi units",
            name = "ELECTRAFI_UNITS",
            output = "unit_array",
            tags = {"Gravitas"},
            execute = function()
                return GG.Electrafi.GetAllElectrafiUnits()
            end
        },
        {
            humanName = "Units in electrafi proximity",
            name = "UNITS_ELECTRAFI_PROXIMITY",
            input = {"unit"},
            output = "unit_array",
            tags = {"Gravitas"},
            execute = function()
                return GG.Electrafi.GetUnitsInProximity(input.unit)
            end
        },
        -- TODO: This function shouldn't exist when Scened meta-programming gets improved
        {
            humanName = "Units in all electrafi proximity",
            name = "UNITS_ALL_ELECTRAFI_PROXIMITY",
            output = "unit_array",
            tags = {"Gravitas"},
            execute = function()
                local units = {}
                for _, elecID in pairs(GG.Electrafi.GetAllElectrafiUnits()) do
                    for _, unitID in pairs(GG.Electrafi.GetUnitsInProximity(elecID)) do
                        table.insert(units, unitID)
                    end
                end
                return units
            end
        },
    },
    actions = {
        {
            humanName = "Link Plate To Gate",
            name = "LINK_PLATE_GATE",
            tags = {"Gravitas"},
            input = {
                {
                    name = "plate",
                    type = "unit",
                },
                {
                    name = "gate",
                    type = "unit",
                },
            },
            execute = function(input)
                GG.Plate.SimpleLink(input.plate, input.gate)
            end
        },
        {
            humanName = "Bitmask Link Plate To Gate",
            name = "BITMASK_LINK_PLATE_GATE",
            tags = {"Gravitas"},
            input = {
                {
                    name = "plate_pos",
                    type = "unit_array",
                },
                {
                    name = "plate_neg",
                    type = "unit_array",
                },
                {
                    name = "gate",
                    type = "unit",
                },
            },
            execute = function(input)
                local bitmask = {}
                for _, unit in pairs(input.plate_pos) do
                    table.insert(bitmask, {unit, true})
                end
                for _, unit in pairs(input.plate_neg) do
                    table.insert(bitmask, {unit, false})
                end
                GG.Plate.BitmaskLink(bitmask, input.gate)
            end
        },
        {
            humanName = "Enable link checks",
            name = "ENABLE_LINK_CHECKS",
            tags = {"Gravitas"},
            execute = function(input)
                GG.Plate.EnableLinkChecks()
            end
        },
        {
            humanName = "Stun units",
            name = "STUN_UNITS",
            input = { "unit_array" },
            tags = {"Gravitas"},
            execute = function(input)
                for _, unitID in pairs(input.unit_array) do
                    local _, maxHealth = Spring.GetUnitHealth(unitID)
                    Spring.SetUnitHealth(unitID, { paralyze = maxHealth * 1.5})
                end
            end
        },
    }
}
