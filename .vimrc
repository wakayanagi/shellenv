".vimrc modified 6/24/17 by Kuen
" Enable syntax highlighting
syntax enable
set background=dark

" Select a colorscheme
colorscheme slate

" Define 2 space tab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set preserveindent
set smartindent

" Set line number
:set nu

" Map keys
" Shift-tab to inverse tab
imap <S-Tab> <c-d>

" For UNIX/Linux systems set backspace where default is vi not vim
"set nocompatible
"set backspace=2
