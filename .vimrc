"set encoding
set encoding=utf-8

set nobackup
set noundofile

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
set culopt=number
" Set textwidth = 74
set tw=74

syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd   " Show (partial) command in status line.
set showmatch   " Show matching brackets.
"set ignorecase   " Do case insensitive matching
set smartcase   " Do smart case matching
set incsearch   " Incremental search
"set autowrite    " Automatically save before commands like :next and :make
set hidden    " Hide buffers when they are abandoned
set mouse=a   " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Added by Tsing
set nocompatible
set nobackup
set autoindent
set tabstop=2
set shiftwidth=2
set nopaste
set autoindent
set hlsearch
" set spell
set showcmd
" Java abrrevisions; added by Tsing
ab sout System.out.println
ab psvm public static void main(String[] args) {
ab psv public static void
ab ps public static
ab pc public class
ab pv public void
ab prv private void
ab prc private class

" setting for java files
if has("autocmd")
    autocmd FileType python,c,sql setlocal sts=4 ts=4 sw=4
endif

set expandtab
" Map F5 to compile and run c++ and java code;
" Borrowed from internet; added at Mon  5 Sep 22:38:51 CST 2016
map #5 :call CompileRunGcc()<CR>

func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!java %<"
  elseif &filetype == 'sh'
    :!./%
  elseif &filetype == 'python'
    exec "!python3 %"
  endif
endfunc

" install plugs
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'

Plug 'https://gitee.com/shy1991/YouCompleteMe'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()


" NERDTree setting
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"Show line number.
let g:NERDTreeShowlineNumber=1

"Show hide file.
let g:NERDTreeHidden=0

"Show Node model.
let NERDTreeDirArrows=1

"Delete help information at the top
let NERDTreeMinimalUI=1

let g:NERDTreeDirArrowExpandable = '|'
let g:NERDTreeDirArrowCollapsible = '/'

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" nerdtree-git-plugin settings
let g:NERDTreeGitStatursShowIgnored = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }


" nerdcommenter settings
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

set pythonthreedll=python310.dll
