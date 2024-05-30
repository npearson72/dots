local config = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'tsx', 'typescript' },
    sync_install = false,
    auto_install = false,
    ignore_install = {},

    highlight = {
      enable = false,
      disable = {},
      additional_vim_regex_highlighting = false,
    },
    playground = {
      enable = true,
    }
  })
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      require('nvim-treesitter.install').update({
        with_sync = true
      })
    end,

    dependencies = { 'nvim-treesitter/playground' },
    config = config,
  },
}
