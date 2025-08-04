------------------------------------
-- Globals
------------------------------------
vim.g.python_host_prog = vim.env.HOME .. '/.venv/bin/python'
vim.g.python3_host_prog = vim.env.HOME .. '/.venv/bin/python3'

------------------------------------
-- Options
------------------------------------
vim.opt.autoindent = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.completeopt = 'longest,menuone,preview'
vim.opt.exrc = true
vim.opt.history = 1000
vim.opt.iskeyword:append('-')
vim.opt.mouse = ""
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.backupdir = vim.env.XDG_DATA_HOME .. '/nvim/backup//'
vim.opt.backup = true
vim.opt.numberwidth = 1 -- Reduce width of number line
vim.opt.smartindent = true
vim.opt.scrolloff = 3
vim.opt.showbreak = '↪'
vim.opt.visualbell = true
