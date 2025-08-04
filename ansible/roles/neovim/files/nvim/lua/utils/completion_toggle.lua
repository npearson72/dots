local M = {}

local cmp_active_in_css_var_context = false

local function should_cmp_be_active()
  local current_filetype = vim.bo.filetype

  if current_filetype ~= "css" then
    return false
  end

  local cursor_line = vim.api.nvim_get_current_line()
  local cursor_col = vim.api.nvim_win_get_cursor(0)[2] + 1
  local text_before_cursor = string.sub(cursor_line, 1, cursor_col - 1)

  if string.find(text_before_cursor, "var%(") then
    return true
  end

  return false
end

local function check_css_var_context_and_toggle()
  local should_be_active = should_cmp_be_active()

  if should_be_active then
    if not cmp_active_in_css_var_context then
      vim.b.coc_suggest_disable = 1
      cmp_active_in_css_var_context = true

      vim.schedule(function()
        require('cmp').complete()
      end)
    end
  else
    if cmp_active_in_css_var_context then
      vim.b.coc_suggest_disable = nil
      cmp_active_in_css_var_context = false

      vim.schedule(function()
        require('cmp').close()
      end)
    end
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
