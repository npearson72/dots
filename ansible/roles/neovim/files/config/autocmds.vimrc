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

" Automatically reload buffer when moving cursor if file was changed
autocmd CursorMoved * if mode() !~# "[vV\<c-v>]" | set nornu nu | endif

" Use custom function to create backups
autocmd BufWritePre * SaveBackups

" Locks up certain files that are using coc-tsserver for some reason??
" mkview to save folds, etc.
autocmd BufWrite,ExitPre,QuitPre,VimLeavePre \
      \*.coffee,
      \*.css,
      \*.erb,
      \*.haml,
      \*.html,
      \*.less,
      \*.js,
      \*.json,
      \*.jsx,
      \*.rb,
      \*.scss,
      \*.slim,
      \*.ts,
      \*.tsx,
      \*.vue,
      \*.yaml mkview

" Load views
autocmd BufRead * silent! loadview

"=================================
" Filetypes
"=================================
autocmd Filetype * setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" FZF
autocmd! FileType fzf tnoremap <buffer> <esc> <esc>

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype gitcommit setlocal colorcolumn=80

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
  command! -nargs=0 Format :call CocAction('format')
  autocmd BufWrite *.ex,*.exs,*.rb Format

  command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
  autocmd BufWrite \
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
        \*.yaml Prettier
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
