autocmd BufRead,BufNewFile *.py on 
autocmd BufRead,BufNewFile *.py set ai
:syntax on
filetype plugin indent on
augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml set ai sw=2 sts=2 et
  autocmd FileType javascript set nosmarttab indentexpr=
  autocmd BufNewFile,BufRead *.json_builder setf ruby
  autocmd BufNewFile,BufRead *.red setf ruby
augroup END
set ai
set sts=2
set sw=2
set autoindent
set smarttab
set number

augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END

imap <C-l> <space>=><space>

map <leader>t :FuzzyFinderTextMate<CR>
let g:fuzzy_matching_limit=60
let g:fuzzy_ceiling=20000

" Configuration option: g:fuzzy_ignore
" A delimited list of file glob patterns to ignore. Entries may be delimited
" with either commas or semi-colons.
if !exists('g:fuzzy_ignore')
  let g:fuzzy_ignore = "vendor/**/*.rb"
endif

set go-=T

" MacVim appearance settings
set bg=dark
if &background == "dark"
    hi normal guibg=black
endif

" Map \r to run current file with ruby, and \rf to run test by current word
nmap <leader>r :!ruby %<CR>
nmap <leader>rs :Scratch 'ruby ' . expand('%')<CR>
nmap <leader>ra :RunAllRubyTests<CR>
nmap <leader>rc :RunRubyFocusedContext<CR>
nmap <leader>rf :RunRubyFocusedUnitTest<CR>

" Make a new line, and then jump back to ctrl mode
nmap <leader>o o<Esc>

" Activate yaml plugin on .yaml or .yml
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/plugin/yaml.vim

" Make it way easier to switch windows (<leader>w)
nmap <leader>w <C-w><C-w>_

" jump out of brackets or quotes
imap <C-o> <Esc>la

" search next/previous -- center in page
nmap n nzz
nmap N Nzz
nmap * *Nzz
nmap # #nzz

" window splitting mappings
nmap <leader>v :vsplit<CR> <C-w><C-w>
nmap <leader>s :split<CR> <C-w><C-w>

" nerd tree
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

:colorscheme vividchalk 

set wildmenu
set incsearch
set hls
set ruler

map ; :nohlsearch<CR>

" remap motions to the ones from the camelcase motions plugin so that w b and
" e motions don't suck so bad
"
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e 

" map ^ to H
map H ^

let &t_SI = "\<Esc>]14;purple\x7"
let &t_EI = "\<Esc>]12;blue\x7"

