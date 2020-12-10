" Color scheme
silent! colorscheme pencil
set background=dark
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Color column
set colorcolumn=80
highlight ColorColumn ctermfg=NONE ctermbg=235 guifg=NONE guibg=#262626
highlight CursorColumn ctermfg=NONE ctermbg=235 guifg=NONE guibg=#262626
highlight link CursorLine CursorColumn

" Keep neovim terminal colors consistent with shell

" Normal colors
let g:terminal_color_0='#212121' " black
let g:terminal_color_1='#c30771' " red
let g:terminal_color_2='#10a778' " green
let g:terminal_color_3='#a89c14' " yellow
let g:terminal_color_4='#008ec4' " blue
let g:terminal_color_5='#523c79' " magenta
let g:terminal_color_6='#20a5ba' " cyan
let g:terminal_color_7='#f1f1f1' " white

" Bright colors
let g:terminal_color_8='#424242'  " black
let g:terminal_color_9='#e32791'  " red
let g:terminal_color_10='#5fd7a7' " green
let g:terminal_color_11='#f3e430' " yellow
let g:terminal_color_12='#b6d6fd' " blue
let g:terminal_color_13='#6855de' " magenta
let g:terminal_color_14='#4fb8cc' " cyan
let g:terminal_color_15='#ffffff' " white

"=================================
" Plugins
"=================================
" Coc
highlight CocInfoSign ctermfg=03 ctermbg=NONE guifg=#b6a917 guibg=NONE
highlight CocWarningSign ctermfg=167 ctermbg=NONE guifg=#d75f5f guibg=NONE
highlight CocErrorSign ctermfg=01 ctermbg=NONE guifg=#c30771 guibg=NONE
highlight CocInfoHighlight ctermfg=NONE ctermbg=16 guifg=NONE guibg=#000000
highlight link CocWarningHighlight CocInfoHighlight
highlight link CocErrorHighlight CocInfoHighlight
highlight CocInfoFloat ctermfg=251 ctermbg=NONE guifg=#c6c6c6 guibg=NONE
highlight link CocWarningFloat CocInfoFloat
highlight link CocErrorFloat CocInfoFloat

" Taboo
highlight TabLineFill ctermfg=235 ctermbg=235 guifg=#262626 guibg=#262626
highlight TabLine ctermfg=238 ctermbg=235 guifg=#444444 guibg=#262626
highlight TabLineSel ctermfg=02 ctermbg=NONE guifg=#00b38a guibg=NONE
