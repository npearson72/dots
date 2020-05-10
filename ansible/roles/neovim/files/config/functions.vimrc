" Zoom / Restore window
function! s:ZoomToggle() abort
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
command! ZoomToggle call s:ZoomToggle()

" Properly manage (and name) backups
" https://stackoverflow.com/a/38479550/1092012
function! s:SaveBackups()
  if expand('%:p') =~ &backupskip | return | endif

  " If this is a newly created file, don't try to create a backup
  if !filereadable(@%) | return | endif

  for l:backupdir in split(&backupdir, ',')
    :call s:SaveBackup(l:backupdir)
  endfor
endfunction
command! SaveBackups call s:SaveBackups()

function! s:SaveBackup(backupdir)
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

" FZF
function! s:fzf_ctrlp(idx)
  let commands = ['Files', 'History']
  execute commands[a:idx]
  let next = (a:idx + 1) % len(commands)
  execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 10m<cr>:call <sid>fzf_ctrlp('.next.')<cr>'
endfunction
command! FZFCtrlp call <sid>fzf_ctrlp(0)

function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) }
\ }))
