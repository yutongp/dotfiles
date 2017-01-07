
if &compatible
  set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.config/nvim/dein'))
  call dein#begin(expand('~/.config/nvim/dein'))
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  " --- languages ---
  call dein#add('fatih/vim-go')
  call dein#add('editorconfig/editorconfig-vim')

  " --- UI ---
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('altercation/vim-colors-solarized')

  " --- dev tools ---
  call dein#add('tpope/vim-fugitive')
  " > show TODO, FIXME etc.
  call dein#add('TaskList.vim')
  " > for fast search inside codes
  call dein#add('mileszs/ack.vim')

  " --- misc ---
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('ervandew/supertab')
  call dein#add('zchee/deoplete-go', {'build': 'make'})
  call dein#add('Shougo/denite.nvim')
  call dein#add('vim-scripts/YankRing.vim')
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-repeat')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

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
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting

let g:solarized_hitrail   =    1

syntax on
colorscheme solarized
set background=dark
set t_Co=256

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

set wildignorecase

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2
let g:airline_powerline_fonts = 1
let g:ackprg = 'ag --nogroup --nocolor --column'
let delimitMate_matchpairs = "(:),[:],{:}"
let g:SuperTabDefaultCompletionType = "<c-n>"
map <Leader>f :Denite buffer file_rec<CR>

"""""""""""""""""""
" deoplete
"""""""""""""""""""
" Use deoplete.
set completeopt+=noselect
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'

""""""""""""""""""""""""""""""""""
"Vim.Go
""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
