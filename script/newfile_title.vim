""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
autocmd BufNewFile *.md exec ":call SetMDHead()"

"定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Description: ")
        call append(line(".")+2, "\# Author: CaoDan")
        call append(line(".")+3, "\# mail: caodan@linuxtoy.cn")
        call append(line(".")+4, "\# Created Time: ".strftime("%Y-%m-%d %T"))
        call append(line(".")+5, "\#########################################################################")
        call append(line(".")+6, "\#!/bin/sh")
        call append(line(".")+7, "")
    else
		call setline(1, "/*************************************************************************")
        call append(line("."), "  > File Name: ".expand("%"))
        call append(line(".")+1, "  > Description: ")
        call append(line(".")+2, "  > Author: CaoDan")
        call append(line(".")+3, "  > Mail: caodan@linuxtoy.cn ")
        call append(line(".")+4, "  > Created Time: ".strftime("%Y-%m-%d %T"))
        call append(line(".")+5, " ************************************************************************/")
        call append(line(".")+6, "")
    endif

    if &filetype == 'cpp'
        call append(line(".")+7, "#include <iostream>")
        call append(line(".")+8, "using namespace std;")
        call append(line(".")+9, "")
        call append(line(".")+10, "int main(int argc, char *argv[])")
        call append(line(".")+11, "{")
        call append(line(".")+12, "")
        call append(line(".")+13, "\treturn 0;")
        call append(line(".")+14, "}")

        "新建文件后，自动定位到指定位置
        autocmd BufEnter * normal 14gg
    endif

	if &filetype == 'c'
        call append(line(".")+7, "#include <unistd.h>")
        call append(line(".")+8, "#include <stdio.h>")
        call append(line(".")+9, "#include <stdlib.h>")
        call append(line(".")+10, "#include <string.h>")
        call append(line(".")+11, "")
        call append(line(".")+12, "int main(int argc, char *argv[])")
        call append(line(".")+13, "{")
        call append(line(".")+14, "")
        call append(line(".")+15, "\treturn 0;")
        call append(line(".")+16, "}")

        "新建文件后，自动定位到指定位置
        autocmd BufEnter * normal 16gg
    endif

endfunc


func SetMDHead()
    " force to detect filetype again
    autocmd BufEnter * filetype detect

    call setline(1, "title: \"".expand("%s").("\""))
    " Date: Y-M-D H:M:S
    call append(line("."), "date: ".strftime("%F %T"))
    call append(line(".")+1, "tags: Linux")
    call append(line(".")+2, "categories: [LSM]")
    call append(line(".")+3, "keywords: Linux")
    call append(line(".")+4, "description: ")
    call append(line(".")+5, "author: CaoDan")
    call append(line(".")+6, "mail: caodan@linuxtoy.cn")
    call append(line(".")+7, "---")
    call append(line(".")+8, "")


    autocmd BufEnter * normal gg

endfunc
