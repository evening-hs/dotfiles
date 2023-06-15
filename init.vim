" Install vim plug
" https://github.com/junegunn/vim-plug
" Install node
" Copy this file to ~/.config/nvim/init.vim
" Install clang
" Install pip install -U jedi-language-server
" Now everything should be ready! Just open neovim

let g:coc_global_extensions = ['coc-java', 'coc-pairs', 'coc-clangd', 'coc-jedi']

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
set linebreak
set scrolloff=5

set splitright
set splitbelow

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k


" Use control backspace to delete previus word
" control w is awful
" Actually, I'm cheching this code and I have
" No idea how this works on gnome-terminal
" It seems it doesn't work elsewhere
" However Control H is good too
inoremap <C-h> <C-w>
inoremap <C-Space> <C-x><C-p>
inoremap <C-@> <C-Space>

" Use gn and gN to move between files
map gn :bnext<CR>
map gN :bprevious<CR>

" Use Control \ to add new line after {}
inoremap <C-\> <CR><CR><Up><Tab>

" For coc.nvim
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes

" Use shift space to trigger completion
inoremap <silent><expr> <S-Space> coc#refresh()

" Use tab to cycle through completion options
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

" Use enter to accept selected completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code
nmap <leader> f <Plug>(coc-format-selected)

" Toggling tree view
nnoremap <C-l> :NERDTreeToggle<CR>

" Plugins
call plug#begin()

" List of available plugins
" To install a plugin add it here
" Then Run :PlugInstall
" https://github.com/junegunn/vim-plug

" coc.nvim for autocompletion
" https://github.com/neoclide/coc.nvim
" Install languaje support with
" :CocInstall coc-[language]
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tokyo Night theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Catppuccin theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" NERDTree
Plug 'preservim/nerdtree'

call plug#end()

colorscheme tokyonight
