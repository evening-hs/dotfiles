set relativenumber
set number
set copyindent
set autoindent
set expandtab
set shiftwidth=8
set softtabstop=8
set tabstop=8
set clipboard+=unnamedplus
set linebreak
" set cursorline
set colorcolumn=80 " for good practices
set showmatch
set ignorecase
set smartcase
" set keymap=dvorak
set scrolloff=9

set splitright
set splitbelow

set backspace=indent,eol,start

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap H h
nnoremap J j
nnoremap K k
nnoremap L l

" Use control backspace to delete previus word
" control w is awful
inoremap <C-h> <C-w>
inoremap <C-BS> <C-w>
" inoremap <C-?> <C-w>
inoremap <C-Space> <C-x><C-p>
inoremap <C-@> <C-Space>

" Use gn and gN to move between files
map gn :bnext<CR>
map gN :bprevious<CR>

colorscheme vim

" For use with WSL
" Remove if using somewhere else.
let g:clipboard = {
            \   'name': 'WslClipboard',
            \   'copy': {
            \      '+': 'clip.exe',
            \      '*': 'clip.exe',
            \    },
            \   'paste': {
            \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            \   },
            \   'cache_enabled': 0,
            \ }
