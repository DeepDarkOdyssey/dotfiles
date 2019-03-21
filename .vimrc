set cursorcolumn
set cursorline

let mapleader=' '
colorscheme gruvbox

call plug#begin('~/.vim/plugged')

Plug 'liuchengxu/vim-better-default' 
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

map <F3> :NERDTreeToggle<CR>
   
if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
    au InsertEnter,InsertChange *
        \ if v:insertmode == 'i' | 
        \   silent execute '!echo -ne "\e[5 q"' | redraw! |
        \ elseif v:insertmode == 'r' |
        \   silent execute '!echo -ne "\e[3 q"' | redraw! |
        \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif
