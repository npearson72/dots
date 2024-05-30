--[[
  :Inspect to show the highlight groups under the cursor
  :InspectTree to show the parsed syntax tree ("TSPlayground")
  :EditQuery to open the Live Query Editor
]]

local config = function()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua' },
    sync_install = false,
    auto_install = false,
    ignore_install = {},

    highlight = {
      enable = true,
      disable = { 'bash' },
      additional_vim_regex_highlighting = false,
    },
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

    config = config,
  },
}
