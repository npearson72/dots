return {
  {
    'olimorris/codecompanion.nvim',
    event = 'VeryLazy',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
      { 'nvim-lua/plenary.nvim' },
    },

    --Refer to: https://github.com/olimorris/codecompanion.nvim/blob/main/lua/codecompanion/config.lua
    opts = {
      strategies = {
        chat = {
          opts = {
            completion_provider = "cmp"
          },
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
