set autoindent
set backspace=indent,eol,start
set completeopt=longest,menuone,preview
set history=1000 " Sets size of cmd history
set linebreak
set listchars=tab:▸\ ,trail:·,eol:¬,space:·
set nosplitright
set noswapfile
set number
set numberwidth=1 " Reduce width of number line
set smartindent
set scrolloff=3
set showbreak=↪
set undofile
set visualbell

"=================================
" Backups
"=================================
" Disable backups because they are managed by the SaveBackups() function
set nobackup

" set a centralized backup directory
set backupdir=$XDG_DATA_HOME/nvim/backup//

if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

"=================================
" Plugins
"=================================
" Coc
" Fix for shifting left margin: https://github.com/neoclide/coc-vetur/issues/3
set signcolumn=yes

" Other Coc recommendations
set hidden
set shortmess+=c
set updatetime=300

" Ripgrep as grep
if executable('rg') | set grepprg=rg | endif
