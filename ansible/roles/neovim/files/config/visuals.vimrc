syntax enable

" Color scheme
" set t_Co=256 " Use for base 16 colors (no true color)
silent! colorscheme pencil
set background=dark
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Color column
set colorcolumn=80
hi ColorColumn ctermfg=NONE ctermbg=235 guifg=NONE guibg='#262626'
hi CursorColumn ctermfg=NONE ctermbg=235 guifg=NONE guibg='#262626'
hi! link CursorLine CursorColumn

" Keep neovim terminal colors consistent with shell

" Normal colors
let g:terminal_color_0="#212121" " black
let g:terminal_color_1="#d02783" " red
let g:terminal_color_2="#00b38a" " green
let g:terminal_color_3="#b6a917" " yellow
let g:terminal_color_4="#009fcf" " blue
let g:terminal_color_5="#65508b" " magenta
let g:terminal_color_6="#1eb3c6" " cyan
let g:terminal_color_7="#e0e0e0" " white

" Bright colors
let g:terminal_color_8="#535353"  " black
let g:terminal_color_9="#fe2e8c"  " red
let g:terminal_color_10="#6ddcbc" " green
let g:terminal_color_11="#f5e63d" " yellow
let g:terminal_color_12="#1ac7fc" " blue
let g:terminal_color_13="#7b6fe4" " magenta
let g:terminal_color_14="#5dc3d5" " cyan
let g:terminal_color_15="#f3f3f3" " white

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

let g:airline_theme_patch_func = 'AirlineThemePatch'
function! AirlineThemePatch(palette)
  if g:airline_theme == 'pencil'

    let warning_colors = ['', '#d75F5f', '', 167, '']
    let error_colors = ['', '#c30771', '', 1, '']
    let inactive_colors = ['#535353', '#262626', 08, 235, '']

    " Active states
    let keys = [
          \ 'normal',
          \ 'insert',
          \ 'visual',
          \ 'replace',
          \ 'normal_modified',
          \ 'insert_modified',
          \ 'visual_modified',
          \ 'replace_modified'
          \ ]

    for key in keys
      let a:palette[key].airline_warning = warning_colors
      let a:palette[key].airline_error = error_colors
      let a:palette[key].airline_c = inactive_colors
    endfor

    " Inactive states
    let keys = [
          \ 'airline_a',
          \ 'airline_b',
          \ 'airline_c',
          \ 'airline_x',
          \ 'airline_y',
          \ 'airline_z',
          \]

    for key in keys
      let a:palette.inactive[key] = inactive_colors
    endfor

    let a:palette.inactive_modified.airline_c = inactive_colors
  endif
endfunction

" CoC
hi CocInfoSign ctermfg=03 ctermbg=NONE guifg='#b6a917' guibg=NONE
hi CocWarningSign ctermfg=167 ctermbg=NONE guifg='#d75f5f' guibg=NONE
hi CocErrorSign ctermfg=01 ctermbg=NONE guifg='#c30771' guibg=NONE
hi CocInfoHighlight ctermfg=NONE ctermbg=16 guifg=NONE guibg='#000000'
hi link CocWarningHighlight CocInfoHighlight
hi link CocErrorHighlight CocInfoHighlight
hi CocInfoFloat ctermfg=251 ctermbg=NONE guifg='#c6c6c6' guibg=NONE
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
hi NERDTreeOpenable ctermfg=242 ctermbg=NONE guifg='#6c6c6c' guibg=NONE
hi link NERDTreeClosable NERDTreeOpenable

" Overwrites colors of folders
hi link NERDTreeFlags NERDTreeDir
hi NERDTreeOpenable ctermfg=08 ctermbg=NONE
hi link NERDTreeClosable NERDTreeOpenable
hi NERDTreeFile ctermfg=251 ctermbg=NONE guifg='#c6c6c6' guibg=NONE

" Taboo
hi TabLineFill ctermfg=235 ctermbg=235 guifg='#262626' guibg='#262626'
hi TabLine ctermfg=08 ctermbg=235 guifg='#535353' guibg='#262626'
hi TabLineSel ctermfg=02 ctermbg=NONE guifg='#00b38a' guibg=NONE
