set termguicolors

 " Avoid strangeness with syntax highlighting breaking
" syntax sync minlines=10000

" Color scheme
silent! colorscheme pencil
set background=dark
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Color column
set colorcolumn=80
highlight ColorColumn ctermfg=NONE ctermbg=235 guifg=NONE guibg=#262626
highlight link CursorColumn ColorColumn
highlight link CursorLine ColorColumn

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
highlight CocInfoSign ctermfg=03 ctermbg=NONE guifg=#a89c14 guibg=NONE
highlight CocWarningSign ctermfg=167 ctermbg=NONE guifg=#d75f5f guibg=NONE
highlight CocErrorSign ctermfg=01 ctermbg=NONE guifg=#c30771 guibg=NONE
highlight CocHintSign ctermfg=01 ctermbg=NONE guifg=#008ec4 guibg=NONE
highlight CocInfoHighlight guisp=#a89c14 gui=undercurl
highlight CocWarningHighlight guisp=#d75f5f gui=undercurl
highlight CocErrorHighlight guisp=#e32791 gui=undercurl
highlight CocHintHighlight guisp=#008ec4 gui=undercurl
highlight CocInfoFloat ctermfg=251 ctermbg=NONE guifg=#c6c6c6 guibg=NONE
highlight link CocWarningFloat CocInfoFloat
highlight link CocErrorFloat CocInfoFloat

highlight CocGitAdd ctermfg=2 ctermbg=NONE guifg=#10a778 guibg=NONE
highlight CocGitChange ctermfg=3 ctermbg=NONE guifg=#a89c14 guibg=NONE
highlight CocGitDelete ctermfg=9 ctermbg=NONE guifg=#e32791 guibg=NONE
highlight link CocGitDeleteChange CocGitDelete

" Taboo
highlight TabLineFill ctermfg=235 ctermbg=235 guifg=#262626 guibg=#262626
highlight TabLine ctermfg=238 ctermbg=235 guifg=#444444 guibg=#262626
highlight TabLineSel ctermfg=2 ctermbg=NONE guifg=#10a778 guibg=NONE
