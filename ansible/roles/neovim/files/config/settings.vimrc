" Searching
set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch
set wildignore+=*/.tmp/*,*.so,*.swp,*.zip,*.git

" Tabbing and indents
set autoindent
set smartindent
set scrolloff=3
set shiftround
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab

" Formatting, layout, misc tweeks
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set number
set ruler
set cursorline
set cursorcolumn
set visualbell
set laststatus=2
set showcmd
set showmode!
set wrap
set listchars=tab:▸\ ,trail:·,eol:¬,space:·
set linebreak
let &showbreak = '↪ '

" Makes things faster?
set notimeout
set ttimeout
set ttimeoutlen=10

" Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview
set wildmenu
set wildmode=longest:full,full

" Backups, swapfiles, views
set backup
set noswapfile
set history=1000
set undofile
set undoreload=10000

set backupdir=$HOME/.local/share/nvim/backup//

" Make folders automatically if they don't already exist.
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

"=================
" Plugin settings
"=================
" COC
autocmd CursorMoved * if &previewwindow != 1 | pclose | endif

" Restore view (vim-scripts/restore_view.vim)
set viewoptions=cursor
