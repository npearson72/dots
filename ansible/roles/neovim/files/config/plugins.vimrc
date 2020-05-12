call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")

" UI/UX
Plug 'bling/vim-airline'
Plug 'reedes/vim-colors-pencil'
Plug 'gcmt/taboo.vim'
Plug 'ryanoasis/vim-devicons'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" File management, search, navigation
Plug '/usr/local/opt/fzf' " Homebrew managed fzf binary
Plug 'junegunn/fzf.vim'
Plug 'skwp/greplace.vim'
Plug 'scrooloose/nerdtree'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'npearson72/vim-personal-snippets'

" Autocompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Formatters, selectors, accelerators
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'suy/vim-context-commentstring' " For JSX comments
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-peekaboo'
Plug 'simnalamburt/vim-mundo'
Plug 'othree/eregex.vim'
Plug 'wesQ3/vim-windowswap'

" Ruby/Rails
Plug 'vim-ruby/vim-ruby'
Plug 'henrik/vim-ruby-runner'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user' " Required for vim-textobj-rubyblock

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()

" Airline
let g:airline#extensions#whitespace#enabled=0
let g:airline_extensions=['branch', 'coc']
let g:airline_section_z=airline#section#create(['%1p%% %l/%L:%c '])

if !exists('g:airline_symbols') | let g:airline_symbols={} | endif

" Coc
let g:coc_global_extensions=[
      \ 'coc-css',
      \ 'coc-elixir',
      \ 'coc-eslint',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \ 'coc-vetur'
      \]

" FZF
let g:fzf_layout={ 'down': '50%' }
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

" Gsearch
let g:grep_cmd_opts='--line-number --no-heading --glob "!tmp/*"'

" NERDTree
let NERDTreeBookmarksFile=expand("$XDG_DATA_HOME/nvim/NERDTreeBookmarks")
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeMapOpenSplit='s'
let NERDTreeMapOpenVSplit='v'

" RubyRunner
let g:RubyRunner_key='<leader>e'
let g:RubyRunner_open_below=1
let g:RubyRunner_window_size=10

" Taboo
let g:taboo_tab_format=' %f%U '

" UltiSnips
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsSnippetDirectories=[
      \ $HOME."/.config/nvim/plugged/vim-personal-snippets/UltiSnips",
      \]

" Vim Polyglot
" posa/vim-vue (included in vim-polyglot)
" https://github.com/posva/vim-vue#vim-slows-down-when-using-this-plugin-how-can-i-fix-that
let g:vue_pre_processors = 'detect_on_enter'
