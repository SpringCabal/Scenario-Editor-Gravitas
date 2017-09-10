local UIWidgets = {"Gravity weapon state", "Health Bar", "Quit Button", "State & Command Menus"}

return {
    OnStopEditingUnsynced = function()
        for _, widgetName in ipairs(UIWidgets) do
            -- widgetHandler:EnableWidget(widgetName)
        end
    end,

    OnStartEditingUnsynced = function()
        for _, widgetName in ipairs(UIWidgets) do
            -- widgetHandler:DisableWidget(widgetName)
        end
    end,
}
