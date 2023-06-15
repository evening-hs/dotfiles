set relativenumber
set number
set copyindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set clipboard+=unnamedplus
set cursorline

set splitright
set splitbelow

" Use control backspace to delete previus word
" control w is awful
inoremap <C-h> <C-w>
inoremap <C-Space> <C-x><C-p>
inoremap <C-@> <C-Space>

" Use gn and gN to move between files
map gn :bnext<CR>
map gN :bprevious<CR>

" Use Control \ to add new line after {}
inoremap <C-\> <CR><CR><Up><Tab>

