autocmd BufRead,BufNewFile *.py on 
autocmd BufRead,BufNewFile *.py set ai
:syntax on
filetype plugin indent on
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml set ai sw=2 sts=2 et
augroup END
set ai
set sts=2
set sw=2
set autoindent
set smarttab
set number
imap <C-l> <space>=><space>
map <leader>t :FuzzyFinderTextMate<CR>
set go-=T

" MacVim appearance settings
set bg=dark
if &background == "dark"
    hi normal guibg=black
endif

" Map \r to run current file with ruby, and \rf to run test by current word
nmap <leader>r :!ruby %<CR>
nmap <leader>rs :Scratch 'ruby ' . expand('%')<CR>
nmap <leader>rf :Execruby expand('%') . " --name='/" . RubyTestName() . "/'"<CR>

" Make a new line, and then jump back to ctrl mode
nmap <leader>o o<Esc>

" Activate yaml plugin on .yaml or .yml
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/plugin/yaml.vim

" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_

" Automatic double quoting a la textmate
inoremap (( ()<Esc>i
inoremap [[ []<Esc>i
inoremap {{ {}<Esc>i
inoremap '' ''<Esc>i
inoremap "" ""<Esc>i
inoremap `` ``<Esc>i

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz

" align plugin stuff
call Align#AlignCtrl('=p1P0')
nmap <leader>a :Align : =><CR>
vmap <leader>a :Align : =><CR>

" window splitting mappings
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

