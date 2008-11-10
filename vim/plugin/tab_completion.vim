" Remap the tab key to do autocompletion or indentation depending on the
" context (from http://www.vim.org/tips/tip.php?tip_id=102)
function InsertTabWrapper() 
    let col = col('.') - 1 
    if !col || getline('.')[col - 1] !~ '\k' 
        return "\<tab>" 
    else 
        return "\<c-p>" 
    endif 
endfunction 
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

