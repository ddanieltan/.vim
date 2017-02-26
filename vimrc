" ===============================================================================================
" General Settings
" ===============================================================================================

execute pathogen#infect()
set modeline
set modelines=1 "check the very last line of this file for modeline

" ===============================================================================================
" User Interface
" ===============================================================================================

colorscheme evening "set colorscheme
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm' " Allow color schemes to do bright colors without forcing bold.
  set t_Co=16
endif
set number "turn on line numbering
syntax enable "turn on syntax highlighting
filetype plugin indent on "turn on file type detection
set cursorline "highlight current line
set wildmenu "enable wildmenu
set lazyredraw "tells vim to not bother with redrawing screens in the middle of macros, leading to faster macros
set showmatch "highlights matching [{()}]
set showcmd "show last command in bottom bar

" Configuring TABS
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in TAB while editting
set expandtab "Pressing TAB = inserting n spaces

" Configuring Search (/)
set incsearch "search characters as they are entered
set hlsearch "highlight matches
" https://github.com/haya14busa/incsearch.vim improved incsearch

" ===============================================================================================
" Remapping/Custom shortcuts
" ===============================================================================================

" noremap is a non-recursive remapping, which is safer for vimrc configs. 
" nnoremap is for Normal mode ie. INSERT mode
let mapleader="," "remapping leader key

"Open Nerdtree tab
nnoremap <leader>n :NERDTreeToggle<CR>
"Open vimrc 
nnoremap <leader>ev :vsp $MYVIMRC<CR>
"Enter new line in Normal mode
nnoremap <leader>o o<ESC>x
"Custom Functions

"Toggle between number and relativenumber
function! ToggleNumber()
        if(&relativenumber == 1)
                set norelativenumber
                set number
        else
                set relativenumber
        endif
endfunc
" ===============================================================================================
" Folding
" ===============================================================================================
"Open a fold with zo
"Close a fold with zm
" Example Fold {{{
"Line 1
"Line 2
"Line 3
" }}}

" Default Folding configs when opening this file
" vim:foldmethod=marker:foldlevel=0
