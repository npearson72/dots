" Zoom / Restore window
function! s:zoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:zoomToggle()

" Toggle relative line numbers
function! s:toggleRlativeLineNumbers(args)
  if (a:args == 'on' && &filetype != 'coc-explorer')
    set nonu rnu
  elseif (a:args == 'off' && &filetype != 'coc-explorer')
    set nornu nu
  endif
endfunction
command! -nargs=1 ToggleRelativeLineNumbers call s:toggleRlativeLineNumbers(<q-args>)

" Properly manage (and name) backups
" https://stackoverflow.com/a/38479550/1092012
function! s:saveBackups()
  if expand('%:p') =~ &backupskip | return | endif

  " If this is a newly created file, don't try to create a backup
  if !filereadable(@%) | return | endif

  for l:backupdir in split(&backupdir, ',')
    :call s:saveBackup(l:backupdir)
  endfor
endfunction
command! SaveBackups call s:saveBackups()

function! s:saveBackup(backupdir)
  let l:filename = expand('%:p')
  if a:backupdir =~ '//$'
    let l:backup = escape(substitute(l:filename, '/', '%', 'g')  . &backupext, '%')
  else
    let l:backup = escape(expand('%') . &backupext, '%')
  endif

  let l:backup_path = a:backupdir . l:backup
  :silent! execute '!cp ' . resolve(l:filename) . ' ' . l:backup_path
endfunction

"=================================
" Plugins
"=================================
" Coc
command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 OrganizeImports :call CocAction('runCommand', 'tsserver.organizeImports')

function! s:cocShowDocumentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
command! CocShowDocumentation call <sid>cocShowDocumentation()

" FZF
function! s:fZFCtrlp(idx)
  let commands = ['Files', 'History']
  execute commands[a:idx]
  let next = (a:idx + 1) % len(commands)
  execute 'tnoremap <buffer><silent><c-f> <c-\><c-n>:close<cr>:sleep 10m<cr>:call <sid>fZFCtrlp('.next.')<cr>'
endfunction
command! FZFCtrlp call <sid>fZFCtrlp(0)

" FZF BD (Buffer Delete)
function! s:fZFListBuffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:fZFDeleteBuffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
      \ 'source': s:fZFListBuffers(),
      \ 'sink*': { lines -> s:fZFDeleteBuffers(lines) }
      \ }))

" FZF display preview window while searching (ctrl-p)
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:50%:hidden', 'ctrl-p'), <bang>0)

command! -bang -nargs=? -complete=dir Buffers
      \ call fzf#vim#buffers(fzf#vim#with_preview('right:50%:hidden', 'ctrl-p'))

command! -bang -nargs=? -complete=dir History
      \ call fzf#vim#history(fzf#vim#with_preview('right:50%:hidden', 'ctrl-p'))

" FZF as grep (Using ripgrep)
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.(<q-args>), 1,
      \   fzf#vim#with_preview('right:50%:hidden', 'ctrl-p'), <bang>0)
