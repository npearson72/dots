" Only show curson line and column in active window
augroup CursorLine
  au!
  au VimEnter * setlocal cursorline
  au WinEnter * setlocal cursorline
  au BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
augroup CursorColumn
  au!
  au VimEnter * setlocal cursorcolumn
  au WinEnter * setlocal cursorcolumn
  au BufWinEnter * setlocal cursorcolumn
  au WinLeave * setlocal nocursorcolumn
augroup END

" Automatically reload buffer when moving cursor if file was changed
autocmd CursorMoved * if mode() !~# "[vV\<c-v>]" | set nornu nu | endif
