syntax enable

" Color scheme
" set t_Co=256 " Use for 8-bit colors (not true color)
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

" Coc
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

hi link NERDTreeFlags NERDTreeDir
hi NERDTreeOpenable ctermfg=242 ctermbg=NONE guifg='#6c6c6c' guibg=NONE
hi link NERDTreeClosable NERDTreeOpenable

" Taboo
hi TabLineFill ctermfg=235 ctermbg=235 guifg='#262626' guibg='#262626'
hi TabLine ctermfg=08 ctermbg=235 guifg='#535353' guibg='#262626'
hi TabLineSel ctermfg=02 ctermbg=NONE guifg='#00b38a' guibg=NONE
