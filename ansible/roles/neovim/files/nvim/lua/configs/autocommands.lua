local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd

local group = create_augroup('CursorTracker', { clear = false })

create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter', 'CursorMoved' }, {
  group = group,
  pattern = '*',
  command = 'setlocal cursorcolumn cursorline'
})

create_autocmd('WinLeave', {
  group = group,
  pattern = '*',
  command = 'setlocal nocursorcolumn nocursorline'
})


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
