local M = {}

local function check_cmp_should_be_active()
  local cmp = require('cmp')
  local current_filetype = vim.bo.filetype

  if current_filetype ~= "css" then
    return false
  end

  local cursor_line = vim.api.nvim_get_current_line()
  local cursor_col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local text_before_cursor = string.sub(cursor_line, 1, cursor_col - 1)

  -- When using cmp, disable coc.nvim's completion
  cmp.event:on('menu_opened', function()
    vim.api.nvim_eval('coc#pum#close()')
    vim.b.coc_suggest_disable = 1
  end)

  cmp.event:on('menu_closed', function()
    vim.b.coc_suggest_disable = nil
  end)

  if string.find(text_before_cursor, "var%(") then
    return true
  end

  return false
end

local function check_css_var_context_and_toggle()
  local should_be_active = check_cmp_should_be_active()

  if should_be_active then
    require('cmp').complete()
  end
end


M.setup_autocmd = function()
  vim.api.nvim_create_augroup("CssCompletionToggle", { clear = true })

  -- https://neovim.io/doc/user/autocmd.html#TextChangedI
  vim.api.nvim_create_autocmd("TextChangedI", {
    pattern = "*.css",
    group = "CssCompletionToggle",
    callback = check_css_var_context_and_toggle,
  })
end

return M
