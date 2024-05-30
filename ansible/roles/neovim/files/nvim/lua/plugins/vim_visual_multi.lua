return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    config = function()
      vim.g.VM_case_setting = 'sensitive'

      -- Quit insert mode immediately on <esc>
      vim.g.VM_quit_after_leaving_insert_mode = 1
    end
  }
}
