vim.api.nvim_create_user_command(
  'ZoomToggle',
  function()
    if Zoomed then
      vim.fn.execute(ZoomedWinrestcmd)
      Zoomed = false
    else
      ZoomedWinrestcmd = vim.fn.winrestcmd()
      vim.cmd([[ resize ]])
      vim.cmd([[ vertical resize ]])
      Zoomed = true
    end
  end,
  {}
)

vim.keymap.set('n', 'wo', ':ZoomToggle<cr>', { silent = true })
