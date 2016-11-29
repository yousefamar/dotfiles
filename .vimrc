" Vundle stuff
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'gkz/vim-ls'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_prompt_mappings = {
\	'AcceptSelection("e")': ['<c-t>'],
\	'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
\}
Plugin 'airblade/vim-gitgutter'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'plasticboy/vim-markdown'
Plugin 'gerw/vim-latex-suite'
Plugin 'ervandew/supertab'
Plugin 'Raimondi/delimitMate'
let delimitMate_expand_cr=1
Plugin 'scrooloose/syntastic'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'majutsushi/tagbar'
Plugin 'digitaltoad/vim-jade'
Plugin 'digitaltoad/vim-pug'
Plugin 'nicklasos/vim-jsx-riot'
au BufNewFile,BufRead *.tag setlocal ft=javascript
Plugin 'wavded/vim-stylus'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-q>"
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-abolish'
Plugin 'suan/vim-instant-markdown'

call vundle#end()
filetype plugin indent on

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
autocmd BufNewFile,BufRead package.json setlocal expandtab tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.md setf markdown
au BufNewFile,BufRead *.lsx setf ls
au BufNewFile,BufRead *.tex setf tex
autocmd Filetype tex setlocal linebreak wrap spell
" TODO: Figure out why only this works
au BufNewFile,BufRead *.tex setlocal linebreak wrap spell filetype=tex
autocmd Filetype markdown setlocal linebreak wrap spell

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
