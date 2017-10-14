"-------------------- set the vundle --------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()


" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" original repos on GitHub
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
" 实时语法检查
Bundle 'scrooloose/syntastic'
" 自动补全单引号 双引号
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion' 
Bundle 'Raimondi/delimitMate'
Bundle 'rstacruz/sparkup'
" python complete plugin
Bundle 'davidhalter/jedi-vim'
"Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'

" http://vim-scripts.org/vim/scripts.html
Bundle 'taglist.vim'
Bundle 'winmanager'
Bundle 'bufexplorer.zip'
Bundle 'filetype.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'vim-flake8'
Bundle 'vimwiki'
Bundle 'pathogen.vim'
Bundle 'xml.vim'
Bundle 'matrix.vim'


" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'


" All of your Plugins must be added before the following line
call vundle#end()   "required

filetype plugin indent on     " required!

" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" NOTE: comments after Bundle command are not allowed..

