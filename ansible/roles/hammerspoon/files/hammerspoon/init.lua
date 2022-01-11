hs.hotkey.bind({'cmd'}, 'escape', function()
  local app = hs.application.find('kitty')
  if app:isFrontmost() then
    app:hide()
  else
    hs.application.launchOrFocus('/Applications/kitty.app')
  end
end)
