set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ----- Making Vim look good ---------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
"Plugin 'vim-scripts/Conque-GDB'

"Plugin 'rip-rip/clang_complete'
Plugin 'Chiel92/vim-autoformat'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
"Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-scripts/a.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

"------- Git ------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'wincent/command-t'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set smartindent
autocmd BufRead,BufWritePre *.sh normal gg=G	" When you load/save a shell script, auto indent it


" ----- altercation/vim-colors-solarized settings -----
"syntax on
"set background=dark
"let g:solarized_termcolors=256
colorscheme molokai


" ----- bling/vim-airline settings -----
set laststatus=2			" Always show statusbar
let g:airline_powerline_fonts = 1	" Fancy arrow symbols, requires a patched font
let g:airline_detect_paste=1		" Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1 " Show airline for tabs too
let g:airline_theme='powerlineish'


" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
"let g:nerdtree_tabs_open_on_console_startup = 1

" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
	au!
	au FileType tex let b:syntastic_mode = "passive"
augroup END

"----- vim-scripts/Conque-GDB settings -----
"let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
"let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
"let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly


" ----- xolox/vim-easytags settings -----
"  " Where to look for tags files
set tags=./tags;,~/.vimtags
"  " Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
"
"  " ----- majutsushi/tagbar settings -----
"  " Open/close tagbar with \1 (One)
nmap <silent> <leader>1 :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


"------------clang-complete-------------
"let g:clang_library_path='/usr/lib64/llvm/libclang.so' "path directly to the library file

"--------------------YCM----------------
"let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py" 
"let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
"autocmd FileType c,cpp,python let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
"autocmd FileType c,cpp,python let g:ycm_collect_identifiers_from_tags_files = 1
"autocmd FileType c,cpp,python let g:ycm_complete_in_comments = 0
"autocmd FileType c,cpp,python let g:ycm_complete_in_strings = 0
"autocmd FileType c,cpp,python let g:ycm_confirm_extra_conf = 0

"--------------------AutoFormat----------------
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0
noremap <F3> :Autoformat<CR>


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
	au!
	au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
	au FileType tex let b:delimitMate_quotes = ""
	au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
	au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" ----- jez/vim-superman settings -----
" better man page support
noremap K :SuperMan <cword><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=1000	" keep 1000 lines of command line history
set number		" line numbers
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set linebreak		" wrap lines on 'word' boundaries
set scrolloff=3		" don't let the cursor touch the edge of the viewport
set splitright		" Vertical splits use right half of screen
set timeoutlen=100	" Lower ^[ timeout
set fillchars=fold:\ ,	" get rid of obnoxious '-' characters in folds

hi clear SignColumn	" We need this for plugins like Syntastic and vim-gitgutter which put symbols in the sign column.

set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal-as-GUI settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('mouse')		" In many terminal emulators the mouse works just fine, thus enable it.
	set mouse=a
endif

if &t_Co > 2 || has("gui_running")
	syntax on		" Switch syntax highlighting on, when the terminal has colors
	set hlsearch		" Also switch on highlighting the last used search pattern.
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shift+Arrow Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>





" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
