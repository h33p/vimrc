let g:Imap_FreezeImap=1

call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
call plug#end()

let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]

set completeopt-=preview
let g:ycm_show_diagnostics_ui = 0
let g:syntastic_enable_highlighting = 1

let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\     'left':[ [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\     ]
\   },
\   'component': {
\     'lineinfo': '%3l:%-2v'
\   },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\   }
\ }

let g:lightline.separator = {
\   'left': '', 'right': ''
\}

let g:lightline.subseparator = g:lightline.separator 

let g:lightline.tabline = {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ]
\ }

" Colour scheme
syntax on
colorscheme onedark

" Some lightline options
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set laststatus=2
set noshowmode

" Toggle relative line numbers with the current line displayed absolutely
set number relativenumber

" Highlight current line
set cursorline

set tabstop=4
set shiftwidth=4

let g:ycm_auto_hover = ''
nmap <leader>D <plug>(YCMHover)
