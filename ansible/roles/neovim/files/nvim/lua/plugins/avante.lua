return {
  {
    'yetone/avante.nvim',
    build = 'make',
    event = 'VeryLazy',
    version = false, -- Never set this value to '*'! Never!
    opts = {
      file_selector = {
        provider = 'telescope'
      },
      input = {
        provider = 'telescrop',
        provider_opts = {
          title = 'Avante Input',
          icon = ' ',
        },
      },
      provider = 'copilot',
      providers = {
        copilot = {
          model = 'copilot/gpt-5',
        },
        gemini = {
          endpoint = 'https://api.gemini.cohere.com/v1/generate',
          model = 'gemini-1.5-pro',
        }
      },
    },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below dependencies are optional,
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-tree/nvim-web-devicons',
      -- {
      --   -- Make sure to set this up properly if you have lazy=true
      --   'MeanderingProgrammer/render-markdown.nvim',
      --   opts = {
      --     file_types = { "markdown", "Avante" },
      --   },
      --   ft = { "markdown", "Avante" },
      -- },
    },
  }
}
