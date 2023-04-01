-- Default Modifier ------------------------------------------------------------
local function bind(key, callback)
    local modifier = {'alt'}
    hs.hotkey.bind(modifier, key, callback)
end

-- Vim Mode in Safari
local lastMode = nil
local currentMode = nil
local operatorPendingMode = hs.hotkey.modal.new()
local insertMode = hs.hotkey.modal.new()
local safariMode = hs.hotkey.modal.new()

local modeItem = hs.menubar.new()
local function setMode()
    if currentMode == safariMode then
        modeItem:setTitle('N')
    elseif currentMode == insertMode then
        modeItem:setTitle('I')
    elseif currentMode == operatorPendingMode then
        modeItem:setTitle('P')
    else
        modeItem:setTitle('')
    end
end

-- Go to top of page
operatorPendingMode:bind({}, 'g', function()
    hs.eventtap.keyStroke({'cmd'}, 'up')
    currentMode = lastMode
    setMode()
    operatorPendingMode:exit()
    currentMode:enter()
end)

-- Go to next tab
operatorPendingMode:bind({}, 't', function()
    hs.eventtap.keyStroke({'cmd', 'shift'}, 'right')
    currentMode = lastMode
    setMode()
    operatorPendingMode:exit()
    currentMode:enter()
end)

-- Go to previous tab
operatorPendingMode:bind({'shift'}, 'T', function()
    hs.eventtap.keyStroke({'cmd', 'shift'}, 'left')
    currentMode = lastMode
    setMode()
    operatorPendingMode:exit()
    currentMode:enter()
end)

-- Exit Insert Mode
insertMode:bind('ctrl', '[', function()
    lastMode = currentMode
    currentMode = safariMode
    setMode()
    lastMode:exit()
    currentMode:enter()
end)

-- Enter Operator Pending Mode
safariMode:bind({}, 'g', function()
    lastMode = currentMode
    currentMode = operatorPendingMode
    setMode()
    lastMode:exit()
    currentMode:enter()
end)

-- Enter Insert Mode
safariMode:bind({}, 'i', function()
    lastMode = currentMode
    currentMode = insertMode
    setMode()
    lastMode:exit()
    currentMode:enter()
end)

-- Go to bottom of page
safariMode:bind({'shift'}, 'G', function()
    hs.eventtap.keyStroke({'cmd'}, 'down')
end)

local function appWatcher(app, eventType)
    if (eventType == hs.application.watcher.activated) then
        if app == 'Safari' then
            if currentMode == nil then
                currentMode = safariMode
            end
            setMode()
            currentMode:enter()
        end
    elseif eventType == hs.application.watcher.deactivated then
        if app == 'Safari' then
            lastMode = currentMode
            currentMode = nil
            setMode()
            lastMode:exit()
        end
    end
end
hs.application.watcher.new(appWatcher):start()

-- Window Management -----------------------------------------------------------
hs.window.animationDuration = 0

local function moveWindow(key, window)
    bind(key, function()
        local currentWindow = hs.window.focusedWindow()
        currentWindow:moveToUnit(window)
    end)
end

local keyToWindow = {
    H = { 'leftHalf', {0, 0, 0.5, 1} },
    L = { 'rightHalf', {0.5, 0, 0.5, 1} },
    K = { 'topHalf', {0, 0, 1, 0.5} },
    J = { 'bottomHalf', {0, 0.5, 1, 0.5} },
    Y = { 'upperLeft', {0, 0, 0.5, 0.5} },
    U = { 'upperRight', {0.5, 0, 0.5, 0.5} },
    N = { 'lowerLeft', {0, 0.5, 0.5, 0.5} },
    M = { 'lowerRight', {0.5, 0.5, 0.5, 0.5} },
    I = { 'full', {0, 0, 1, 1} },
}

for key, window in pairs(keyToWindow) do
    moveWindow(key, window[2])
end

-- Application Hotkeys ---------------------------------------------------------
local function open(key, application)
  bind(key, function()
    hs.application.launchOrFocus(application)
  end)
end

local keyToApp = {
    D = 'Alacritty',
    F = { 'Safari', 'Google Chrome' },
    S = { 'Discord', 'Slack' },
    A = 'Preview',
}

for key, app in pairs(keyToApp) do
    if type(app) == 'table' then
        local user = os.getenv('USER')
        app = user == 'neuan' and app[1] or app[2]
    end
    open(key, app)
end

-- Menu ------------------------------------------------------------------------
-- local menuModalKey = hs.hotkey.modal.new(modifier, 'O', 'MenuMode')
-- menuModalKey:bind(modifier, 'O', 'Quit MenuMode', function() menuModalKey:exit() end)
local chooser = hs.chooser.new(function(choice)
    if choice['text'] == 'Sleep' then
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
hs.pathwatcher.new(homePath, reloadConfig):start()
hs.alert.show('Config loaded')
