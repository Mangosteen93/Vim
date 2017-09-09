" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Switch syntax highlighting on, when the terminal has colors
if (has("gui_running")) && !exists("syntax_on")
    syntax on
endif

" Javascript syntax hightlight
syntax enable

" Set syntax highlighting for specific file types
autocmd BufRead,BufNewFile Appraisals set filetype=ruby
autocmd BufRead,BufNewFile *.md set filetype=markdown
" autocmd Syntax javascript set syntax=jquery

" Color scheme
colorscheme molokai
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0
" 背景透明
hi Normal  ctermfg=252 ctermbg=none

" Backspace deletes like most programs in insert mode
set backspace=2
" Show the cursor position all the time
set ruler
" Display incomplete commands
set showcmd
" Set fileencodings
set fileencodings=utf-8,bg18030,gbk,big5

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Make it obvious where 80 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

set matchpairs+=<:>
set hlsearch

" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
" set cursorline cursorcolumn
set cursorline

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible " Use Vim defaults instead of 100% vi compatibility

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

"==========Vundle相关==========
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'mbbill/undotree'
Bundle 'junegunn/limelight.vim'
Bundle 'terryma/vim-smooth-scroll'
Bundle 'terryma/vim-multiple-cursors'

" My Bundles here:
 " 以后想安装什么插件可以写在下面
 "
 " original repos on github
 " 如果你的插件来自github，写在下方，只要作者名/项目名就行了
 " Bundle 'tpope/vim-fugitive' #如这里就安装了vim-fugitive这个插件
 " Bundle 'Lokaltog/vim-easymotion'
 " Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
 " Bundle 'tpope/vim-rails.git'
 "
 " vim-scripts repos
 " 如果插件来自 vim-scripts，你直接写插件名就行了
 " Bundle 'L9'
 " Bundle 'FuzzyFinder'
 "
 " non github repos
 " 如使用自己的git库的插件，像下面这样做
 " Bundle 'git://git.wincent.com/command-t.git'
 " git repos on your local machine (ie. when working on your own plugin)
 " Bundle 'file:///Users/gmarik/path/to/plugin'
 " ...
 "
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" All of your Plugins must be added before the following line
call vundle#end()            " required
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


" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F5> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F6> :TagbarToggle<CR>

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" ag instead of grep
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
"   " Use ag in CtrlP for listing files.
"   let g:ctrlp_user_command = 'ag %s -l --nocolor -g \"\"'
"   " Ag is fast enough that CtrlP doesn't need to cache
"   let g:ctrlp_use_caching = 0
" endif

set laststatus=2
" vim-fugitive
" set statusline+=%{fugitive#statusline()} "  Git Hotness

" vim-airline
let g:airline#extensions#tabline#enabled = 1

" undotree
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" limelight
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
