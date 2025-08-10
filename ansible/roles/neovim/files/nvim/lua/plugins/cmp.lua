local config = function()
  local cmp = require('cmp')
  local lspkind = require('lspkind')

  cmp.setup({
    enabled = false,
    formatting = {
      format = lspkind.cmp_format({
        mode = 'symbol',
        ellipsis_char = '...',
        symbol_map = {
          Function = 'f',
          Module = 'm',
          Snippet = '',
          Variable = 'v',
        },
      })
    },
    mapping = cmp.mapping({
      ['<tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end),

      ['<s-tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end),


      ['<c-j>'] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,

        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),

      ['<c-space>'] = cmp.mapping.complete(),
    }),
  })


  local base_sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })


  vim.api.nvim_create_autocmd({ 'BufAdd', 'BufNew', 'BufEnter' }, {
    pattern = '*',
    callback = function()
      local current_filetype = vim.bo.filetype

      if (current_filetype ~= "codecompanion") then
        return
      end

      local sources = base_sources

      sources[#sources + 1] = { name = 'codecompanion' }

      cmp.setup.buffer({
        enabled = current_filetype == "codecompanion",
      })
    end,
  })

  vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    pattern = "*.css",
    callback = function()
      local sources = base_sources

      sources[#sources + 1] = { name = 'css-variables' }

      cmp.setup.buffer({
        completion = {
          completeopt = 'menu,menuone,noinsert,noselect',
          autocomplete = false,
        },
        enabled = true,
        sources = sources,
      })

      cmp.event:on('menu_opened', function()
        vim.api.nvim_eval('coc#pum#close()')
        vim.b.coc_suggest_disable = 1
      end)

      cmp.event:on('menu_closed', function()
        vim.b.coc_suggest_disable = nil
      end)

      require('utils.coc_cmp_swap').setup()
    end,
  })
end

return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      -- To make cmp-css-variables work, add a .nvim.lua file to your project
      -- root with a pointer to the CSS files containing variables
      -- Ex: vim.g.css_variables_files = { "node_modules/example/styles.css" }
      'npearson72/cmp-css-variables',
      'onsails/lspkind.nvim',
    },
    config = config,
  }
}
