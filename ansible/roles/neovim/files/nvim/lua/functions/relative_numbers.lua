vim.api.nvim_create_user_command(
  'ToggleRelativeLineNumbers',
  function(params)
    if vim.bo.filetype ~= 'coc-explorer' then
      if params.args == 'on' then
        vim.opt.number = false
        vim.opt.relativenumber = true
      else
        vim.opt.number = true
        vim.opt.relativenumber = false
      end
    end
  end,
  { nargs = '*' }
)

vim.keymap.set('n', 'v', 'v:<c-u>ToggleRelativeLineNumbers on<cr>gv', {
  silent = true
})

vim.keymap.set('n', 'V', 'V0:<c-u>ToggleRelativeLineNumbers on<cr>gv', {
  silent = true
})

vim.keymap.set('n', '<c-v>', '<c-v>:<c-u>ToggleRelativeLineNumbers on<cr>gv', {
  silent = true
})

vim.keymap.set('', '<esc>', '<esc>:ToggleRelativeLineNumbers off<cr>', {
  silent = true,
  noremap = true
})

vim.cmd([[
augroup ToggleRelativeLineNumbersOff
  autocmd!
  autocmd InsertEnter,TextYankPost,CmdlineLeave * ToggleRelativeLineNumbers off
augroup END
]])
