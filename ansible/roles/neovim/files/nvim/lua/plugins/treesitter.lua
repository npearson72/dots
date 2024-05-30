local config = function()
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query' },
    sync_install = false,
    auto_install = true,
    ignore_install = {
      'dockerfile',
      'javascript',
      'json',
      'jsonc',
      'ruby',
      'tmux',
      'tsx',
      'typescript',
      'yaml'
    },

    highlight = {
      enable = true,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    playground = {
      enable = true,
    }
  }
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,

    dependencies = { 'nvim-treesitter/playground' },
    config = config,
  },
}
