" Plugins
call plug#begin()

Plug 'gkz/vim-ls'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kien/ctrlp.vim'
let g:ctrlp_prompt_mappings = {
\	'AcceptSelection("e")': ['<c-t>'],
\	'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
\}
Plug 'airblade/vim-gitgutter'
Plug 'jonathanfilip/vim-lucius'
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
let g:tex_flavor = 'latex'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr=1
Plug 'scrooloose/syntastic'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_python_python_exec = '/usr/bin/python3'
Plug 'wfxr/minimap.vim'
Plug 'majutsushi/tagbar'
Plug 'digitaltoad/vim-jade'
Plug 'digitaltoad/vim-pug'
Plug 'nicklasos/vim-jsx-riot'
au BufNewFile,BufRead *.tag setlocal ft=javascript
Plug 'wavded/vim-stylus'
"Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
Plug 'tikhomirov/vim-glsl'
Plug 'tpope/vim-abolish'
Plug 'neovim/node-host', { 'do': 'npm install' }
"Plug 'vimlab/mdown.vim', { 'do': 'npm install' }
Plug 'mattn/emmet-vim'
let g:user_emmet_leader_key = '<C-s>'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Ron89/thesaurus_query.vim'
let g:tq_openoffice_en_file="~/data/thesaurus/th_en_US_new"
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
Plug 'posva/vim-vue'
Plug 'tpope/vim-fugitive'
"Plug 'tveskag/nvim-blame-line'
"autocmd BufEnter * EnableBlameLine
Plug 'APZelos/blamer.nvim'
let g:blamer_enabled = 1
Plug 'leafOfTree/vim-svelte-plugin'
let g:vim_svelte_plugin_use_pug = 1
let g:vim_svelte_plugin_use_typescript = 1
let g:vim_svelte_plugin_use_sass = 1
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd Filetype typescriptreact setlocal expandtab smartindent tabstop=2 shiftwidth=2
Plug 'sbdchd/neoformat'
autocmd BufWritePre *.vue Neoformat
autocmd BufWritePre *.ts Neoformat
"autocmd BufWritePre *.js Neoformat
" Use formatprg when available
let g:neoformat_try_formatprg = 1

call plug#end()

" General
set title
"set number
set mouse=a
set clipboard=unnamedplus
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrap
set list
set listchars=tab:\|-,trail:·,extends:»,precedes:«
autocmd InsertEnter,InsertLeave * set cursorline!
set autoindent
set backspace=indent,eol,start
set modeline
set modelines=1


" Filetype specific settings
"filetype plugin indent on

autocmd Filetype ls setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype typescript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2
autocmd Filetype vue setlocal expandtab tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead package.json setlocal expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.md setf markdown
au BufNewFile,BufRead *.lsx setf ls
au BufNewFile,BufRead *.tex setf tex
autocmd Filetype tex setlocal linebreak wrap spell
" TODO: Figure out why only this works
au BufNewFile,BufRead *.tex setlocal linebreak wrap spell filetype=tex
autocmd Filetype markdown setlocal linebreak wrap spell
autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
autocmd FileType svg setlocal foldmethod=indent foldlevelstart=999 foldminlines=0

" Build
"autocmd BufWritePost *.c make
"autocmd BufWritePost *.ls :silent !lsc -cb %
"autocmd BufWritePost *.scss :silent !sass % %:r.css


" Key mappings
let mapleader = ","

nnoremap <leader>r :source $MYVIMRC<CR>

"nnoremap . :

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

cmap w!! w !sudo tee % >/dev/null

nnoremap j gj
nnoremap k gk
noremap <C-w> :w<CR>
map <C-l> <Plug>IMAP_JumpForward
noremap <C-j> <C-d>
noremap <C-k> <C-u>
"nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

nmap <leader>ne :NERDTreeTabsToggle<CR>
nmap <leader>nf :NERDTreeFocusToggle<CR>

nmap <leader>o :TagbarToggle<CR>

" https://github.com/neovim/neovim/issues/3211
map <F1> <del>
map! <F1> <del>

" Color scheme
syntax on
set t_Co=256
colorscheme lucius
set background=dark
LuciusBlack
highlight SignColumn ctermbg=234
highlight Normal ctermbg=none
highlight SpecialKey ctermfg=60
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE
set laststatus=0


" Tab behaviour
setlocal tabstop=2 shiftwidth=2
