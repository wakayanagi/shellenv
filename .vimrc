".vimrc modified 7/12/18 by Kuen
" Enable syntax highlighting
syntax enable
set background=dark

" Select a colorscheme
colorscheme flattened_dark
" colorscheme slate

" Define 2 space tab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
set preserveindent
set smartindent

" Correct tab indent logic (Python scripting)
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Set line number
:set nu

" Map keys
" Shift-tab to inverse tab in insert mode
imap <S-Tab> <c-d>

" Map Tab / Shift-tab to Page Up/Down in normal mode
nmap <Tab> <PageDown>
nmap <S-Tab> <PageUp>

" For UNIX/Linux systems set backspace where default is vi not vim
"set nocompatible
"set backspace=2
