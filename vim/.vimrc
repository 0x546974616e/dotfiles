
" Ne pas assurer la compatibilit� avec l'ancien Vi.
set nocompatible

" Encodage UTF-8.
set encoding=utf-8

" S�lection �la souris.
set mouse=a

" Nombre de commandes dans l'historique.
set history=50

" Active la touche Backspace.
set backspace=2

" Autorise la passage d'une ligne � l'autre avec les fl�ches.
set whichwrap=<,>,[,]

" Tabs to Spaces
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab

autocmd FileType haskell setlocal ts=2 sw=2 sts=2
autocmd FileType make    setlocal noexpandtab

" Largeur max du texte.
set textwidth=80
set colorcolumn=81

" Essaye de garder le curseur sur la m�me colonne.
set nostartofline

" Affiche les commandes dans la barre de status.
set showcmd

" Affiche la paire de parenth�ses.
set showmatch

" Affiche le num�ro des lignes.
set number

" Active la backup.
set backup

" Active la coloration synxtaxique.
syntax on

" Affiche les whitespaces (��).
set list
set listchars=trail:�,tab:>-
" eol:�
" trail:�
" space:�
" nbsp:�

" Affiche les noms des onglets.
set showtabline=2

" Affiche un menu d'auto-compl�tion dans le mode ':'.
set wildmenu

" Active l'auto-indentation en mode insertion.
set autoindent

" Surligne la rechercher demand�e (:/).
set incsearch
" set hlsearch

" Relative number
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
    colorscheme base16-tomorrow-night-eighties
    highlight Comment guifg=#56a64a ctermfg=2
endif

" Netrw plugin
let g:netrw_liststyle    = 3
let g:netrw_banner       = 0
let g:netrw_browse_split = 0
let g:netrw_winsize      = 25

