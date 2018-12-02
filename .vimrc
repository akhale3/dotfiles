" Essentials
set nocompatible                                " vi improved
filetype off                                    " disable filetype detection
set expandtab                                   " tab to space
set shiftwidth=2                                " 1 tab = 2 spaces
set softtabstop=2                               " 1 tab = 2 spaces
set t_Co=16                                     " 16-bit color support for solarized theme
set hidden                                      " hide buffers instead
set number                                      " show line numbers
set relativenumber                              " active line number is always 0
set nobackup                                    " disable inbuilt backup
set noswapfile                                  " disable inbuilt swap
set showmatch                                   " set show matching parenthesis
set ignorecase                                  " ignore case when searching
set smartcase                                   " ignore case if search pattern is all lowercase,
                                                "    case-sensitive otherwise
set copyindent                                  " copy the previous indentation on autoindenting
set hlsearch                                    " highlight search terms
set incsearch                                   " show search matches as you type
set history=1000                                " remember more commands and search history
set undolevels=1000                             " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                                       " change the terminal's title
set visualbell                                  " don't beep
set noerrorbells                                " don't beep
set timeoutlen=1000 ttimeoutlen=0               " eliminate delays when leaving INSERT mode

" Package Manager - Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                      " vundle manages vundle
Plugin 'jelera/vim-javascript-syntax'           " javascript syntax highlighting
Plugin 'pangloss/vim-javascript'                " javascript extra syntax highlighting with indendation fixes
Plugin 'nathanaelkane/vim-indent-guides'        " javascript indentation highlighting
Plugin 'Raimondi/delimitMate'                   " automatically match closing quotes, paranthesis, etc.
Plugin 'scrooloose/syntastic'                   " linter helper
Plugin 'flazz/vim-colorschemes'                 " color scheme one-stop shop
Plugin 'bling/vim-airline'                      " bottom status bar
Plugin 'vim-airline/vim-airline-themes'         " vim-airline theme shop
Plugin 'tpope/vim-fugitive'                     " git wrapper
Plugin 'scrooloose/nerdtree'                    " file explorer
Plugin 'kien/ctrlp.vim'                         " fuzzy finder
Plugin 'airblade/vim-gitgutter'                 " git gutter
Plugin 'yggdroot/indentline'                    " display indentations with thin vertical lines
Plugin 'tpope/vim-surround'                     " commands for simplifying quoting and paranthesis
Plugin 'tpope/vim-repeat'                       " enable . to repeat plugin maps
Plugin 'tpope/vim-commentary'                   " better code commenting
Plugin 'tpope/vim-unimpaired'                   " easier movement between linting errors
Plugin 'mtscout6/syntastic-local-eslint.vim'    " prefer local eslint over global
Plugin 'editorconfig/editorconfig-vim'          " set editor preferences as per .editorconfig

call vundle#end()
filetype plugin indent on

" Look and feel
let mapleader = ','                             " remap leader to comma
syntax on                                       " enable syntax highlighting
let g:solarized_termtrans = 16                  " solarized theme
let g:solarized_termcolors = 16
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
colorscheme solarized 
let g:airline_powerline_fonts = 1
let g:airline_theme = 'solarized'
let g:airline_solarized_bg = 'dark'             " vim-airline theme
let g:airline#extensions#tabline#enabled = 1    " enable smarter tabline
map <C-n> :NERDTreeToggle<CR>                   " toggle NERDTree
let g:ctrlp_map = '<c-p>'                       " override default command for CtrlP
let g:ctrlp_cmd = 'CtrlP'                       " override default command for CtrlP
let g:ctrlp_working_path_mode = 'ra'            " CtrlP search in current directory
augroup numbertoggle                            " automatically switch between hybrid and absolute line numbers
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set colorcolumn=80                              " show ruler at 80 characters
nnoremap <Left> :echoe "Use h"<CR>              " disable left arrow key
nnoremap <Right> :echoe "Use l"<CR>             " disable right arrow key
nnoremap <Up> :echoe "Use k"<CR>                " disable up arrow key
nnoremap <Down> :echoe "Use j"<CR>              " disable down arrow key
let g:syntastic_javascript_checkers=['eslint']  " use eslint syntastic checker
