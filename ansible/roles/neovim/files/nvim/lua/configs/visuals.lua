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

  -- Coc
  CocInfoSign = {
    fg = '#a89c14'
  },

  CocInfoHighlight = {
    sp = '#a89c14',
    undercurl = true
  },

  CocWarningSign = {
    fg = '#d75f5f'
  },

  CocWarningHighlight = {
    sp = '#d75f5f',
    undercurl = true
  },

  CocErrorSign = {
    fg = '#c30771'
  },

  CocErrorHighlight = {
    sp = '#e32791',
    undercurl = true
  },

  CocHintSign = {
    fg = '#008ec4',
  },

  CocHintHighlight = {
    sp = '#008ec4',
    undercurl = true
  },

  CocFloating = {
    bg = '#3a3a3a'
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

  -- Treesitter syntax highlighting
  -- Use :TSHighlightCapturesUnderCursor to identify the tag
  tsxTag = {
    fg = '#767676'
  },

  tsxCloseTag = {
    link = 'tsxTag'
  },

  tsxCloseString = {
    link = 'tsxTag'
  }
}

local function set_highlight(opts)
  for k, v in pairs(opts) do
    vim.api.nvim_set_hl(0, k, v)
  end
end

set_highlight(options)
