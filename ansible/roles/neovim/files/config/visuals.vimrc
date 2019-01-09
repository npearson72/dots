syntax enable

" Colorscheme
silent! colorscheme pencil
set t_Co=256
set background=dark

set colorcolumn=80
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

" Devicons
let g:WebDevIconsNerdTreeBeforeGlyphPadding=''
let g:WebDevIconsUnicodeDecorateFolderNodes=1
let g:WebDevIconsNerdTreeGitPluginForceVAlign=1
let g:DevIconsEnableFoldersOpenClose=1

" LanguageClient-neovim
let g:LanguageClient_diagnosticsDisplay={
    \ 1: { 'signText': '' },
    \ 2: { 'signText': '' }
    \ }

" NERDTree
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
hi NERDTreeOpenable ctermbg=NONE ctermfg=08
hi NERDTreeClosable ctermbg=NONE ctermfg=08

" Overwrites colors of folders
hi! link NERDTreeFlags NERDTreeDir

" vim-nerdtree-syntax-highlight
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight#mitigating-lag-issues
let g:NERDTreeLimitedSyntax=1
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['vue'] = "42b983"

" Taboo
hi TabLineFill ctermfg=08 ctermbg=08
hi TabLine ctermfg=13 ctermbg=08
hi TabLineSel ctermfg=02 ctermbg=00
