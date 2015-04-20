return {
    actions = {
        {
            humanName = "Link Plate To Gate",
            name = "LINK_PLATE_GATE",
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
            execute = function(input)
                GG.Plate.EnableLinkChecks()
            end
        },
    }
}
