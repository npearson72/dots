filetype plugin indent on

" Tabstops
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype gitcommit setlocal colorcolumn=80
