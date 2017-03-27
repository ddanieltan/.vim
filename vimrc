" ================================
" General Settings
" ================================
execute pathogen#infect()
set modeline
set modelines=1 "check the very last line of this file for modeline
" ================================
" User Interface
" ================================
colorscheme molokai "set colorscheme
set number "turn on line numbering
syntax on "turn on syntax highlighting
filetype plugin indent on "turn on file type detection
set cursorline "highlight current line
set wildmenu "enable wildmenu
set lazyredraw "tells vim to not bother with redrawing screens in the middle of macros, leading to faster macros
set showmatch "highlights matching [{()}]
set showcmd "show last command in bottom bar
set laststatus=2 "turn on airline
set shortmess+=I "turn off welcome screen

" Configuring tabs
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in TAB while editting
set expandtab "Pressing TAB = inserting n spaces

" Configuring Search (/)
set incsearch "search characters as they are entered
set hlsearch "highlight matches
" https://github.com/haya14busa/incsearch.vim improved incsearch

" ================================
" Remapping/Custom macros
" ================================
" noremap is a non-recursive remapping, which is safer for vimrc configs. 
" nnoremap is for Normal mode ie. INSERT mode
let mapleader="," "remapping leader key

"Open Nerdtree tab
nnoremap <leader>n :NERDTreeToggle<CR>
"Edit vimrc 
nnoremap <leader>q :vsp $MYVIMRC<CR>
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
nnoremap <leader>1 :call ToggleNumber()<CR>

"Auto reload vimrc once new changes are saved
augroup myvimrc
        au!
        au BufWritePost .vimrc,vimrc so $MYVIMRC
augroup end

"Enable templates/skeletons
augroup templates
        au!
        "read in template files
        autocmd BufNewFile *.* silent! execute '0r ~/.vim/templates/skeleton.'.expand("<afile>:e")
        "parse in dynamic text after read
        autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
augroup end

" ================================
" Folding
" ================================
"Open a fold with zo
"Close a fold with zm
" Example Fold {{{
"Line 1
"Line 2
"Line 3
" }}}

" Default Folding configs when opening this file
" vim:foldmethod=marker:foldlevel=0
