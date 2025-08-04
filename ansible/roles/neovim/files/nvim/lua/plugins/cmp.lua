local config = function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local luasnip = require('luasnip')

  cmp.setup({
    completion = {
      completeopt = 'menu,menuone,noinsert,noselect',
      autocomplete = false,
    },

    sources = cmp.config.sources({
      { name = 'css-variables' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
    }),

    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol_text',
        maxwidth = 50,
        ellipsis_char = '...',
      })
    },

    mapping = cmp.mapping.preset.insert({
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
          return
        end

        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
          return
        end

        fallback()
      end, { 'i', 's' }),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
          return
        end

        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
          return
        end

        fallback()
      end, { 'i', 's' }),

      ['<C-j>'] = cmp.mapping({
        i = function(fallback)
          -- if cmp.visible() and cmp.select_next_item({ behavior = cmp.ConfirmBehavior.Replace }) then
          --   return
          -- end

          -- if luasnip.jumpable() then
          --   luasnip.jump()
          --   return
          -- end

          fallback()
        end,

        s = function(fallback)
          -- if luasnip.jumpable() then
          --   luasnip.jump()
          --   return
          -- end

          fallback()
        end,
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
      'onsails/lspkind.nvim',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'npearson72/cmp-css-variables',
    },
    config = config,
    event = 'InsertEnter',
  }
}
