" Plugins{{{
call plug#begin('~/.vim/plugged')
Plug 'flazz/vim-colorschemes'
Plug 'scrooloose/nerdtree',{'on': 'NERDTreeToggle'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()
"}}}
" General Settings {{{
" Modeline
set modeline
set modelines=1 "check the very last line of this file for modeline

" UI
colorscheme hybrid  " set colorscheme
set background=dark " set dark background
set number          " turn on line numbering
set colorcolumn=100 " set marker for 100th column
syntax on           " turn on syntax highlighting
set cursorline      " highlight current line
set lazyredraw      " don't bother with redrawing screens in the middle of macros
set showmatch       " highlights matching [{()}]
set shortmess+=I    " turn off welcome screen

" Misc.
filetype plugin indent on " turn on file type detection
set wildmenu              " enable wildmenu
set belloff=all           " turn off beeping
set encoding=utf-8        " use utf-8 encoding

" Tabs
set tabstop=4     " number of visual spaces per TAB
set softtabstop=4 " number of spaces in TAB while editting
set expandtab     " Pressing TAB = inserting n spaces

" Search (/)
set hlsearch   " highlight matches
set incsearch  " show partial matches for search phrase
set ignorecase " ignore upper/lower cases when searching
"}}}
"{{{ Plugin settings
" Airline
set showcmd                   " show last command in bottom bar
set laststatus=2              " turn on airline
let g:airline_theme='badwolf' " looks nice with hybrid colorscheme

" vim-markdown
let g:vim_markdown_folding_disabled = 1 "disable auto folding in markdown

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" }}}
" Remapping/Custom functions {{{
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

" Moving from 1 window to another Ctrl-hjkl
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"Toggle number line
nnoremap <leader>1 :set number! number?<CR>

"Toggle relativenumber
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
