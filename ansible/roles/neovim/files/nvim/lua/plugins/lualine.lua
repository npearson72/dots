local config = function()
  local colors = {
    black      = '#262626',
    light_gray = '#767676',
    dark_gray  = '#424242',
    orange     = '#d75f5f',
    red        = '#c30771',
  }

  local pencil_dark = {
    normal = {
      a = { fg = colors.light_gray, bg = colors.black },
      b = { fg = colors.light_gray, bg = colors.black },
      c = { fg = colors.light_gray, bg = colors.black },
    },

    inactive = {
      a = { fg = colors.dark_gray, bg = colors.black },
      b = { fg = colors.dark_gray, bg = colors.black },
      c = { fg = colors.dark_gray, bg = colors.black },
    },
  }

  local relativepath = {
    'filename',
    path = 1,
    symbols = {
      readonly = ''
    }
  }

  local diagnostics = {
    'diagnostics',
    sources = { 'nvim_diagnostic', 'coc' },
    sections = { 'error', 'warn' },
    diagnostics_color = {
      error = { fg = colors.black, bg = colors.red },
      warn = { fg = colors.black, bg = colors.orange },
    },
    symbols = { error = 'E', warn = 'W' },
    colored = true,
    update_in_insert = false,
    always_visible = false,
  }

  local function position()
    return [[%l/%L:%c  %p%%]]
  end

  require('lualine').setup({
    options = {
      theme = pencil_dark,
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = { relativepath },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = { { "fileformat", symbols = { unix = "" } }, 'fileencoding', 'filetype', position },
      lualine_z = { diagnostics },
    },
    inactive_sections = {
      lualine_a = { relativepath },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { diagnostics },
    },
    tabline = {},
    extensions = {},
  })
end

return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = config
  },
}
