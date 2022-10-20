set ignorecase smartcase
set lazyredraw
set backspace=indent,eol,start
set laststatus=2
set statusline=[%n]\ %<%f%h%m
"set statusline=[%n]\
syntax on
set langmap=!№\\%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!#%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"setlocal spell spelllang=ru_yo,en_us
set nospell
set spellfile=~/.config/nvim/spell/vimspell.utf-8.add
set wrap linebreak
set clipboard=unnamedplus
set guicursor+=n:-blinkwait175-blinkoff150-blinkon175
set number relativenumber
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set wrapmargin=0
set tw=120
set shiftwidth=4
set autoindent
set copyindent
set expandtab
set smartindent
set nu
set smartcase
set smarttab
set hlsearch
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set history=1000
set undolevels=1000
set formatoptions+=t
set encoding=UTF-8
set formatoptions-=l
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=750
set mouse=a
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=120
set diffopt+=vertical

set pastetoggle=<F2>
set sessionoptions-=options

"highlight ColorColumn ctermbg=0 guibg=lightgrey

" set autochdir and disable auto-vim-rooter
set autochdir

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

let g:rooter_cd_cmd="lcd"
let g:rooter_manual_only = 1
let $FZF_DEFAULT_COMMAND = 'find .'

let mapleader = " "


" AUTOCLOSE TAGS
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'jsx,html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'"

" twins of word under cursor:
let g:vim_current_word#highlight_twins = 1
" the word under cursor:
let g:vim_current_word#highlight_current_word = 1

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
let g:nerdtreeignore = ['^node_modules$']
let g:ctrlsf_ackprg = '/usr/local/bin/rg'
"let g:ctrlsf_winsize = '100'
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'down': '~50%' }
"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window':  { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }}

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--glob=!git/*",
        \ "--hidden",
    \ ]

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-styled-components',
  \ 'coc-omnisharp',
  \ ]

let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 1,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

let g:airline#extensions#default#layout = [
  \ [ 'a', 'b', 'c' ],
  \ [ 'z', 'error', 'warning' ]
  \ ]

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

let projectDir = s:find_git_root()

function! AirlineInit()
    let g:airline_section_a = airline#section#create(['mode'])
endfunction
autocmd VimEnter * call AirlineInit()

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'alvan/vim-closetag'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'dominikduda/vim_current_word'
  Plug 'morhetz/gruvbox'
  Plug 'vim-utils/vim-man'
  Plug 'mbbill/undotree'
  Plug 'sheerun/vim-polyglot'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tomarrell/vim-npr'
  Plug 'brooth/far.vim'
  Plug 'https://github.com/nvie/vim-togglemouse'
  Plug 'https://github.com/tpope/vim-surround'
  Plug 'https://github.com/ap/vim-css-color'
  Plug 'zivyangll/git-blame.vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-rooter'
  Plug 'dyng/ctrlsf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'flazz/vim-colorschemes'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'jiangmiao/auto-pairs'
  Plug 'https://github.com/AndrewRadev/tagalong.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'https://github.com/fritzlolpro/harpoon.git'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'rbgrouleff/bclose.vim'
  Plug 'francoiscabrol/ranger.vim'
  Plug 'windwp/nvim-spectre'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'https://github.com/p00f/nvim-ts-rainbow'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  Plug 'https://github.com/tom-anders/telescope-vim-bookmarks.nvim'
  Plug 'nvim-treesitter/nvim-treesitter-context'
  Plug 'phaazon/hop.nvim'
  Plug 'https://github.com/tpope/vim-commentary'
  Plug 'https://github.com/JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'Yilin-Yang/vim-markbar'

call plug#end()

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

nmap <leader>pa :let @" = expand("%:p")<cr>
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <C-p> :ProjectFiles<CR>
nnoremap <Leader>pf :Files %:p:h<CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>fp :echo expand('%:p')<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
inoremap <C-c> <esc>
nnoremap <leader>b :NERDTree<CR>
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>
nmap <silent> ,/ :nohlsearch<CR>
noremap <C-w> :tabclose <CR>
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP
nnoremap j gj
nnoremap k gk

" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr><TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo coc code navigation.
inoremap <silent><expr><C-space> coc#refresh()
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next)
nmap <leader>cf :CocCommand prettier.formatFile<CR>
nmap <leader>ca <Plug>(coc-codeaction)
nnoremap <leader>cr :CocRestart<CR>

"move line under cursor with keys
vnoremap <A-Up> :m-2<CR>
vnoremap <A-Down> :m+<CR>
nnoremap <A-Up> :m-2<CR>
nnoremap <A-Down> :m+<CR>
inoremap <A-Up> <Esc>:m-2<CR>
inoremap <A-Down> <Esc>:m+<CR>

nnoremap <leader>ss :mks! ~/Documents/programming/vim-sessions/session.vim<CR>
nnoremap <leader>sr :so ~/Documents/programming/vim-sessions/session.vim<CR>

" Colors: {{{
augroup ColorschemePreferences
  autocmd!
  " These preferences clear some gruvbox background colours, allowing transparency
"  autocmd ColorScheme * highlight Normal     ctermbg=NONE guibg=NONE
"  autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
"  autocmd ColorScheme * highlight Todo       ctermbg=NONE guibg=NONE
  " Link ALE sign highlights to similar equivalents without background colours
  autocmd ColorScheme * highlight link ALEErrorSign   WarningMsg
  autocmd ColorScheme * highlight link ALEWarningSign ModeMsg
  autocmd ColorScheme * highlight link ALEInfoSign    Identifier
augroup END

" Use truecolor in the terminal, when it is supported
if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_guisp_fallback = "bg"
" Changes dark mode contrast. Overrides g:gruvbox_contrast option. Possible values are soft, medium and hard.
let g:gruvbox_contrast_dark = "hard"
set background=dark
autocmd vimenter * ++nested colorscheme gruvbox
"autocmd vimenter * ++nested colorscheme sublimemonokai
" }}}

" ALE: {{{
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_info = '·'
let g:ale_sign_style_error = '·'
let g:ale_sign_style_warning = '·'

let g:ale_linters = { 'cs': ['OmniSharp'] }
" }}}

" OmniSharp: {{{
" Set this to 1 to use ultisnips for snippet handling
let s:using_snippets = 0
let g:OmniSharp_popup_position = 'peek'
if has('nvim')
  let g:OmniSharp_popup_options = {
  \ 'winhl': 'Normal:NormalFloat'
  \}
else
  let g:OmniSharp_popup_options = {
  \ 'highlight': 'Normal',
  \ 'padding': [0, 0, 0, 0],
  \ 'border': [1]
  \}
endif
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'pageDown': ['<C-f>', '<PageDown>'],
\ 'pageUp': ['<C-b>', '<PageUp>']
\}

if s:using_snippets
  let g:OmniSharp_want_snippet = 1
endif

let g:OmniSharp_highlight_groups = {
\ 'ExcludedCode': 'NonText'
\}
" }}}



" define a command which runs ripgrep in the root directory
" as determined by rooter
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --glob '!node_modules/*' --no-heading --color=always --smart-case " . shellescape(<q-args>), 1,    fzf#vim#with_preview({"dir": FindRootDirectory(), 'options': '--delimiter : --nth 4..'}))

command! -bang -nargs=? -complete=dir GitFiles call fzf#vim#gitfiles(shellescape(<q-args>), fzf#vim#with_preview({'options': '-i'}), <bang>0)
command! ProjectFiles execute 'GitFiles' s:find_git_root()

if executable('rg')
    let g:rg_derive_root='true'
endif


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufWritePre * :call TrimWhitespace()
set showtabline=2  " 0, 1 or 2; when to use a tab pages line
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " set highlight for tab number and &modified
    let s .= '%#TabLineSel#'
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ':'
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0  " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        let n .= pathshorten(bufname(b))
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      let s .= '[' . m . '+]'
    endif
    " select the highlighting for the buffer names
    " my default highlighting only underlines the active tab
    " buffer names.
    if t + 1 == tabpagenr()
      let s .= '%#TabLine#'
    else
      let s .= '%#TabLineSel#'
    endif
    " add buffer names
    let s .= n
    " switch to no underlining and add final space to buffer list
    let s .= '%#TabLineSel#' . ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLineFill#%999Xclose'
  endif
  return s
endfunction
