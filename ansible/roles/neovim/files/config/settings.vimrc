set autoindent
set smartindent
set encoding=utf-8
set fileencoding=utf-8
set backspace=indent,eol,start
set number
set ruler
set visualbell
set scrolloff=3
set laststatus=2
set wrap
set linebreak
set showbreak=↪
set listchars=tab:▸\ ,trail:·,eol:¬,space:·
set completeopt=longest,menuone,preview
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
" Fix for coc-vetur: https://github.com/neoclide/coc-vetur/issues/3
set signcolumn=yes
set shortmess+=c

" TextEdit might fail if hidden is not set.
set hidden
