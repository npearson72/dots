return {
  {
    'godlygeek/tabular',
    config = function()
      vim.keymap.set('v', '<leader>T', ':Tabularize /', {})
    end
  }
}
