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

create_autocmd('Filetype', {
  pattern = 'gitcommit',
  command = 'setlocal spell textwidth=80 colorcolumn=80'
})
