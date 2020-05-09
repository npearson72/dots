hs.hotkey.bind({'cmd'}, 'escape', function()
  local alacritty = hs.application.find('Alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus('/Applications/Alacritty.app')
  end
end)
