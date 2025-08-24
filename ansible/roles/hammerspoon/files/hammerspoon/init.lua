local lastFocusedWindow = nil

hs.hotkey.bind({ 'cmd' }, 'escape', function()
  local alacritty = hs.application.find('Alacritty')

  if not alacritty then
    return
  end

  if alacritty:isFrontmost() then
    if lastFocusedWindow and lastFocusedWindow:application() and lastFocusedWindow:application():isRunning() then
      lastFocusedWindow:focus()
    end

    alacritty:hide()
  else
    lastFocusedWindow = hs.window.focusedWindow()

    alacritty:activate()
  end
end)
