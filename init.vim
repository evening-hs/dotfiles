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
set cursorline
set colorcolumn=80 " for good practices
set showmatch
set ignorecase
set smartcase
" set keymap=dvorak
set scrolloff=9

set splitright
set splitbelow

set backspace=indent,eol,start

" settings only for normal text
autocmd FileType text,markdown setlocal textwidth=79
autocmd FileType text,markdown setlocal spell
autocmd FileType text,markdown setlocal spelllang=en,es

" requires pandoc and texlive to be installed
cmap print !pandoc "%" -o "%:r".pdf

" key commands

let mapleader = "\<Space>"

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap H h
nnoremap J j
nnoremap K k
nnoremap L l

" Use Alt hjkl to move between panels
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Use control backspace to delete previus word
" control w is awful
inoremap <C-h> <C-w>
inoremap <C-BS> <C-w>
" inoremap <C-?> <C-w>
inoremap <C-Space> <C-x><C-p>
inoremap <C-@> <C-Space>

" Use gn and gN to move between files
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>N :bprevious<CR>

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

nnoremap <Leader>t :split \| term<CR>
nnoremap <Leader>T :vsplit \| term<CR>

tnoremap <Esc> <C-\><C-n>

colorscheme wildcharm
" colorscheme zellner

if exists('$WSL_DISTRO_NAME')
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
endif
