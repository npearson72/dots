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
" CoC
" Elxir 'no mix found in project' issue
" https://github.com/JakeBecker/elixir-ls/issues/76
autocmd FileType elixir let b:coc_root_patterns = ['mix.exs']

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

" FZF
" FZF display preview window while searching (ctrl-p)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
  \ call fzf#vim#buffers(fzf#vim#with_preview('right:50%', 'ctrl-p'))

command! -bang -nargs=? -complete=dir History
  \ call fzf#vim#history(fzf#vim#with_preview('right:50%', 'ctrl-p'))

" FZF as grep (Using ripgrep)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
  \   fzf#vim#with_preview('right:50%:hidden', 'ctrl-p'), <bang>0)

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
