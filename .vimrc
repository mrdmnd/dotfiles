set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'Valloric/YouCompleteMe'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
call vundle#end()

call glaive#Install()

" Ag is so fast, we just make ctrlp use it, with no caching.
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = '/usr/bin/ag %s -i --nocolor --nogroup --hidden --ignore .git --ignore .svn --ignore .hg  --ignore .DS_Store  --ignore "**/*.pyc"  --ignore .git5_specs  --ignore review -g ""'
let g:ctrlp_use_caching = 0

" I hate having weirdly sorted directory trees.
let g:NERDTreeNaturalSort=1
let g:NERDTreeCaseSensitiveSort=1

" Global fallback compilation config for YouCompleteMe
let g:ycm_global_ycm_extra_conf='/home/mrdmnd/.ycm_extra_conf.py'

" On write, just do the right thing and autoformat.
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType proto,c,cpp AutoFormatBuffer clang-format
  "autocmd FileType python AutoFormatBuffer pyformat
augroup END

au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown tw=80 fo+=t

set number
set list listchars=tab:»\ ,trail:𐩑
set backspace=indent,eol,start
set ttyfast lazyredraw
set visualbell
set clipboard=unnamed
set showmatch
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=81
let mapleader=","

" NEAT KEYBINDSS
" Use clang-include-fixer to pull symbols in appropriate include.
let g:clang_include_fixer_query_mode=1
noremap <leader>qf :pyf /usr/share/clang/clang-include-fixer.py<cr>
" Run clang-tidy on this file?
"



set t_Co=256
filetype plugin indent on
syntax on
