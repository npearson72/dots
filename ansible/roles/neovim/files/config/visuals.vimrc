syntax enable

" Color scheme
silent! colorscheme pencil
set background=dark
hi Normal guibg=NONE ctermbg=NONE

" Color column
set colorcolumn=80
hi ColorColumn ctermfg=NONE ctermbg=0 guifg=NONE guibg=#212121
hi CursorLine ctermfg=NONE ctermbg=0 guifg=NONE guibg=#212121
hi CursorColumn ctermfg=NONE ctermbg=0 guifg=NONE guibg=#212121
hi LineNr ctermfg=08 ctermbg=NONE guifg=#424242 guibg=NONE
hi VertSplit ctermfg=0 ctermbg=0 guifg=#212121 guibg=#212121

let g:terminal_color_0  = '#212121'
let g:terminal_color_1  = '#c30771'
let g:terminal_color_2  = '#10a778'
let g:terminal_color_3  = '#a89c14'
let g:terminal_color_4  = '#008ec4'
let g:terminal_color_5  = '#523c79'
let g:terminal_color_6  = '#20a5ba'
let g:terminal_color_7  = '#e0e0e0'
let g:terminal_color_8  = '#535353'
let g:terminal_color_9  = '#e32791'
let g:terminal_color_10 = '#5fd7a7'
let g:terminal_color_11 = '#f3e430'
let g:terminal_color_12 = '#20bbfc'
let g:terminal_color_13 = '#6855de'
let g:terminal_color_14 = '#4fb8cc'
let g:terminal_color_15 = '#f3f3f3'

"=================
" Plugins
"=================
" Airline
let g:airline_theme='pencil'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.notexists='*'

" CoC
hi CocInfoSign ctermfg=226 ctermbg=NONE guifg=#a89c14 guibg=NONE
hi CocWarningSign ctermfg=167 ctermbg=NONE guifg=#d75f5f guibg=NONE
hi CocErrorSign ctermfg=161 ctermbg=NONE guifg=#940000 guibg=NONE
hi CocInfoHighlight ctermfg=NONE ctermbg=16 guifg=NONE guibg=#000000
hi link CocWarningHighlight CocInfoHighlight
hi link CocErrorHighlight CocInfoHighlight
hi CocInfoFloat ctermfg=255 ctermbg=NONE guifg=#eaeaea guibg=NONE
hi link CocWarningFloat CocInfoFloat
hi link CocErrorFloat CocInfoFloat

" Devicons
let g:WebDevIconsNerdTreeBeforeGlyphPadding=''
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1
let g:DevIconsEnableFoldersOpenClose=1

" NERDTree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Overwrites colors of folders
hi link NERDTreeFlags NERDTreeDir
hi NERDTreeOpenable ctermfg=08 ctermbg=NONE guifg=#636363 guibg=NONE
hi link NERDTreeClosable NERDTreeOpenable
hi NERDTreeFile ctermfg=255 ctermfg=NONE guifg=#eaeaea guibg=NONE

" Taboo
hi TabLineFill ctermfg=08 ctermbg=08 guifg=#424242 guibg=#424242
hi TabLine ctermfg=247 ctermbg=08 guifg=#7d7d7d guibg=#424242
hi TabLineSel ctermfg=02 ctermbg=NONE  guifg=#10a778 guibg=NONE
