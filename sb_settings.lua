local UIWidgets = {"Gravity weapon state", "Health Bar", "Quit Button", "State & Command Menus", "Keybinds"}

return {
    OnStopEditingUnsynced = function()
        for _, widgetName in ipairs(UIWidgets) do
            _widgetHandler:EnableWidget(widgetName)
        end
    end,

    OnStartEditingUnsynced = function()
        for _, widgetName in ipairs(UIWidgets) do
            local addon = _widgetHandler:FindByName(widgetName)
            _widgetHandler:RemoveWidget(addon)
        end
        Spring.SendCommands("resbar 0")
    end,
}
