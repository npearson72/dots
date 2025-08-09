vim.opt.termguicolors = true
vim.opt.colorcolumn = '80'

local options = {
  -- General
  ColorColumn = {
    bg = '#262626'
  },

  WinSeparator = {
    fg = '#262626'
  },

  NormalFloat = {
    bg = '#3a3a3a'
  },

  -- Coc
  CocInfoSign = {
    link = 'DiagnosticSignInfo'
  },

  CocInfoHighlight = {
    link = 'DiagnosticUnderlineInfo'
  },

  CocHintSign = {
    link = 'DiagnosticSignHint'
  },

  CocHintHighlight = {
    link = 'DiagnosticUnderlineHint'
  },

  CocWarningSign = {
    link = 'DiagnosticSignWarn'
  },

  CocWarningHighlight = {
    link = 'DiagnosticUnderlineWarn'
  },

  CocErrorSign = {
    link = 'DiagnosticSignError'
  },

  CocErrorHighlight = {
    link = 'DiagnosticUnderlineError'
  },

  CocFloating = {
    link = 'NormalFloat'
  },

  CocMenuSel = {
    bg = '#4a4a4a',
  },

  CocInfoFloat = {
    fg = '#c6c6c6'
  },

  CocWarningFloat = {
    link = 'CocInfoFloat'
  },

  CocErrorFloat = {
    link = 'CocInfoFloat'
  },

  CocGitAdd = {
    fg = '#10a778'
  },

  CocGitChange = {
    fg = '#a89c14'
  },

  CocGitDelete = {
    fg = '#e32791'
  },

  CocGitDeleteChange = {
    link = 'CocGitDelete'
  },

  -- Taboo
  TabLine = {
    fg = '#444444',
    bg = '#262626'
  },

  TabLineFill = {
    fg = '#262626',
    bg = '#262626'
  },

  TabLineSel = {
    fg = '#10a778'
  },

  -- Telescope
  TelescopeBorder = {
    fg = '#444444',
  },

  TelescopeSelection = {
    fg = '#212121',
    bg = '#a89c14',
  },

  TelescopePreviewLine = {
    fg = '#212121',
    bg = '#a89c14',
  },
}

local function set_highlight(opts)
  for k, v in pairs(opts) do
    vim.api.nvim_set_hl(0, k, v)
  end
end

set_highlight(options)
