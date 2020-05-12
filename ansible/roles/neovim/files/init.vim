" Check computer type (ex: home or work)
function ComputerType(type)
  for s:line in readfile($HOME.'/.dots/.env')
    if s:line =~# 'TYPE.*'.a:type | return 1 | endif
  endfor
  return 0
endfunction

filetype plugin indent on

set termguicolors

source $HOME/.dots/ansible/roles/neovim/files/config/plugins.vimrc
source $HOME/.dots/ansible/roles/neovim/files/config/functions.vimrc
source $HOME/.dots/ansible/roles/neovim/files/config/autocmds.vimrc
source $HOME/.dots/ansible/roles/neovim/files/config/settings.vimrc
source $HOME/.dots/ansible/roles/neovim/files/config/mappings.vimrc
source $HOME/.dots/ansible/roles/neovim/files/config/visuals.vimrc
