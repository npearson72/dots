local alacrittyApp = hs.application.find('Alacritty')
local lastFocusedWindow = nil

-- This watcher is slightly improved to be more reliable.
-- It checks that the window is a "standard" window, preventing it
-- from saving palettes or other non-window UI elements.
local windowWatcher = hs.window.filter.new(false)
windowWatcher:subscribe(hs.window.filter.windowFocused, function(window, appName)
  -- We only care about standard windows that are not from Alacritty
  if window:isStandard() and appName ~= "Alacritty" then
    lastFocusedWindow = window
  end
end)

hs.hotkey.bind({ 'cmd' }, 'escape', function()
  if not alacrittyApp then
    -- Attempt to find it again in case it was launched after Hammerspoon started
    alacrittyApp = hs.application.find('Alacritty')
    if not alacrittyApp then return end
  end

  if alacrittyApp:isFrontmost() then
    alacrittyApp:hide()

    -- Wait a tiny moment for the OS to finish its "hide" animation
    -- before we try to change the focus ourselves. This prevents the race condition.
    hs.timer.doAfter(0.1, function()
      if lastFocusedWindow and not lastFocusedWindow:isDestroyed() and lastFocusedWindow:application():isRunning() then
        lastFocusedWindow:focus()
      end
    end)
  else
    -- The watcher has already saved our last window, so we just need to activate Alacritty.
    alacrittyApp:activate()
  end
end)
