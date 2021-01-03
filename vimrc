call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'rust-lang/rust.vim'
Plug 'Yggdroot/indentLine'
Plug 'zivyangll/git-blame.vim'
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
call plug#end()

let g:lightline = {
\   'colorscheme': 'onedark',
\   'active': {
\     'left':[ [ 'mode', 'paste' ],
\              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
\     ],
\     'right': [['lineinfo'], ['percent'], ['cocstatus', 'fileformat', 'fileencoding', 'filetype']]
\   },
\   'component': {
\     'lineinfo': '%3l:%-2v'
\   },
\   'component_function': {
\     'cocstatus': 'coc#status',
\     'gitbranch': 'fugitive#head',
\   }
\ }
let g:lightline.separator = {
\   'left': "\ue0b0", 'right': "\ue0b2"
\}
let g:lightline.subseparator = g:lightline.separator

let g:lightline.tabline = {
\   'left': [ ['tabs'] ],
\   'right': [ ['close'] ]
\ }

" Colour scheme
syntax on
colorscheme onedark

highlight CursorLine ctermbg=234
highlight CursorLineNr ctermfg=39 ctermbg=234
highlight LineNr ctermbg=234
highlight SyntasticWarningSign ctermfg=173

" Indent lines
let g:indentLine_setColors = 1
let g:indentLine_color_term=239
let g:indentLine_char = '▏'
let g:indentLine_concealcursor = 0

" Some lightline options
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set laststatus=2
set noshowmode

set signcolumn=yes

" Toggle relative line numbers with the current line displayed absolutely
set number relativenumber

" Highlight current line
set cursorline

" Default language settings
set tabstop=4
set shiftwidth=4

" rust.vim
filetype plugin indent on

" CoC configuration
inoremap <expr> <c-@> coc#refresh()

inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ "\<TAB>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

call coc#config("rust-analyzer.completion.addCallArgumentSnippets", "false")
call coc#config("diagnostic.errorSign", "\u2717")
call coc#config("diagnostic.infoSign", "\u1F6C8")
call coc#config("diagnostic.hintSign", "\u2192")

" Autopairs
let g:AutoPairsShortcutFastWrap = '<C-e>'
let g:AutoPairsShortcutBackInsert = '<C-b>'
let g:AutoPairsFlyMode = 0

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeCustomOpenArgs = {'file':{'where':'t'}}

" Other Keybindings
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

nnoremap <F12> :call ToggleColumns()<CR>
if has("patch-8.1.1564")
	set signcolumn=number
else
	function! ToggleColumns()
		if &signcolumn == 'no'
			set signcolumn=yes
		else
			set signcolumn=no
		endif
	endfunction
endif


" Misc.
set updatetime=1000

" Language specific options
autocmd Filetype javascript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype javascriptreact setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2

" Some LaTeX thing
let g:Imap_FreezeImap=1

