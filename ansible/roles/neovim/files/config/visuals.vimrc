syntax enable

" Colorscheme
silent! colorscheme pencil
set t_Co=256
set background=dark

set colorcolumn=100
hi ColorColumn ctermbg=235 ctermfg=NONE
hi PmenuSel ctermfg=NONE ctermbg=04

"=================
" Plugin visuals
"=================
" Airline
let g:airline_theme='pencil'
let g:airline_left_sep=''
let g:airline_left_alt_sep=''
let g:airline_right_sep=''
let g:airline_right_alt_sep=''
let g:airline_symbols.branch=''
let g:airline_symbols.readonly=''
let g:airline_symbols.linenr=''
let g:airline_symbols.maxlinenr=''
let g:airline_symbols.notexists='*'

" Ale
let g:ale_sign_warning=''
let g:ale_sign_error=''
hi ALEWarningSign ctermfg=166 ctermbg=NONE
hi ALEErrorSign ctermfg=160 ctermbg=NONE
hi ALEWarning ctermfg=NONE ctermbg=232
hi ALEError ctermfg=NONE ctermbg=232

" LanguageClient-neovim
let g:LanguageClient_diagnosticsDisplay={
    \ 1: { 'signText': '' },
    \ 2: { 'signText': '' }
    \ }

" NERDTree
let g:NERDTreeDirArrowExpandable="\u00a0"
let g:NERDTreeDirArrowCollapsible="\u00a0"
" Overwrites colors of folders
hi! link NERDTreeFlags NERDTreeDir

" Devicons
let g:WebDevIconsNerdTreeBeforeGlyphPadding=''
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1
let g:DevIconsEnableFoldersOpenClose=1

" Taboo
hi TabLineFill ctermfg=08 ctermbg=08
hi TabLine ctermfg=13 ctermbg=08
hi TabLineSel ctermfg=02 ctermbg=00
