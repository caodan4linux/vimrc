"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"	caodan@linuxtoy.cn
" Sections:
"    -> General
"           tags, vundle settings, plugin settings, general configs(autoread,
"           noswap, statusline, hilight search, show cmd, setnu, ...)
"    -> Colors and Fonts
"           syntax on, colorscheme, encoding, 
"    -> Text, tab and indent related
"           tab settings, indent
"    -> Visual mode related
"           visual mode key bindings(eg: search, replace...)
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Misc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------  about tags  ------------------------------------
" Project settings

set path=
set path+=./include
set path+=/usr/include

set autochdir
set tags=tags;

:cs add /usr/include/cscope.out /usr/include

"-------------------- vundle setting ----------------------
source ~/.vim/script/vundle-setting.vim

"打开文件类型检测
set nocp				"compatilble is not set, equal to 'set nocompatible' 
filetype on				"侦测文件类型
filetype plugin on		"载入文件类型插件
filetype indent on		"为特定文件类型载入相关缩进文件

"-------------------- plugin setting ----------------------
source ~/.vim/script/plugin_setting.vim
source ~/.vim/script/newfile_title.vim
source ~/.vim/script/help_functions.vim


" Set to auto read when a file is changed from the outside
set autoread
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set noswapfile
set nowb
set confirm		"在处理未保存或只读文件的时候，弹出确认提示

" 我的状态行显示的内容（包括文件类型和解码）
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2        " 2 present 总是显示状态行, 1 present do not show

" For Search Options
" set ignorecase   "搜索忽略大小写
set hlsearch	"搜索逐字符高亮
set smartcase	" When searching try to be smart about cases 
set incsearch	" Makes search act like search in modern browsers

" Show matching brackets when text indicator is over them
set showmatch
set nu
set cursorline
set showcmd    "显示在normal模式中输入的命令

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
syntax on
colorscheme desert
" Set utf8 as standard encoding and en_US as the standard language
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set noexpandtab  "不要使用空格代替制表符
set expandtab  "使用空格代替制表符
set tabstop=4  "Tab的宽度为4
set softtabstop=4
set shiftwidth=4

set autoindent
set cindent
set cino=g0,:0  "设置switch case语句中case与switch之间的缩进为0

set backspace=indent,eol,start   "不然无法使用退格键删除
set backspace=2 "使回格键（backspace）正常处理indent, eol, start等

autocmd Filetype gitcommit setlocal spell textwidth=72

"set fdm=syntax	" fold method


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing n or N searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> n :call VisualSelection('f')<CR>
vnoremap <silent> N :call VisualSelection('b')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
 map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
" map <leader>g :vimgrep // <C-R>%<C-A><left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>



"--------------------  about cscope  ------------------------------------
:set cscopequickfix=s-,c-,d-,i-,t-,e-
" the map is used to find the 
" s: symbol
" c: where be called
" d: which function it calls
" i: which file include this file
vnoremap <silent> <leader>fs :call VisualSelection('cscope_fs')<CR><CR>:copen<CR>
vnoremap <silent> <leader>fc :call VisualSelection('cscope_fc')<CR><CR>:copen<CR>
vnoremap <silent> <leader>fd :call VisualSelection('cscope_fd')<CR><CR>:copen<CR>
vnoremap <silent> <leader>fi :call VisualSelection('cscope_fi')<CR><CR>:copen<CR>



