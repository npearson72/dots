" Only show curson line and column in active window
augroup CursorLine
  autocmd!
  autocmd VimEnter * setlocal cursorline
  autocmd WinEnter * setlocal cursorline
  autocmd BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

augroup CursorColumn
  autocmd!
  autocmd VimEnter * setlocal cursorcolumn
  autocmd WinEnter * setlocal cursorcolumn
  autocmd BufWinEnter * setlocal cursorcolumn
  autocmd WinLeave * setlocal nocursorcolumn
augroup END

" Automatically reload buffer when moving cursor if file was changed
autocmd CursorMoved * if mode() !~# "[vV\<c-v>]" | set nornu nu | endif

" Checks if current buffer is NERDTree
function! IsNERDTreeEnabled()
    return exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
endfunction

" Zoom / Restore window
function! s:ZoomToggle() abort
  " Only zoom if NOT in NERDTree buffer
  if !IsNERDTreeEnabled()
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()

"=================================
" Plugin functions & autocommands
"=================================

" CoC
autocmd CursorMoved * if &previewwindow != 1 | pclose | endif

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Custom autocmds
augroup CustomAutos
  autocmd!
  if ComputerType('home')
    " Fix syntax with Prettier
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
augroup END

" FZF
function! s:fzf_ctrlp(idx)
  let commands = ['Files', 'History']
  execute commands[a:idx]
  let next = (a:idx + 1) % len(commands)
  " Hack to hide errors since fzf.vim expect ctrl-v, ctrl-x, or ctrl-t ONLY
  execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:silent sleep 10m<cr>:call <sid>fzf_ctrlp('.next.')<cr>'
  " execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 10m<cr>:call <sid>fzf_ctrlp('.next.')<cr>'
endfunction

command! FZFCtrlp call <sid>fzf_ctrlp(0)

" FZF display preview window while searching (ctrl-p)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)
