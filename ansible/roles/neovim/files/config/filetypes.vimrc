filetype plugin indent on

" Tabstops
autocmd Filetype * setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Git
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype gitcommit setlocal colorcolumn=80

" Markdown
autocmd Filetype markdown setlocal spell
