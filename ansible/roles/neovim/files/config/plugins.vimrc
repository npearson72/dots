call plug#begin("$HOME/.config/nvim/plugged")

" UI/UX
Plug 'bling/vim-airline'
Plug 'reedes/vim-colors-pencil'
Plug 'gcmt/taboo.vim'
Plug 'ryanoasis/vim-devicons'

" Syntax highlighting
Plug 'w0rp/ale'
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

Plug 'chengzeyi/fzf-preview.vim'

call plug#end()

" Airline
let g:airline#extensions#whitespace#enabled=0
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif
let g:airline_extensions=['ale', 'branch']
let g:airline_section_z=airline#section#create(['%1p%% %l/%L:%c '])

" Ale
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0
let b:ale_warn_about_trailing_whitespace=1

" FZF
let g:fzf_layout={ 'down': '50%' }

" FZF display preview window while searching (ctrl-p)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
  \ call fzf#vim#buffers(fzf#vim#with_preview('right:50%', 'ctrl-p'))

command! -bang -nargs=? -complete=dir History
  \ call fzf#vim#history(fzf#vim#with_preview('right:50%', 'ctrl-p'))

" FZF as grep (Using ripgrep)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%:hidden', 'ctrl-p'), <bang>0)

" Gsearch
let g:grep_cmd_opts='--line-number --no-heading --glob "!tmp/*"'

" NERDTree
let NERDTreeBookmarksFile=expand("$HOME/.local/shared/nvim/NERDTreeBookmarks")
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" Projectionist
autocmd User ProjectionistDetect
      \ call projectionist#append(getcwd(),
      \ {
      \    'app/*.rb': {
      \      'alternate': 'spec/{}_spec.rb'
      \    },
      \    'spec/*_spec.rb': {
      \      'alternate': 'app/{}.rb'
      \    },
      \    'lib/*.ex': {
      \      'alternate': 'test/{}_test.exs'
      \    },
      \    'test/*_test.exs': {
      \      'alternate': 'lib/{}.ex'
      \    },
      \ })

" RubyRunner
let g:RubyRunner_key='<leader>e'
let g:RubyRunner_open_below=1
let g:RubyRunner_window_size=10

" Taboo
let g:taboo_tab_format=' %f '

" UltiSnips
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsSnippetDirectories=[
      \ $HOME."/.config/nvim/plugged/vim-personal-snippets/UltiSnips",
      \]

" posa/vim-vue (included in vim-polyglot)
" https://github.com/posva/vim-vue#vim-slows-down-when-using-this-plugin-how-can-i-fix-that
let g:vue_disable_pre_processors=1
