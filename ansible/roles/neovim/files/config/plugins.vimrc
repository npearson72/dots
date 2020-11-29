call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")

" UI/UX
Plug 'reedes/vim-colors-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'gcmt/taboo.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'kevinoid/vim-jsonc'

" File management, search, navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'skwp/greplace.vim'

" Snippets
Plug 'npearson72/vim-personal-snippets'

" Autocompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Formatters, selectors, accelerators
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'suy/vim-context-commentstring'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'othree/eregex.vim'
Plug 'wesQ3/vim-windowswap'

" Ruby/Rails
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user', { 'for': 'ruby' } " Required for vim-textobj-rubyblock

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()

" Coc
let g:python_host_prog='/usr/bin/python'
let g:python_host_prog3='/usr/local/bin/python3'

let g:coc_global_extensions=[
      \ 'coc-actions',
      \ 'coc-css',
      \ 'coc-emmet',
      \ 'coc-emoji',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \ 'coc-vetur'
      \]

let g:coc_explorer_global_presets = {
      \ 'pwd': {
      \   'root-uri': getcwd(),
      \ },
      \}

" FZF
let g:fzf_layout={ 'down': '50%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

" Gsearch
let g:grep_cmd_opts='--line-number --no-heading --glob "!tmp/*"'

" Lightline
let s:colors = {}
let s:colors.black      = [ '#262626', 235 ]
let s:colors.dark_gray  = [ '#424242', 8 ]
let s:colors.light_gray = [ '#767676', 243 ]
let s:colors.orange     = [ '#d75f5f', 167 ]
let s:colors.red        = [ '#c30771', 1 ]

let s:theme = {}
let s:theme = {
      \ 'normal': {
      \   'left':   [ [ s:colors.black, s:colors.light_gray ],
      \               [ s:colors.light_gray, s:colors.black ] ],
      \   'middle': [ [ s:colors.dark_gray, s:colors.black ] ],
      \   'right':  [ [ s:colors.black, s:colors.red ],
      \               [ s:colors.black, s:colors.orange ],
      \               [ s:colors.dark_gray, s:colors.black ] ],
      \ },
      \ 'inactive': {
      \   'left':   [ [ s:colors.dark_gray, s:colors.black ] ],
      \   'middle': [ [ s:colors.dark_gray, s:colors.black ] ],
      \   'right':  [ [ s:colors.black, s:colors.red ],
      \               [ s:colors.black, s:colors.orange ],
      \               [ s:colors.dark_gray, s:colors.black ] ],
      \ },
      \}

let g:lightline#colorscheme#pencil_dark#palette = lightline#colorscheme#flatten(s:theme)

let g:lightline = {
      \ 'colorscheme': 'pencil_dark',
      \ 'active': {
      \   'left':  [ [ 'gitbranch' ],
      \              [ 'readonly', 'filepath' ] ],
      \   'right': [ [ 'error' ],
      \              [ 'warning' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'position' ] ],
      \ },
      \ 'inactive': {
      \   'left':  [ [ 'readonly', 'filepath' ] ],
      \   'right': [ [ 'error' ],
      \              [ 'warning' ],
      \              [ 'filetype' ] ],
      \ },
      \ 'component': {
      \   'gitbranch': '%{FugitiveHead() != "" ? " " . FugitiveHead() : ""}',
      \   'readonly':  '%{&readonly? "" : ""}',
      \   'filepath':  '%<%F',
      \   'position':  '%l/%L:%c  %p%%',
      \   'warning':   '%{CocDiagnostics("warning")}',
      \   'error':     '%{CocDiagnostics("error")}'
      \ },
      \ 'subseparator': { 'left': '', 'right': '' }
      \}

function! CocDiagnostics(type) abort
  let info = get(b:, 'coc_diagnostic_info', {})
  let prefix = a:type == 'error' ? 'E' : 'W'
  
  if get(info, a:type, 0)
    return prefix . info[a:type]
  else
    return ''
  endif
endfunction

" Taboo
let g:taboo_tab_format=' %f%U '

" vim-visual-multi
let g:VM_case_setting='sensitive'
let g:VM_quit_after_leaving_insert_mode=1 " Quit insert mode immediately on <esc>

" Vim Polyglot
" posa/vim-vue (included in vim-polyglot)
" https://github.com/posva/vim-vue#vim-slows-down-when-using-this-plugin-how-can-i-fix-that
let g:vue_pre_processors = 'detect_on_enter'
