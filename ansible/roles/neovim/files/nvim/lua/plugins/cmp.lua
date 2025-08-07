local config = function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect',
      autocomplete = false,
    },

    sources = cmp.config.sources({
      { name = 'css-variables' },
      { name = 'nvim_lsp' },
    }, {
      { name = 'buffer' },
    }),

    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        maxwidth = 50,
        ellipsis_char = '...',

        -- https://www.nerdfonts.com/cheat-sheet
        symbol_map = {
          Color = '',
          Constructor = '',
          Module = '',
          Snippet = '',
          Variable = '',
        },
      })
    },

    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          return;
        end

        fallback()
      end),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          return
        end

        fallback()
      end),

      ['<C-j>'] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            return
          end

          fallback()
        end,

        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
      ['<C-Space>'] = cmp.mapping.complete(),
    }),
  })

  require('utils.completion_toggle').setup_autocmd()
end

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'npearson72/cmp-css-variables',
      'onsails/lspkind.nvim',
    },
    config = config,
  }
}
