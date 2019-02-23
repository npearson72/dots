" Check computer type (ex: home or work)
function ComputerType(type)
  for s:line in readfile($HOME.'/.dots/.env')
    if s:line =~# 'TYPE.*'.a:type
      return 1
    endif
  endfor
  return 0
endfunction
