syntax enable

" Colorscheme
silent! colorscheme pencil
set t_Co=256
set background=dark

set colorcolumn=80
hi ColorColumn ctermbg=235 ctermfg=NONE

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

"=================
" Plugin visuals
"=================
" Ale
let g:ale_sign_warning="☢ "
let g:ale_sign_error="☠ "
hi ALEWarningSign ctermfg=11 ctermbg=NONE
hi ALEErrorSign ctermfg=09 ctermbg=NONE
hi ALEWarning ctermfg=NONE ctermbg=232
hi ALEError ctermfg=NONE ctermbg=232

" Taboo
hi TabLineFill ctermfg=08 ctermbg=08
hi TabLine ctermfg=13 ctermbg=08
hi TabLineSel ctermfg=02 ctermbg=00
