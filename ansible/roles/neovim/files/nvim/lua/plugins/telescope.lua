local config = function()
  local telescope = require('telescope')
  local actions = require('telescope.actions')
  local action_layout = require('telescope.actions.layout')
  local action_state = require('telescope.actions.state')
  local builtin = require('telescope.builtin')
  local state = require('telescope.state')

  local pickers = {
    builtin.find_files,
    builtin.oldfiles,
    index = 1,
  }

  telescope.setup({
    defaults = {
      sorting_strategy = 'ascending',
      scroll_strategy = 'limit',
      layout_config = {
        horizontal = {
          height = 0.9,
          prompt_position = "top",
          width = 0.9
        },
      },
      preview = {
        treesitter = false
      },
      prompt_prefix = '',
      mappings = {
        i = {
          ['<c-j>'] = actions.move_selection_next,
          ['<c-k>'] = actions.move_selection_previous,
          ['<c-p>'] = action_layout.toggle_preview,
          ['<c-h>'] = 'which_key',

          ['<c-f>'] = function()
            if pickers.index >= #pickers then
              pickers.index = 1
            else
              pickers.index = pickers.index + 1
            end

            pickers[pickers.index]({
              default_text = action_state.get_current_line()
            })
          end,

          ['<esc>'] = function(prompt_bufnr)
            pickers.index = 1
            actions.close(prompt_bufnr)
          end,

          ['<cr>'] = function(prompt_bufnr)
            pickers.index = 1
            actions.select_default(prompt_bufnr, 'default')
          end,

          ['<c-t>'] = function(prompt_bufnr)
            pickers.index = 1
            actions.select_tab(prompt_bufnr, 'default')
          end,

          ['<c-v>'] = function(prompt_bufnr)
            pickers.index = 1
            actions.select_vertical(prompt_bufnr, 'default')
          end,

          ['<c-s>'] = function(prompt_bufnr)
            pickers.index = 1
            actions.select_horizontal(prompt_bufnr, 'default')
          end,

          ['<c-d>'] = function(prompt_bufnr)
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)
            vim.api.nvim_buf_delete(selection.bufnr, { force = true })
          end,

          ["<down>"] = function(bufnr)
            state.get_status(bufnr).picker.layout_config.scroll_speed = 1
            actions.preview_scrolling_down(bufnr)
          end,

          ["<up>"] = function(bufnr)
            state.get_status(bufnr).picker.layout_config.scroll_speed = 1
            actions.preview_scrolling_up(bufnr)
          end,

          -- Movement within search box
          ["<c-a>"] = function() vim.cmd "normal! ^" end,
          ["<c-e>"] = function() vim.cmd "startinsert!" end,
        },
      }
    },
    pickers = {
      live_grep = {
        previewer = false,
      },
      oldfiles = {
        cwd_only = true,
        file_ignore_patterns = { 'COMMIT_EDITMSG' },
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      }
    }
  })

  telescope.load_extension('fzf')

  local grep_string = function()
    vim.ui.input({ prompt = 'Rg > ' }, function(value)
      if value and string.len(value) > 0 then
        builtin.grep_string({ default_text = value, search = value })
      else
        vim.defer_fn(function() vim.cmd('echom ""') end, 5000)
      end
    end)
  end

  vim.keymap.set('n', '<c-p>', builtin.find_files, {})
  vim.keymap.set('n', '<leader>b', builtin.buffers, {})
  vim.keymap.set('n', '<leader>s', grep_string, {})
end

return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = config
  },
}
