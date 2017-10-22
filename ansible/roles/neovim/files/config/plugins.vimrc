call plug#begin("$HOME/.config/nvim/plugged")

" UI/UX
Plug 'bling/vim-airline'
Plug 'reedes/vim-colors-pencil'
Plug 'gcmt/taboo.vim'
Plug 'vim-scripts/restore_view.vim'

" File management, search, navigation
Plug 'mileszs/ack.vim' 
Plug 'kien/ctrlp.vim'
Plug 'skwp/greplace.vim'
Plug 'scrooloose/nerdtree'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/zoomwintab.vim'

" Snippets & autocompletion
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Formatters, selectors, accelerators
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/SyntaxRange'

" Ruby/Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'henrik/vim-ruby-runner'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'kana/vim-textobj-user' " Required for vim-textobj-rubyblock

" Git
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'

" Other
Plug 'vimwiki/vimwiki'
Plug 'shime/vim-livedown'

call plug#end()

" Ack
let g:ackhighlight=1

" Ag (The Silver Searcher)
if executable('ag')
  let g:ackprg='ag --nogroup --column' " Use Ag over Ack

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command='ag %s -i --nocolor --nogroup --hidden
        \ --ignore out
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'
endif

" Airline
let g:airline#extensions#whitespace#enabled=0
let g:airline_theme='pencil'

" Buffergator
let g:buffergator_viewport_split_policy='B'
let g:buffergator_split_size=10

" Ctrlp
let g:ctrlp_match_window='order:ttb,max:30'
let g:ctrlp_clear_cache_on_exit=1
let g:ctrlp_arg_map=1
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_switch_buffer=0

" Deoplete
let g:deoplete#enable_at_startup = 1
" Fix for vim-multiple-cursors
function! Multiple_cursors_before()
  let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
  let b:deoplete_disable_auto_complete = 0
endfunction

" Gsearch
let g:grep_cmd_opts='--line-numbers --noheading'

" NERDTree
let NERDTreeBookmarksFile=expand("$HOME/.local/share/nvim/NERDTreeBookmarks")
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1

" RubyRunner
let g:RubyRunner_key='<Leader>e'
let g:RubyRunner_open_below=1
let g:RubyRunner_window_size=10

" Taboo
let g:taboo_tab_format=' %f '

" UltiSnips
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsEditSplit='vertical'

" VimWiki
let g:vimwiki_list = [
      \{'path': '~/Dropbox/Wikis/dev', 'syntax': 'markdown', 'ext': '.md', 'nested_syntaxes': { 'ruby': 'ruby' }},
      \{'path': '~/Dropbox/Wikis/personal', 'syntax': 'markdown', 'ext': '.md', 'nested_syntaxes': { 'ruby': 'ruby' }}
      \]
let g:vimwiki_table_mappings = 0 " Prevents conflict with Deoplete mappings
