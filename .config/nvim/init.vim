" ############## vim-plug Settings ##############
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'mhinz/vim-signify'

call plug#end()

" Map nerdtree trigger to a comfortable key
map <C-n> :NERDTreeToggle<CR>

" Solve the conflict between the shortcut of yankstack and auto-pairs
let g:AutoPairsShortcutToggle = '<M-a>'

" Stop mapping <C-h> to <BS>
let g:AutoPairsMapCh = 0

" ############## Coc Settings ##############
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Use <Tab> and <S-Tab> for navigate completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Integration with lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

" ############## Basic Settings ##############
" Set theme
set background=dark
colorscheme gruvbox

" Better default
set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set ignorecase     " Case insensitive search
set smartcase      " ... but case sensitive when uc present
set scrolljump=8   " Line to scroll when cursor leaves screen
set scrolloff=5    " Minumum lines to keep above and below cursor
set nowrap         " Do not wrap long lines
set tabstop=4      " Size of a hard tabstop
set shiftwidth=4   " Size of an 'indent'
set softtabstop=4  " Let backspace delete indent
set expandtab      " Always uses spaces instead of tab characters
set splitright     " Puts new vsplit windows to the right of the current
set splitbelow     " Puts new split windows to the bottom of the current
set autowrite      " Automatically write a file when leaving a modified buffer
set autoread       " Automatically read when a file is changed from outside 
set mousehide      " Hide the mouse cursor while typing
set t_Co=256       " Use 256 colors
set ruler          " Show the ruler
set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set linespace=0    " No extra spaces between rows
set pumheight=20   " Avoid the pop up menu occupying the whole screen"

"Highlight current line and column
set cursorline
set cursorcolumn

" Show the relative line numbers
set number
set relativenumber

syntax enable

" ############## Deep Shits ##############
 
" Allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" A buffer becames hidden when it is abandoned
set hid 
" Configure strings to use in the 'list' mode
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Set utf-8 encoding
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936


" ############## Key Mappings ##############

" Map leader key to 'space'
let mapleader=" "

" Source self
nmap <leader>ss :so %<CR>

" Fast saving
nmap <leader>fs :w!<CR>

" Fast quiting
nnoremap <silent> <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" jj -> escaping
inoremap jj <Esc>
cnoremap jj <C-c>

" Insert mode cursor moving
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-b> <BS>
inoremap <C-d> <Delete>
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Command mode cursor moving
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>
cnoremap <C-d> <Delete>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Visual mode shortcut
vnoremap v <Esc>
vnoremap H ^
vnoremap L $
vnoremap < <gv
vnoremap > >gv


" Normal mode shortcut
nnoremap H ^
nnoremap L $
nnoremap U <C-r>
nnoremap Y y$

" Terminal shortcut
map <Leader>, :terminal<CR>

" Buffer shortcut
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bf :bfirst<CR>
nnoremap <Leader>bl :blast<CR>
nnoremap <Leader>bd :bd<CR>

" Window shortcut
" Switch between windows
nnoremap <Leader>ww <C-w>w
" Rotate windows downwards/rightwards
nnoremap <Leader>wr <C-W>r
" Close the current window
nnoremap <Leader>wd <C-W>c
" Quit the current window
nnoremap <Leader>wq <C-W>q
" Move the cursor to other windows
nnoremap <Leader>wj <C-W>j
nnoremap <Leader>wk <C-W>k
nnoremap <Leader>wh <C-W>h
nnoremap <Leader>wl <C-W>l
" Split the current window to the right/down side
nnoremap <Leader>ws <C-W>s
nnoremap <Leader>wv <C-W>v
" Resize the current window
nnoremap <Leader>wH <C-W>5<
nnoremap <Leader>wL <C-W>5>
nnoremap <Leader>wJ :resize +5<CR>
nnoremap <Leader>wK :resize -5<CR>

" Tab shortcut
nnoremap <Leader>tN :tabnew<CR>
nnoremap <Leader>to :tabonly<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tm :tabmove<CR>
nnoremap <Leader>tn :tabnext<CR>
nnoremap <Leader>tp :tabprev<CR>

"  Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


" ############## Dark Magic ##############
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Toggle paste mode
nnoremap <Leader>ps :setlocal paste!<CR>

"Toggle spell checking
nnoremap <Leader>sp :setlocal spell!<CR>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
