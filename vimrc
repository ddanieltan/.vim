" Important Pre-settings {{{
execute pathogen#infect()
set modeline
set modelines=1 "check the very last line of this file for modeline
"}}}
" General Setttings {{{
colorscheme molokai "set colorscheme
set number "turn on line numbering
set noerrorbells "turn off beeping
syntax on "turn on syntax highlighting
filetype plugin indent on "turn on file type detection
set cursorline "highlight current line
set wildmenu "enable wildmenu
set lazyredraw "don't bother with redrawing screens in the middle of macros
set showmatch "highlights matching [{()}]
set shortmess+=I "turn off welcome screen

" Airline
set showcmd "show last command in bottom bar
set laststatus=2 "turn on airline

" Tabs
set tabstop=4 "number of visual spaces per TAB
set softtabstop=4 "number of spaces in TAB while editting
set expandtab "Pressing TAB = inserting n spaces

"Search (/)
set hlsearch "highlight matches
set incsearch "show partial matches for search phrase
set ignorecase "ignore upper/lower cases when searching
" }}}
" Remapping/Custom functions {{{
" ================================
" noremap is a non-recursive remapping, which is safer for vimrc configs. 
" nnoremap is for Normal mode ie. INSERT mode
let mapleader="," 

"Open Nerdtree tab
nnoremap <leader>n :NERDTreeToggle<CR>
"Edit vimrc 
nnoremap <leader>q :vsp $MYVIMRC<CR>
"Enter new line without going into INSERT mode 
nnoremap <leader>o o<ESC>x
"Stupid typo in Command modes
cabbrev Q quit
cabbrev Wq wq
cabbrev W w
"Turn off number line
nnoremap <leader>1 :set number! number?<CR>

"Toggle between number and relativenumber
nnoremap <leader>0 :call ToggleRelativeNumber()<CR>
function! ToggleRelativeNumber()
        if(&relativenumber == 1)
                set norelativenumber
                set number
        else
                set relativenumber
        endif
endfunc

" Vimgrep for notes
command! -nargs=1 Ngrep vimgrep "<args>" ~/notes/**/*.md
nnoremap ] :cn
nnoremap [ :cp
" }}}
" Autogroups {{{ 
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
" }}}
" Default Folding configs when opening this file
" vim:foldmethod=marker:foldlevel=0
