hs.hotkey.bind({ 'cmd' }, 'escape', function()
  local alacritty = hs.application.find('Alacritty')

  if alacritty:isFrontmost() then
    alacritty:hide()

    -- Get all visible windows, ordered from front to back.
    local windows = hs.window.orderedWindows()

    -- If there's at least one other window behind Alacritty...
    if #windows > 1 then
      -- ...focus the second window in the list (the one behind the frontmost).
      windows[2]:focus()
    end
  else
    alacritty:activate()
  end
end)
