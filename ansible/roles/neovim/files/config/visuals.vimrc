syntax enable

" Color scheme
" set t_Co=256 " Use for base 16 colors (no true color)
silent! colorscheme pencil
set background=dark
highlight Normal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

" Color column
set colorcolumn=80
hi ColorColumn ctermfg=235 ctermbg=235 guifg='#262626' guibg='#262626'
hi CursorColumn ctermfg=NONE ctermbg=235 guifg=NONE guibg='#262626'
hi! link CursorLine CursorColumn

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
      let a:palette[key].airline_warning = ['', '#d75F5f', '', 167, '']
      let a:palette[key].airline_error = ['', '#c30771', '', 1, '']
    endfor
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
