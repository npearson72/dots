local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local cursor_tracker = create_augroup('CursorTracker', { clear = false })

create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter', 'CursorMoved' }, {
  group = cursor_tracker,
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype

    if (ft == 'Avante') then
      vim.opt_local.cursorline = true
    else
      vim.opt_local.cursorcolumn = true
      vim.opt_local.cursorline = true
    end
  end,
})

create_autocmd('WinLeave', {
  group = cursor_tracker,
  pattern = '*',
  callback = function()
    vim.opt_local.cursorcolumn = false
    vim.opt_local.cursorline = false
  end,
})

-- Filetypes

local filetype_group = create_augroup('FileTypeSettings', { clear = true })

create_autocmd('Filetype', {
  group = filetype_group,
  pattern = 'gitcommit',
  command = 'setlocal spell textwidth=80 colorcolumn=80'
})

create_autocmd('Filetype', {
  group = filetype_group,
  pattern = 'css',
  command = 'setlocal commentstring=/*\\ %s\\ */'
})

create_autocmd("FileType", {
  group = filetype_group,
  pattern = 'json',
  callback = function(args)
    if vim.fn.bufname(args.buf) == '.oxlintrc.json' then
      vim.bo[args.buf].filetype = 'jsonc'
    end
  end,
})

create_autocmd("FileType", {
  group = filetype_group,
  pattern = '.*.env.*',
  callback = function(args)
    vim.bo[args.buf].filetype = 'sh'
  end,
})

create_autocmd("FileType", {
  group = filetype_group,
  pattern = 'Jenkinsfile',
  callback = function(args)
    vim.bo[args.buf].filetype = 'groovy'
  end,
})
