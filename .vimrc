syntax on
set guicursor+=n:-blinkwait175-blinkoff150-blinkon175
set number relativenumber
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=4
set autoindent
set copyindent
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set smarttab
set hlsearch
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set history=1000
set undolevels=1000

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
highlight ColorColumn ctermbg=0 guibg=lightgrey


set pastetoggle=<F2>

" vim-plug plugin manager:
" commands:
" PlugUpdate [name ...] - install or update plugins
" PlugInstall [name ...] - install plugins
" PlugUpgrade Upgrade vim-plug itself
" PlugStatus Check status of plugins
"
"    ____  __            _           
"   / __ \/ /_  ______ _(_)___  _____
"  / /_/ / / / / / __ `/ / __ \/ ___/
" / ____/ / /_/ / /_/ / / / / (__  )  plugins
"/_/   /_/\__,_/\__, /_/_/ /_/____/  
"              /____/             
call plug#begin('~/.vim/plugged')
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'dominikduda/vim_current_word'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/nvie/vim-togglemouse'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'zivyangll/git-blame.vim'
Plug 'preservim/nerdtree'
Plug 'dyng/ctrlsf.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
call plug#end()

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

 let g:ctrlsf_ackprg = '/usr/local/bin/rg'
 let g:ctrlsf_winsize = '100'
colorscheme monokai_pro
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
inoremap <C-c> <esc>

nmap <silent> ,/ :nohlsearch<CR>

"move line under cursor with keys
nnoremap <A-Up> :m-2<CR>
nnoremap <A-j> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>

nnoremap j gj
nnoremap k gk

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
 nmap <leader>gd <Plug>(coc-definition)
 nmap <leader>gy <Plug>(coc-type-definition)
 nmap <leader>gi <Plug>(coc-implementation)
 nmap <leader>gr <Plug>(coc-references)
 nmap <leader>rr <Plug>(coc-rename)
 nmap <leader>g[ <Plug>(coc-diagnostic-prev)
 nmap <leader>g] <Plug>(coc-diagnostic-next)
 nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
 nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
 nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

"Project-wide fuzzy search
function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
nnoremap <C-p> :ProjectFiles<CR>

