" Start Pathogen
execute pathogen#infect()

" turn on line numbering
set number

" turn on syntax highlighting
syntax enable

" turn on file type detection
filetype plugin indent on

" set colorscheme
colorscheme evening

" Configuring TABS
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in TAB while editting
set expandtab "Pressing TAB = inserting n spaces

" Configuring UI
set cursorline "highlight current line
set wildmenu "enable wildmenu
set lazyredraw "tells vim to not bother with redrawing screens in the middle of macros, leading to faster macros
set showmatch "highlights matching [{()}]

" Configuring Search (/)
set incsearch "search characters as they are entered
set hlsearch "highlight matches
" https://github.com/haya14busa/incsearch.vim improved incsearch

