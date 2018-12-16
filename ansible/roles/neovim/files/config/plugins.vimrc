call plug#begin("$HOME/.config/nvim/plugged")

" UI/UX
Plug 'bling/vim-airline'
Plug 'reedes/vim-colors-pencil'
Plug 'gcmt/taboo.vim'
Plug 'vim-scripts/restore_view.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" File management, search, navigation
Plug 'mileszs/ack.vim' 
Plug '/usr/local/opt/fzf' " Homebrew managed fzf binary
Plug 'junegunn/fzf.vim'
Plug 'skwp/greplace.vim'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/zoomwintab.vim'

" Snippets & autocompletion
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Formatters, selectors, accelerators
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'

" Syntax highlighting
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

" Ruby/Rails
Plug 'vim-ruby/vim-ruby'
Plug 'henrik/vim-ruby-runner'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user' " Required for vim-textobj-rubyblock

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

call plug#end()

" Ack
let g:ackhighlight=1

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ackprg='rg --line-number'
endif

" Airline
let g:airline#extensions#whitespace#enabled=0
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

" Ale
let g:ale_lint_on_text_changed='never'
let g:ale_lint_on_enter=0

" Deoplete
let g:deoplete#enable_at_startup = 1
" Fix for vim-multiple-cursors
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete=1
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete=0
endfunction

" FZF
let g:fzf_layout={ 'down': '40%' }

" Gsearch
let g:grep_cmd_opts='--line-numbers --noheading'

" NERDTree
let NERDTreeBookmarksFile=expand("$HOME/.local/shared/nvim/NERDTreeBookmarks")
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight#mitigating-lag-issues
let g:NERDTreeLimitedSyntax=1

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
\ })

" RubyRunner
let g:RubyRunner_key='<Leader>e'
let g:RubyRunner_open_below=1
let g:RubyRunner_window_size=10

" Taboo
let g:taboo_tab_format=' %f '

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsEditSplit='vertical'
