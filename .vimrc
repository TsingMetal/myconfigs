" Set colorscheme = desert
" colorscheme desert

" to lock arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Added by Tsing; Borrowed from Amir Salihefendic:

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <Leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <Leader><cr> is pressed
map <silent> <Leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Added by Tsing
" map <C-r> <C-W>r  " conflict with redo

" Close all the buffers
map <Leader>ba :bufdo bd<cr>

map <Leader>l :bnext<cr>
map <Leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <Leader>tn :tabnew<cr>
map <Leader>to :tabonly<cr>
map <Leader>tc :tabclose<cr>
map <Leader>tm :tabmove 
map <Leader>t<Leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <Leader>te :tabedit 

" Pressing ,ss will toggle and untoggle spell checking
map <Leader>ss :setlocal spell!<cr>

" Added by Tsing
" show line number
set nu
" Highlight the screen line of the cursor with CursorLine
set cul
" Set textwidth = 74
set tw=74
