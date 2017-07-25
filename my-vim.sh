#!/bin/bash
echo "installing all vim dependencies"
echo "installing Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone git://github.com/tpope/vim-sensible.git
git clone git://github.com/tpope/vim-fugitive.git
vim -u NONE -c "helptags vim-fugitive/doc" -c q
git clone git://github.com/altercation/solarized.git
echo " 
execute pathogen#infect()
syntax on
"#filetype plugin indent on
syntax enable
set background=dark
colorscheme solarized
"open nerdtree when vim is run w/out args
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"make vim look nicer
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
:imap jk <Esc>
:set guifont=Bitstream\ Vera\ Sans\ Mono:h14
set pastetoggle=<F3>
nmap <expr>   ;     CmdJump()
nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :
set splitright
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
"Make splits easier to navigate between
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"mappings to copy to + register
nnoremap <F3> "+y
nnoremap <F4> "+p
vnoremap <F3> "+y
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
function! SetupPython()
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction
command! -bar SetupPython call SetupPython()
set statusline=%<\ %f\ %{fugitive#statusline()}
nnoremap <space> <Nop>
let mapleader=" "
"map <space> \
map <leader>w <leader><leader>w
map <leader>b <leader><leader>b
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
hi link EasyMotionTarget2First ErrorMsg
hi link EasyMotionTarget2Second Search
" > ~/.vimrc


