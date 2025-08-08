return {
  {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
      { 'nvim-lua/plenary.nvim' },
      {
        'saghen/blink.cmp',
        lazy = false,
        version = '*',
        auto_show = false,
        opts = {
          keymap = {
            preset = 'enter',
            ['<tab>'] = { 'select_next', 'fallback' },
            ['<s-tab>'] = { 'select_prev', 'fallback' },
          },
          cmdline = { sources = { 'cmdline' } },
          sources = {
            default = { 'lsp', 'path', 'buffer', 'codecompanion' },
          },
        },
      },
    },
    opts = {
      --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
      strategies = {
        chat = {
          adapter = 'gemini',
        },
        inline = {
          adapter = 'copilot',
        },
        cmd = {
          adapter = 'copilot',
        }
      },
      adapters = {
        gemini = function()
          return require('codecompanion.adapters').extend('gemini', {
            env = {
              -- Generate API key at https://aistudio.google.com/app/apikey
              api_key = os.getenv('GOOGLE_API_KEY'),
              model = 'gemini-2.5-pro',
            },
          })
        end,
      },
    },
  }
}
