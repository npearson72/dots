syntax enable

" Color scheme
set t_Co=256
silent! colorscheme pencil
set background=dark
highlight Normal ctermfg=NONE ctermbg=NONE

" Color column
set colorcolumn=80
hi ColorColumn ctermbg=235 ctermfg=235
hi CursorColumn ctermbg=235 ctermfg=NONE
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
      let a:palette[key].airline_warning = ['', '#D75F5F', '', 167, '']
      let a:palette[key].airline_error = ['', '#E32791', '', 1, '']
    endfor
  endif
endfunction

" CoC
hi CocInfoSign ctermfg=03 ctermbg=NONE
hi CocWarningSign ctermfg=167 ctermbg=NONE
hi CocErrorSign ctermfg=01 ctermbg=NONE
hi CocInfoHighlight ctermfg=NONE ctermbg=16
hi link CocWarningHighlight CocInfoHighlight
hi link CocErrorHighlight CocInfoHighlight
hi CocInfoFloat ctermfg=251 ctermbg=NONE
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
hi NERDTreeOpenable ctermbg=NONE ctermfg=08
hi link NERDTreeClosable NERDTreeOpenable
hi NERDTreeFile ctermfg=NONE ctermfg=251

" Taboo
hi TabLineFill ctermfg=235 ctermbg=235
hi TabLine ctermfg=08 ctermbg=235
hi TabLineSel ctermfg=02 ctermbg=NONE
