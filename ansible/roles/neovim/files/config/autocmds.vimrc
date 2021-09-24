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
augroup SaveBackups
  autocmd!
  autocmd BufWritePre * SaveBackups
augroup END

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

"=================================
" Plugins
"=================================
" Coc
augroup CodeFormatting
  autocmd!
  autocmd BufWritePre *.vue Prettier " Because Vue is a special snowflake
augroup END

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
      \    'src/*.js': {
      \      'alternate': 'src/tests/{}.test.js'
      \    },
      \    'src/tests/*.test.js': {
      \      'alternate': 'src/{}.js'
      \    },
      \ })
