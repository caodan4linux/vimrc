""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetTitle()"
autocmd BufNewFile *.md exec ":call SetMDHead()"

"定义函数SetTitle，自动插入文件头
func SetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("$"), "")
        call append(line("$"), "\#--------------------------------------------------------------------")
        call append(line("$"), "\# File Name: ".expand("%"))
        call append(line("$"), "\# Description:")
        call append(line("$"), "\# Author: Dan Cao <caodan@linuxtoy.cn>")
        call append(line("$"), "\# Created Time: ".strftime("%Y-%m-%d %T"))
        call append(line("$"), "\#--------------------------------------------------------------------")
        call append(line("$"), "")
    elseif &filetype == 'python'
        call setline(1, "\#!/bin/env python")
        call append(line("$"), "\# -*- coding: utf-8 -*-")
        call append(line("$"), "")
        call append(line("$"), "\#--------------------------------------------------------------------")
        call append(line("$"), "\# File Name: ".expand("%"))
        call append(line("$"), "\# Description:")
        call append(line("$"), "\# Author: Dan Cao <caodan@linuxtoy.cn>")
        call append(line("$"), "\# Created Time: ".strftime("%Y-%m-%d %T"))
        call append(line("$"), "\#--------------------------------------------------------------------")
        call append(line("$"), "")
    else
	    call setline(1, "/*")
        call append(line("$"), " * File Name: ".expand("%"))
        call append(line("$"), " * Description:")
        call append(line("$"), " * Author: Dan Cao <caodan@linuxtoy.cn>")
        call append(line("$"), " * Created Time: ".strftime("%Y-%m-%d %T"))
        call append(line("$"), " *")
        call append(line("$"), " *   This program is free software; you can redistribute it and/or modify")
        call append(line("$"), " *   it under the terms of the GNU General Public License as published by")
        call append(line("$"), " *   the Free Software Foundation; either version 2 of the License, or")
        call append(line("$"), " *   (at your option) any later version.")
        call append(line("$"), " *")
        call append(line("$"), " *   This program is distributed in the hope that it will be useful,")
        call append(line("$"), " *   but WITHOUT ANY WARRANTY; without even the implied warranty of")
        call append(line("$"), " *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the")
        call append(line("$"), " *   GNU General Public License for more details.")
        call append(line("$"), " *")
        call append(line("$"), " *   You should have received a copy of the GNU General Public License")
        call append(line("$"), " *   along with this program; if not, write to the Free Software")
        call append(line("$"), " *   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA")
        call append(line("$"), " */")
        call append(line("$"), "")
    endif

    if &filetype == 'cpp'
        call append(line("$"), "#include <iostream>")
        call append(line("$"), "using namespace std;")
        call append(line("$"), "")
        call append(line("$"), "int main(int argc, char *argv[])")
        call append(line("$"), "{")
        call append(line("$"), "")
        call append(line("$"), "\treturn 0;")
        call append(line("$"), "}")

        "新建文件后，自动定位到指定位置
        autocmd BufEnter * normal 27gg
    endif

	if &filetype == 'c'
        call append(line("$"), "#include <unistd.h>")
        call append(line("$"), "#include <stdio.h>")
        call append(line("$"), "#include <stdlib.h>")
        call append(line("$"), "#include <string.h>")
        call append(line("$"), "")
        call append(line("$"), "int main(int argc, char *argv[])")
        call append(line("$"), "{")
        call append(line("$"), "")
        call append(line("$"), "\treturn 0;")
        call append(line("$"), "}")

        "新建文件后，自动定位到指定位置
        autocmd BufEnter * normal 29gg
    endif

    if &filetype == 'sh'
        autocmd BufEnter * normal G
    endif

    if &filetype == 'python'
        autocmd BufEnter * normal G
    endif

endfunc


func SetMDHead()
    " force to detect filetype again
    autocmd BufEnter * filetype detect

    call setline(1, "title: \"".expand("%s").("\""))
    " Date: Y-M-D H:M:S
    call append(line("$"), "date: ".strftime("%F %T"))
    call append(line("$"), "tags: Linux")
    call append(line("$"), "categories: [LSM]")
    call append(line("$"), "keywords: Linux")
    call append(line("$"), "description: ")
    call append(line("$"), "author: CaoDan")
    call append(line("$"), "mail: caodan@linuxtoy.cn")
    call append(line("$"), "---")
    call append(line("$"), "")


    autocmd BufEnter * normal gg

endfunc
