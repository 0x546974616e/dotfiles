
" Do not make Vim compatible with old Vi.
set nocompatible

" UTF-8 encoding.
set encoding=utf-8

" Mouse selection.
set mouse=a

" History maximum commands.
set history=50

" Enable Backspace key.
set backspace=2

" Enable moving the cursor to one line to another with the arrow keys.
set whichwrap=<,>,[,]

" Tabs to Spaces
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd FileType haskell setlocal ts=2 sw=2 sts=2
autocmd FileType yaml setlocal ts=2 sw=2 sts=2
autocmd FileType make setlocal noexpandtab

" Typst
autocmd BufEnter *.typ syntax spell toplevel
autocmd BufEnter *.typ setlocal
  \ wrap textwidth=0 wrapmargin=0 linebreak
  \ spell spelllang+=fr complete+=kspell

" Max text width (can be something annoying).
set textwidth=80
set colorcolumn=81

" Try to keep the cursor on the same column.
set nostartofline

" Show commands in the status bar.
set showcmd

" Show matching bracket.
set showmatch

" Show number of lines.
set number

" Enable backup file (~).
set backup

" Enable syntax highlightings.
syntax on

" Show whitespaces (¬·).
set list
set listchars=trail:·,tab:>-
" eol:¬
" trail:·
" space:·
" nbsp:·

" Always show tab names.
set showtabline=2

" Show completion menu in command-line mode (:).
set wildmenu

" Enable auto indent in insert mode.
set autoindent

" Hightlight current search (/).
set incsearch
" set hlsearch

" Relative number.
set relativenumber

" Fold column size.
" set foldcolumn=1

" Filetype.
augroup filetypedetect
  au BufRead,BufNewFile *.lxx,*.lpp,*.txx,*.tpp setlocal filetype=cpp
augroup END

" Inverse j/k
"noremap k j|noremap <C-w>k <C-w>j|noremap <C-w><C-k> <C-w>j
"noremap j k|noremap <C-w>j <C-w>k|noremap <C-w><C-j> <C-w>k

" The last window will always have a status line.
"set laststatus=2

" Remove last line message (in Insert, Replace or Visual mode).
"set noshowmode

" Locate cursor.
"nnoremap <F3> :set cursorcolumn! cursorline!<CR>

"highlight CursorLine   term=reverse ctermbg=242 guibg=Grey40 cterm=none
"highlight CursorColumn term=reverse ctermbg=242 guibg=Grey40 cterm=none

" Color scheme base16.
if (has("termguicolors"))
  set termguicolors
  " https://github.com/chriskempson/base16-vim
  colorscheme base16-tomorrow-night-eighties
  " colorscheme base16-tomorrow
  highlight Comment guifg=#56a64a ctermfg=2
endif

" Netrw plugin
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_browse_split = 0
let g:netrw_winsize = 25

" Column
set scrolloff=8
set signcolumn=no

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap S :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap Q <nop>

