syntax enable

" Colorscheme
silent! colorscheme pencil
set t_Co=256
set background=dark

" Tab styles
hi TabLineFill ctermfg=08 ctermbg=08
hi TabLine ctermfg=13 ctermbg=08
hi TabLineSel ctermfg=02 ctermbg=00

" Interactive cursor
let s:uname = system('echo -n "$(uname)"')
if s:uname == 'Linux'
  :set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
        \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
        \,sm:block-blinkwait175-blinkoff150-blinkon175
elseif s:uname =~ "Darwin"
  let &t_SI = '\<esc>]50;CursorShape=1\x7'
  let &t_EI = '\<esc>]50;CursorShape=0\x7'
endif
