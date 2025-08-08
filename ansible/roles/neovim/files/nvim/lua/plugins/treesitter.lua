--[[
  :Inspect to show the highlight groups under the cursor
  :InspectTree to show the parsed syntax tree ('TSPlayground')
  :EditQuery to open the Live Query Editor
]]

local config = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = {
      'css',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
    },

    sync_install = true,
    auto_install = true,

    highlight = {
      enable = false,
      additional_vim_regex_highlighting = false,
    },
  })
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = config
  },
}
