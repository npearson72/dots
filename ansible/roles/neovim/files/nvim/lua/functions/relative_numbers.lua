local create_augroup = vim.api.nvim_create_augroup
local create_autocmd = vim.api.nvim_create_autocmd
local create_user_command = vim.api.nvim_create_user_command

local command_name = 'ToggleRelativeLineNumbers'

create_user_command(
  command_name,
  function(params)
    if not (
          vim.bo.filetype == 'coc-explorer' or
          vim.bo.filetype == 'TelescopePrompt'
        ) then
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

create_autocmd({ 'InsertEnter', 'TextYankPost', 'CmdlineLeave' }, {
  group = create_augroup('CursorTracker', { clear = false }),
  pattern = '*',
  command = command_name .. ' off'
})

vim.keymap.set('n', 'v', 'v:<c-u>' .. command_name .. ' on<cr>gv', {
  silent = true
})

vim.keymap.set('n', 'V', 'V0:<c-u>' .. command_name .. ' on<cr>gv', {
  silent = true
})

vim.keymap.set('n', '<c-v>', '<c-v>:<c-u>' .. command_name .. ' on<cr>gv', {
  silent = true
})

vim.keymap.set('', '<esc>', '<esc>:' .. command_name .. ' off<cr>', {
  silent = true,
  noremap = true
})
