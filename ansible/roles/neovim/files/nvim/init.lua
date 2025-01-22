local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local lazy_lock_path = vim.fn.stdpath("data") .. "/lazy/lazy-lock.json"

if not (vim.uv or vim.loop).fs_stat(lazy_path) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazy_path,
  })
end

vim.opt.rtp:prepend(lazy_path)

-- Make sure to set `mapleader` before lazy so mappings are correct
vim.g.mapleader = ','

require('lazy').setup({
  { import = "plugins" },
  'sheerun/vim-polyglot',
  'tpope/vim-commentary',
  'tpope/vim-endwise',
  'tpope/vim-projectionist',
  'tpope/vim-surround',
  'tpope/vim-fugitive',
  'vim-scripts/greplace.vim',
}, {
  change_detection = { enabled = false },
  lockfile = lazy_lock_path
})

require('configs/mappings')
require('configs/settings')
require('configs/autocommands')
require('configs/filetypes')
require('configs/visuals')

require('functions/relative_numbers')
require('functions/zoom')
