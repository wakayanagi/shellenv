" .vimrc by Kuen - 201118
" VIM environment settings

" Environment Settings
colorscheme flattened_dark  " Set color scheme
set background=dark         " Set background color
set nocompatible            " VIM compatibility only
set encoding=utf-8          " Set Unicode encoding

" UI Settings
syntax enable         " Enable syntax highlighting
set nu                " Show line number
set cursorline        " Highlight cursor line
set ruler             " Display cursor position at status bar
set scrolloff=1       " Buffer one line when scrolling off screen
set wrap              " Wrap text to next line
set hlsearch          " Enable search highlighting
set backspace=indent,eol,start

" Define 2 space tab
"filetype plugin indent on
set tabstop=2 shiftwidth=0 softtabstop=-1
set expandtab smarttab
set preserveindent autoindent

" Correct tab indent logic (Python scripting)
set cindent
set cinkeys-=0#
set indentkeys-=0#

" Key Mapping - Insert Mode
" Shift-tab to inverse tab
inoremap <S-Tab> <C-d>

" Key Mapping - Normal Mode
" Clear search highlight on carriage return
nnoremap <silent> <CR> :nohlsearch<CR><CR>
" Tab & Shift-Tab to Page Down/Up
nmap <Tab> <PageDown>
nmap <S-Tab> <PageUp>
