set relativenumber
set number
set copyindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set clipboard+=unnamedplus
" set cursorline

" use dvorak in insert mode
set keymap=dvorak

" Put the cursor in the middle
set scrolloff=9

set splitright
set splitbelow

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Use control backspace to delete previus word
" control w is awful
inoremap <C-h> <C-w>
inoremap <C-Space> <C-x><C-p>
inoremap <C-@> <C-Space>

" Use gn and gN to move between files
map gn :bnext<CR>
map gN :bprevious<CR>

" colorscheme elflord

