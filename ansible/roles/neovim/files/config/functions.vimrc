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

"=================================
" Plugins
"=================================

" FZF
function! s:fzf_ctrlp(idx)
  let commands = ['Files', 'Buffers', 'History']
  execute commands[a:idx]
  let next = (a:idx + 1) % len(commands)
  execute 'tnoremap <buffer> <silent> <c-f> <c-\><c-n>:close<cr>:sleep 10m<cr>:call <sid>fzf_ctrlp('.next.')<cr>'
endfunction
command! FZFCtrlp call <sid>fzf_ctrlp(0)
