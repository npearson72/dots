local config = function()
  ------------------------------------
  -- Globals
  ------------------------------------
  vim.g.coc_global_extensions = {
    '@yaegassy/coc-volar',
    'coc-css',
    'coc-deno',
    'coc-emmet',
    'coc-emoji',
    'coc-eslint',
    'coc-explorer',
    'coc-git',
    'coc-highlight',
    'coc-html',
    'coc-json',
    'coc-prettier',
    'coc-pretty-ts-errors',
    'coc-prisma',
    'coc-snippets',
    'coc-solargraph',
    'coc-styled-components',
    'coc-sumneko-lua',
    'coc-tsserver',
  }

  vim.g.coc_config_home = vim.env.HOME .. '/.config/nvim'

  ------------------------------------
  -- Options
  ------------------------------------
  vim.opt.updatetime = 300
  vim.opt.signcolumn = 'yes'

  ------------------------------------
  -- Functions
  ------------------------------------
  local function show_docs()
    local cw = vim.fn.expand('<cword>')

    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
  end

  local organize_imports = function()
    vim.fn.CocAction('runCommand', 'editor.action.organizeImport')
    vim.fn.CocAction('runCommand', 'prettier.formatFile')
    vim.cmd('write')
  end

  function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
  end

  function _G.copilot_exists()
    return vim.fn.exists('b:_copilot.suggestions')
  end

  ------------------------------------
  -- Commands
  ------------------------------------
  vim.api.nvim_create_user_command(
    "Prettier", "call CocActionAsync('runCommand', 'prettier.forceFormatDocument')", { nargs = 0 }
  )

  vim.api.nvim_create_user_command('OrganizeImports', organize_imports, { nargs = 0 })

  ------------------------------------
  -- Mappings
  ------------------------------------

  -- Autocomplete
  local opts = {
    silent = true,
    noremap = true,
    expr = true,
    replace_keycodes = false
  }

  vim.keymap.set(
    'i',
    '<tab>',
    [[coc#pum#visible() ? coc#pum#next(1) : v:lua.copilot_exists() ? "\<tab>" : v:lua.check_back_space() ? "\<tab>" : coc#refresh()]],
    opts
  )

  vim.keymap.set(
    'i',
    '<s-tab>',
    [[coc#pum#visible() ? coc#pum#prev(1) : "\<c-h>"]],
    opts
  )

  vim.keymap.set(
    'i',
    '<c-j>',
    [[coc#pum#visible() ? coc#pum#confirm() : "\<c-g>u\<cr>\<c-r>=coc#on_enter()\<cr>"]],
    opts
  )

  -- Scroll in floating window
  vim.keymap.set(
    'n',
    '<down>',
    [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<c-f>"]],
    { silent = true, nowait = true, expr = true }
  )

  vim.keymap.set(
    'n',
    '<up>',
    [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<c-b>"]],
    { silent = true, nowait = true, expr = true }
  )

  -- Other settings
  vim.keymap.set('i', '<c-k>', 'coc#refresh()', { silent = true, expr = true })

  vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', { silent = true })
  vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
  vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
  vim.keymap.set('n', 'gr', '<Plug>(coc-references)', { silent = true })

  vim.keymap.set('n', '<leader>d', show_docs, { silent = true })
  vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction)', {
    silent = true,
    nowait = true
  })

  vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

  vim.keymap.set('n', '<leader>c', '<cmd>CocCommand editor.action.pickColor<cr>', { silent = true })
  vim.keymap.set('n', '<leader>cc', '<cmd>CocCommand editor.action.colorPresentation<cr>', { silent = true })

  -- Coc Explorer
  vim.keymap.set('n', '<leader>e', '<cmd>CocCommand explorer<cr>', {
    silent = true
  })

  -- Nofifications
  require('utils.coc_notifications').setup()
end

return {
  {
    'neoclide/coc.nvim',
    branch = 'release',
    config = config
  }
}
