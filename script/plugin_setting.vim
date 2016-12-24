"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"	caodan2519@gmail.com
"
" mapleader is set as ',' in the the plugin_setting.vim
" about the map options
" noremap	表示不会递归映射
" inoremap	只有在插入模式下生效
" vnoremap	只有在visual模式下生效
" nnoremap	只有在normal模式下生效
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","


"--------------------  about taglist  ------------------------------------
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Show_One_File = 1 
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
"let Tlist_Sort_Type = "name"

"--------------------  about netrw  ------------------------------------
"输入 ",fe" 就可以打开文件在左边窗口打开宽度为30的文件浏览器
let g:netrw_winsize = 30
nmap <leader>fe :Sexplore!<cr>

"--------------------  about BufExplorer  -------------------------------
let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 


"--------------------  about win_manager  -------------------------------
"winmanager is available only if "compatilble" is not set
let g:winManagerWindowLayout = "FileExplorer|BufExplorer"
let g:bufExplorerMaxHeight=30
let g:winManagerWidth = 40
let g:defaultExplorer = 0 
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <leader>wm :WMToggle<cr> :TlistToggle<cr>

"--------------------  about YouCompleteMe  -------------------------------
"让vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu

"配置默认的ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

"打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_confirm_extra_conf=0

"使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tag_files=1

"从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2

" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

"在注释输入中也能补全
let g:ycm_complete_in_comments = 1

"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:pymode_rope_complete_on_dot = 0

nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

"--------------------  about syntastic -------------------------------
let g:syntastic_error_symbol = '✗'		"set error or warning signs
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1	"whether to show balloons

" ------------------------ about vimwiki ---------------------------
let g:vimwiki_list_ignore_newline=0
let wiki = {}
let wiki.path = '/data/mywiki/linux/vimwiki'
let wiki.path_html = '/data/mywiki/linux/vimwiki_html'
let wiki.nested_syntaxes = {'python': 'python', 'c++': 'cpp', 'c': 'c', 'bash': 'sh', 'lisp': 'lisp'}

let new_wiki = {}
let new_wiki.path = '/data/repo/blog/source/_posts'
let new_wiki.syntax = 'markdown'
let new_wiki.ext = '.md'

let g:vimwiki_list = [wiki, new_wiki]

nnoremap <leader>html :Vimwiki2HTML<CR>
nnoremap <leader>htmla :VimwikiAll2HTML<CR>

" ------------------------ about pathogen ---------------------------
execute pathogen#infect()


" ------------------------ about vim-flake8 ---------------------------
autocmd FileType python map   :call Flake8()
let g:flake8_builtins="_,apply"
let g:flake8_ignore="E501,W293"

let g:vim_markdown_folding_disabled=1
