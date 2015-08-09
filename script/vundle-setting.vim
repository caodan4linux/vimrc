"-------------------- set the vundle --------------------
set nocompatible              " be iMproved
filetype off                  " required!

" set the vundle work path
set rtp+=~/.vim/bundle/vundle/
" init the Bundle
call vundle#rc()

" let Vundle manage Vundle
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

" vim-scripts repos
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

Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'


" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'


filetype plugin indent on     " required!
" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" NOTE: comments after Bundle command are not allowed..

