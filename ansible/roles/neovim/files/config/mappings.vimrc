let mapleader=','

" Movement
nnoremap j gj
nnoremap k gk
nnoremap <c-j> }
nnoremap <c-k> {
nnoremap <s-j> }
nnoremap <s-k> {
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
nnoremap wo :ZoomWinTabToggle<cr>

" Neovim terminal mode
if has('nvim')
  tnoremap <esc> <c-\><c-n>
  tnoremap <a-h> <c-\><c-n><c-w>h
  tnoremap <a-j> <c-\><c-n><c-w>j
  tnoremap <a-k> <c-\><c-n><c-w>k
  tnoremap <a-l> <c-\><c-n><c-w>l
endif

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

" Convential select all
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
nnoremap <silent> v v:<c-u>set nonu rnu<cr>gv
nnoremap <silent> V V0:<c-u>set nonu rnu<cr>gv
nnoremap <silent> <c-v> <c-v>:<c-u>set nonu rnu<cr>gv
vnoremap <esc> <esc>:set nornu nu<cr>

" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Modify command line cursor movement
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"=================
" Plugin mappings
"=================
" Ack
cnoreabbrev Ack Ack!
nnoremap <leader>s :Ack!<space>

let g:ack_mappings = {
      \ "<c-v>": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
      \ "<c-x>": "<C-W><CR><C-W>K",
      \ "<c-t>": "<C-W><CR><C-W>T"
      \}

" eregex.vim
nnoremap <C-_> :%S/

" FZF
autocmd! FileType fzf tnoremap <buffer> <esc> <esc>
nnoremap <c-p> :FZFNext<cr>
nnoremap <leader>b :Buffers<cr>

" Mundo
nnoremap <leader>u :MundoToggle<cr>

" NERDTree
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>f :NERDTreeFind<cr>

" Tabularize
vnoremap <leader>T :Tabularize /

" CoC - navigate menu the way you want
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Mapped to UltiSnips in plugins.vimrc
inoremap <silent><expr><c-j> pumvisible() ? "\<c-y><c-r>=UltiSnips#ExpandSnippet()<cr>" : "\<c-j>"
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gr <Plug>(coc-references)
