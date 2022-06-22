local modifier = { 'alt' }

-- Window Management -----------------------------------------------------------
hs.window.animationDuration = 0
local function moveFocusedWindow(newWindow)
    local window = hs.window.focusedWindow()
    local frame = window:frame()
    frame.x = newWindow.x
    frame.y = newWindow.y
    frame.w = newWindow.w
    frame.h = newWindow.h
    window:setFrame(frame)
end

hs.hotkey.bind(modifier, 'H', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x,
        y = screenFrame.y,
        w = screenFrame.w / 2,
        h = screenFrame.h }
    moveFocusedWindow(newWindow)
end)

hs.hotkey.bind(modifier, 'L', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x + (screenFrame.w / 2),
        y = screenFrame.y,
        w = screenFrame.w / 2,
        h = screenFrame.h }
    moveFocusedWindow(newWindow)
end)

hs.hotkey.bind(modifier, 'K', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x,
        y = screenFrame.y,
        w = screenFrame.w,
        h = screenFrame.h / 2 }
    moveFocusedWindow(newWindow)
end)

hs.hotkey.bind(modifier, 'J', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x,
        y = screenFrame.y + (screenFrame.h / 2),
        w = screenFrame.w,
        h = screenFrame.h / 2 }
    moveFocusedWindow(newWindow)
end)

-- Upper Left Quadrant
hs.hotkey.bind(modifier, 'Y', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x,
        y = screenFrame.y,
        w = screenFrame.w / 2,
        h = screenFrame.h / 2 }
    moveFocusedWindow(newWindow)
end)

-- Upper Right Quadrant
hs.hotkey.bind(modifier, 'U', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x + (screenFrame.w / 2),
        y = screenFrame.y,
        w = screenFrame.w / 2,
        h = screenFrame.h / 2 }
    moveFocusedWindow(newWindow)
end)

-- Lower Left Quadrant
hs.hotkey.bind(modifier, 'N', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x,
        y = screenFrame.y + (screenFrame.h / 2),
        w = screenFrame.w / 2,
        h = screenFrame.h / 2 }
    moveFocusedWindow(newWindow)
end)

-- Lower Right Quadrant
hs.hotkey.bind(modifier, 'M', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x + (screenFrame.w / 2),
        y = screenFrame.y + (screenFrame.h / 2),
        w = screenFrame.w / 2,
        h = screenFrame.h / 2 }
    moveFocusedWindow(newWindow)
end)

-- Full Screen
hs.hotkey.bind(modifier, 'I', function()
    local screenFrame = hs.window.focusedWindow():screen():frame()
    local newWindow = {
        x = screenFrame.x,
        y = screenFrame.y,
        w = screenFrame.w,
        h = screenFrame.h }
    moveFocusedWindow(newWindow)
end)

-- Application Hotkeys ---------------------------------------------------------
local function open(hotkey, application)
  hs.hotkey.bind(modifier, hotkey, function()
    hs.application.launchOrFocus(application)
  end)
end

open('A', 'Alacritty')
open('S', 'Safari')

-- Menu ------------------------------------------------------------------------
-- local menuModalKey = hs.hotkey.modal.new(modifier, 'O', 'MenuMode')
-- menuModalKey:bind(modifier, 'O', 'Quit MenuMode', function() menuModalKey:exit() end)
local chooser = hs.chooser.new(function(choice)
    if (choice['text'] == 'Sleep') then
        hs.caffeinate.systemSleep()
    end
end)
chooser:choices({
    {
        text = 'Sleep'
    },
})
hs.hotkey.bind({ 'ctrl' }, 'space', function()
    chooser:show()
end)




-- Reload Configuration --------------------------------------------------------
local function reloadConfig(files)
    local doReload = false
    for _, file in pairs(files) do
        if file:sub(-4) == '.lua' then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
local homePath = os.getenv('HOME') .. '/.hammerspoon'
WATCHER = hs.pathwatcher.new(homePath, reloadConfig):start()
hs.alert.show('Config loaded')
