--[[
  :Inspect to show the highlight groups under the cursor
  :InspectTree to show the parsed syntax tree ("TSPlayground")
  :EditQuery to open the Live Query Editor
]]

local config = function()
  require('nvim-treesitter.configs').setup({
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
    build = function()
      require('nvim-treesitter.install').update({
        with_sync = true
      })
    end,

    config = config,
  },
}
