set relativenumber
set number
set copyindent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set clipboard+=unnamedplus
set wrap
set linebreak
set cursorline
set colorcolumn=80
set showmatch
set ignorecase
set smartcase

" I'm not sure what is this
set backspace=indent,eol,start

" use dvorak in insert mode
" set keymap=dvorak

" Put the cursor in the middle
set scrolloff=9

set splitright
set splitbelow

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
inoremap <C-H> <C-w>
inoremap <C-BS> <C-w>
" inoremap <C-?> <C-w>
inoremap <C-Space> <C-x><C-p>
inoremap <C-@> <C-x><C-p>

" Use gn and gN to move between files
map gn :bnext<CR>
map gN :bprevious<CR>

colorscheme elflord

if filereadable($HOME."/.vimrc.cscope")
    source $HOME/.vimrc.cscope
endif

" PLUGINS

call plug#begin()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'dhananjaylatkar/cscope_maps.nvim',

call plug#end()

" FZF config

map ff :Files

if !empty($ADE_VIEW_NAME)
    " start cscope if inside an ade view
    lua require("cscope_maps").setup()
endif
