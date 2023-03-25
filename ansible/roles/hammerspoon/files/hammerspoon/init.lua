hs.hotkey.bind({'cmd'}, 'escape', function()
  local app = hs.application.find('Alacritty')
  if app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus('/Applications/Alacritty.app')
  end
end)
