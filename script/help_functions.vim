
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
" 1. VisualSelection
"   args:
"       b:  search before
"       f:  search forward
"       replace: replace the selection
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    elseif a:direction == 'cscope_fs'
        call CmdLine("cs f s " . ''. l:pattern . '')
    elseif a:direction == 'cscope_fc'
        call CmdLine("cs f c " . ''. l:pattern . '')
    elseif a:direction == 'cscope_fd'
        call CmdLine("cs f d " . ''. l:pattern . '')
    elseif a:direction == 'cscope_fi'
        call CmdLine("cs f i " . ''. l:pattern . '')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


