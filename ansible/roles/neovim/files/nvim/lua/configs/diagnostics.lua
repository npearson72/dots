vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "󰋼",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
})

local options = {
  DiagnosticInfo = {
    fg = '#a89c14'
  },

  DiagnosticUnderlineInfo = {
    sp = '#a89c14',
    undercurl = true
  },

  DiagnosticHint = {
    fg = '#008ec4'
  },

  DiagnosticUnderlineHint = {
    sp = '#008ec4',
    undercurl = true
  },

  DiagnosticSignWarn = {
    fg = '#d75f5f'
  },

  DiagnosticUnderlineWarn = {
    sp = '#d75f5f',
    undercurl = true
  },

  DiagnosticSignError = {
    fg = '#c30771'
  },

  DiagnosticUnderlineError = {
    sp = '#e32791',
    undercurl = true
  },
}

local function set_highlight(opts)
  for k, v in pairs(opts) do
    vim.api.nvim_set_hl(0, k, v)
  end
end

set_highlight(options)
