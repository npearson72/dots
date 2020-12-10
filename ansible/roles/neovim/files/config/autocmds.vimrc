" Only show curson line and column in active window
augroup CursorLine
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,CursorMoved * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

augroup CursorColumn
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter,CursorMoved * setlocal cursorcolumn
  autocmd WinLeave * setlocal nocursorcolumn
augroup END

" Use custom function to create backups
autocmd BufWritePre * SaveBackups

" Save folds
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufUnload,BufLeave ?* silent! mkview
"   autocmd BufWinEnter ?* silent! loadview
" augroup END

"=================================
" Filetypes
"=================================
autocmd Filetype * setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" FZF
autocmd! FileType fzf tnoremap <buffer> <esc> <esc>

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype gitcommit setlocal colorcolumn=80

" Jsonc
autocmd FileType json setlocal filetype=jsonc

" Markdown
autocmd Filetype markdown setlocal spell

" posa/vim-vue (included in vim-polyglot)
" https://github.com/posva/vim-vue#my-syntax-highlighting-stops-working-randomly
autocmd FileType vue syntax sync fromstart

"=================================
" Plugins
"=================================
" Coc

if ComputerType('home')
  augroup CocFormat
    autocmd!
    autocmd BufWritePre *.rb CocFormat
  augroup END

  augroup CocPrettier
    autocmd!
    autocmd BufWritePre 
          \*.css,
          \*.html,
          \*.less,
          \*.js,
          \*.json,
          \*.jsx,
          \*.scss,
          \*.ts,
          \*.tsx,
          \*.vue,
          \*.yaml CocPrettier
  augroup END

  augroup CocOrganizeImports
    autocmd!
    autocmd BufWritePre 
          \*.js,
          \*.jsx,
          \*.ts,
          \*.tsx CocOrganizeImports
  augroup END
endif

" Projectionist
autocmd User ProjectionistDetect
      \ call projectionist#append(getcwd(),
      \ {
      \    'app/*.rb': {
      \      'alternate': 'spec/{}_spec.rb'
      \    },
      \    'spec/*_spec.rb': {
      \      'alternate': 'app/{}.rb'
      \    },
      \    'lib/*.ex': {
      \      'alternate': 'test/{}_test.exs'
      \    },
      \    'test/*_test.exs': {
      \      'alternate': 'lib/{}.ex'
      \    },
      \ })
