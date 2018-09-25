syntax enable

" Colorscheme
silent! colorscheme pencil
set t_Co=256
set background=dark

set colorcolumn=80
hi ColorColumn ctermbg=235 ctermfg=NONE

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
