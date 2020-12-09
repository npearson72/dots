let mapleader=','

" Movement
nnoremap j gj
nnoremap k gk
nnoremap <s-j> <c-d>
nnoremap <s-k> <c-u>
nnoremap <c-j> }
nnoremap <c-k> {
nnoremap <c-h> ^
nnoremap <c-l> $
vnoremap <c-h> ^
vnoremap <c-l> $

" Windows
nnoremap wl <c-w>l
nnoremap wh <c-w>h
nnoremap wj <c-w>j
nnoremap wk <c-w>k
nnoremap w= <c-w>=
nnoremap wL <c-w>L
nnoremap wH <c-w>H
nnoremap wJ <c-w>J
nnoremap wK <c-w>K
nnoremap ws <c-w>x
nnoremap wr <c-w>r
nnoremap wR <c-w>R
nnoremap wo :ZoomToggle<cr>

" Buffers
nnoremap [b :bnext<cr>
nnoremap ]b :bprevious<cr>

" Tabs
nnoremap t <esc>:tabnew<cr>
nnoremap T <esc><c-w>T
nnoremap { <esc>gT
nnoremap } <esc>gt

" Remove search highlight
nnoremap <leader><space> :noh<cr>

" Folding
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>
vnoremap <space> zf

" Keep search matches in the middle of the window
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep indent selected
vnoremap <s-l> >gv
vnoremap <s-h> <gv
vnoremap > >gv
vnoremap < <gv

" Make F1 useful
nmap <F1> <esc>
imap <F1> <esc>

" Select all
nnoremap <leader>a ggVG

" Change pwd to current file
nnoremap <leader>cd :lcd<space>%:p:h<cr>:pwd<cr>

" Copy & paste to clipboard
vnoremap <leader>y "*y
nnoremap <leader>p "*p

" Drag block up/down
vnoremap <s-j> :m'>+<cr>gv
vnoremap <s-k> :m-2<cr>gv

" Toggle line wrapping
nnoremap <leader>w :set wrap!<cr>
nnoremap <leader>i :set list!<cr>

" Toggle relative numbers in visual line mode
" nnoremap <silent> v v:<c-u>set nonu rnu<cr>gv
" nnoremap <silent> V V0:<c-u>set nonu rnu<cr>gv
" nnoremap <silent> <c-v> <c-v>:<c-u>set nonu rnu<cr>gv
" vnoremap <esc> <esc>:set nornu nu<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Modify command line cursor movement
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"=================================
" Plugins
"=================================
" Coc
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <silent><expr><c-j> pumvisible() ? "\<c-y>" : "\<c-j>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> <leader>d :call <SID>show_documentation()<cr>

function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <c-a> :<c-u>execute 'CocCommand actions.open ' . visualmode()<cr>
nmap <silent> <c-a> :<c-u>set operatorfunc=<SID>cocActionsOpenFromSelected<cr>g@w<cr>

" Coc - Explorer
nnoremap <leader>e :CocCommand explorer<cr>

" FZF
nnoremap <c-p> :FZFCtrlp<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>s :Rg<space>

" Undotree
nnoremap <leader>u :UndotreeToggle<cr>

" Tabularize
vnoremap <leader>T :Tabularize /
