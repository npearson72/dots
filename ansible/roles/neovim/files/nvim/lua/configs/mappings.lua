-- Movement
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<s-j>', '<c-d>')
vim.keymap.set('n', '<s-k>', '<c-u>')
vim.keymap.set('n', '<c-j>', '}')
vim.keymap.set('n', '<c-k>', '{')
vim.keymap.set('n', '<c-h>', '^')
vim.keymap.set('n', '<c-l>', '$')
vim.keymap.set('v', '<c-h>', '^')
vim.keymap.set('v', '<c-l>', '$')

-- Windows
vim.keymap.set('n', 'wl', '<c-w>l')
vim.keymap.set('n', 'wh', '<c-w>h')
vim.keymap.set('n', 'wj', '<c-w>j')
vim.keymap.set('n', 'wk', '<c-w>k')
vim.keymap.set('n', 'w=', '<c-w>=')
vim.keymap.set('n', 'wL', '<c-w>L')
vim.keymap.set('n', 'wH', '<c-w>H')
vim.keymap.set('n', 'wJ', '<c-w>J')
vim.keymap.set('n', 'wK', '<c-w>K')
vim.keymap.set('n', 'ws', '<c-w>x')
vim.keymap.set('n', 'wr', '<c-w>r')
vim.keymap.set('n', 'wR', '<c-w>R')

-- Select all
vim.keymap.set('n', '<c-a>', 'ggVG')

-- Remove search highlight
vim.keymap.set('n', '<leader><space>', ':noh<cr>', { silent = true })

-- Copy & paste to clipboard
vim.keymap.set('v', '<leader>y', '"*y')
vim.keymap.set('n', '<leader>p', '"*p')

-- Tabs
-- vim.keymap.set('n', 't', '<esc>:tabnew<cr>')
-- vim.keymap.set('n', 'T', '<esc><c-w>T')
vim.keymap.set('n', '{', '<esc>gT')
vim.keymap.set('n', '}', '<esc>gt')

-- Drag block left/right/up/down
vim.keymap.set('v', '<s-l>', '>gv')
vim.keymap.set('v', '<s-h>', '<gv')
vim.keymap.set('v', '<s-j>', ':m\'>+<cr>gv')
vim.keymap.set('v', '<s-k>', ':m-2<cr>gv')

-- Keep search matches in the middle of the window
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Do not yank text when pasting on top of it
vim.keymap.set('x', 'p', 'P')

-- Modify command line cursor movement
vim.keymap.set('c', '<c-a>', '<home>')
vim.keymap.set('c', '<c-e>', '<end>')

-- Folding
vim.keymap.set('n', '<space>', [[@=(foldlevel('.') ? 'za' : "\<space>")<cr>]], {
  silent = true
})
vim.keymap.set('v', '<space>', "zf", { silent = true })
