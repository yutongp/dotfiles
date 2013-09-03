"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Amir Salihefendic
"       http://amix.dk - amix@amix.dk
"
" Version:
"       5.0 - 29/05/12 15:43:36
"
" Blog_post:
"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"
" Awesome_version:
"       Get this config, nice color schemes and lots of plugins!
"
"       Install the awesome version from:
"
"           https://github.com/amix/vimrc
"
" Syntax_highlighted:
"       http://amix.dk/vim/vimrc.html
"
" Raw_version:
"       http://amix.dk/vim/vimrc.txt
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
"set history=700

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" --- languages ---
Bundle 'c.vim'
Bundle 'vim-perl/vim-perl'
Bundle 'plasticboy/vim-markdown'
Bundle 'digitaltoad/vim-jade'
Bundle 'othree/html5.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'dart-lang/dart-vim-plugin'
Bundle 'editorconfig/editorconfig-vim'

" --- web dev ---
Bundle 'skammer/vim-css-color'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'mattn/emmet-vim'
"Bundle 'othree/javascript-libraries-syntax.vim'

" --- dev tools ---

Bundle 'tpope/vim-fugitive'
" > better alternative for taglist
Bundle 'majutsushi/tagbar'
" > show TODO, FIXME etc.
Bundle 'TaskList.vim'
" > for fast search inside codes
Bundle 'mileszs/ack.vim'


" --- misc ---
" > better alternative for FuzzyFinder
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'Townk/vim-autoclose'
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized'

Bundle 'Valloric/YouCompleteMe'

"Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdcommenter'
"Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'milkypostman/vim-togglelist'
Bundle 'tpope/vim-repeat'

"Bundle 'sjl/vitality.vim'

"Bundle 'vim-scripts/VimIM'


filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

set autowrite

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

function! RepeatChar(char, count)
   return repeat(a:char, a:count)
 endfunction
 nnoremap s :<C-U>exec "normal i".RepeatChar(nr2char(getchar()), v:count1)<CR>
 nnoremap S :<C-U>exec "normal a".RepeatChar(nr2char(getchar()), v:count1)<CR>

" toggle highlight
nnoremap <leader><leader><space> :set hlsearch!<CR>

nmap <leader><TAB> :wincmd w<cr>

noremap H ^
noremap L g_

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

set ttyfast

" For regular expressions turn magic on
set magic

set undolevels=200

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting

let g:solarized_hitrail   =    1

syntax enable
colorscheme solarized
set background=dark
set t_Co=256

 
" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    "set transparency=12
    set guifont=Monaco:h12
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
"set noexpandtab

" Be smart when using tabs ;)
set smarttab


" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=0

set ai "Auto indent
set si "Smart indent
set cindent
set wrap "Wrap lines
"set nowrap

"show tab
set list
set listchars=tab:▸\ ,trail:◇,extends:»,precedes:«
" start with : and fill the remaining with spaces
"set listchars=tab:\:\ "we have a space here

set nu
" highlight current line
set cursorline
" highlight current column
"set cursorcolumn
" highlight colorcolumn 80
set colorcolumn=80

set ignorecase smartcase

set tags=./tags;/

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
" map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
"map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
"map <leader>cc :botright cope<cr>
"<map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" input method
set noimd


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""
" CtrlP
"""""""""""""""""""""""""""""""
"let g:ctrlp_map = '<leader>f'
nnoremap <leader>f :CtrlPMixed<cr>
nnoremap <leader>bf :CtrlPBuffer<cr>
nnoremap <leader>mr :CtrlPMRU<cr>
nnoremap <leader>. :CtrlPTag<cr>
let g:ctrlp_map = '<leader>pp'
" default search by filename
let g:ctrlp_by_filename = 1
" avoid opening file in following window
let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'

" exclude files from file search
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|a|swp|dep)$|tags',
  \ }
" exclude files from MRU
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*|.*\.swp$|.*\.o$'
"let g:ctrlp_user_command = 'find %s -type f'
" open file in current window
let g:ctrlp_open_new_file = 'r'
" follow links in searching
let g:ctrlp_follow_symlinks = 1
" switch mappings between ToggleType and PtrCur
let g:ctrlp_prompt_mappings = {
  \ 'ToggleType(1)':        ['<c-l>', '<c-up>'],
  \ 'ToggleType(-1)':       ['<c-h>', '<c-down>'],
  \ 'PrtCurLeft()':         ['<c-b>', '<left>', '<c-^>'],
  \ 'PrtCurRight()':        ['<c-f>', '<right>'],
  \ }


"""""""""""""""""""""""""""""""
" TagBar
""""""""""""""""""""""""""""""
let g:tagbar_left = 1
"let g:tagbar_iconchars = ['+', '-']
let g:tagbar_iconchars = [' ▶', ' ▼']
let g:tagbar_width = 30
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
map <Leader>tt :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""
" YCM
""""""""""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 0


""""""""""""""""""""""""""""""""""
"delimiMate
""""""""""""""""""""""""""""""""""
let delimitMate_matchpairs = "(:),[:],{:}"

