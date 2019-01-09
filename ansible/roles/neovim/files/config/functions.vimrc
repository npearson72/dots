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

" Open Ctags in vsplit
function! FollowTag()
  if !exists("w:tagbrowse")
    vsplit
    let w:tagbrowse=1
  endif
  execute "tag " . expand("<cword>")
endfunction

" FZF
function! s:fzf_next(idx)
  let commands = ['Files', 'History']
  execute commands[a:idx]
  let next = (a:idx + 1) % len(commands)
  execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 10m<cr>:call <sid>fzf_next('.next.')<cr>'
endfunction

command! FZFNext call <sid>fzf_next(0)

" Display preview in vim
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%', 'ctrl-p'), <bang>0)

" CoC Prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Bufwrites/reads
augroup DoOnWriteRead
  autocmd!
  autocmd BufWrite *.css,*.html,*.less,*.mjs,*.js,*.json,*.jsx,*.scss,*.ts,*.tsx,*.vue,*.yaml Prettier
  autocmd BufWrite,ExitPre,QuitPre,VimLeavePre *.coffee,*.css,*.erb,*.haml,*.html,*.less,*.mjs,*.js,*.json,*.jsx,*.rb,*.scss,*.slim,*.ts,*.tsx,*.vue,*.yaml mkview
  autocmd BufRead * silent! loadview
augroup END
