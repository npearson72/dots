local M = {}

local function is_cursor_inside_var_function()
  local current_line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1

  -- Avoid greedy matching. Look only for a single close parenthesis.
  local left, right = current_line:find("var%([^)]*%)")

  if (left and right) and (col > left + 3 and col <= right) then
    return true
  end

  return false
end

local function should_enable_cmp()
  local ft = vim.bo.filetype

  if ft == "css" and is_cursor_inside_var_function() then
    return true
  end

  return false
end

local function check_css_var_context_and_toggle()
  local enable = should_enable_cmp()

  if enable then
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
