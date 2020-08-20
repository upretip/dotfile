"Title: upretip's vim config"
"Inspired by the missing semester"


" Comments on vimscripts are double-quotes"


" switch `noncompatible` -not necessary"
set nocompatible


" Turn Syntax highlighting"
syntax on


" Disable vim startup message"
set shortmess+=I


" Show line number"
set number


" show relative line number"
set relativenumber


" Status line at the bottom"
set laststatus=2


" backspace over anything"
set backspace=indent,eol,start

" hidden bufffers -  something about avoiding doing :q!"
"set hidden"


" searching options
set ignorecase
set smartcase
set incsearch   " shows results while typing

" enable mouse
set mouse+=a

" bad habits prevnetion normal mode 
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>


" bad habits prevnetion normal mode 
inoremap <Left> <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up> <ESC>:echoe "Use k"<CR>
inoremap <Down> <ESC>:echoe "Use j"<CR>
