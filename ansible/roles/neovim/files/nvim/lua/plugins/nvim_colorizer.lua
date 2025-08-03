local DEFAULT_OPTIONS = {
  RGB      = true,
  RRGGBB   = true,
  names    = true,
  RRGGBBAA = true,
  rgb_fn   = true,
  hsl_fn   = true,
  css      = true,
  css_fn   = true,
  mode     = 'background'
}

return {
  {
    'norcalli/nvim-colorizer.lua',
    event = 'VeryLazy', -- Load on demand
    config = function()
      require('colorizer').setup({
        '*',
      }, DEFAULT_OPTIONS)
    end
  }
}
