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
  " Linting/error highlighting
"  Plug 'sirver/ultisnips'
  "Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'alvan/vim-closetag'
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
  Plug 'dominikduda/vim_current_word'
  Plug 'morhetz/gruvbox'
  Plug 'tpope/vim-fugitive'
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
  Plug 'preservim/nerdtree'
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
  "Plug 'nosami/Omnisharp'
  "Plug 'https://github.com/OmniSharp/omnisharp-vim'
call plug#end()
"let g:OmniSharp_server_use_mono = 1
" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

-- TREESITTER
require'nvim-treesitter.configs'.setup {
  --ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = {"rust",  "php","dockerfile", "lua", "typescript", "json", "javascript", "html", "jsdoc", "vue", "bash", "tsx", "dockerfile", "regex", "vim", "make", "c"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  },
  fold = {
    enable = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  context_commentstring = {
    enable = true
  }
}
-- TRESITTER-CONTEXT Sticky Scroll
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

}
-- HARPOON
require("harpoon").setup({
    global_settings = {
        save_on_change = true,
        global_project = vim.fn['Find_git_root']()
    },
})

-- NVIMtree like nerdtree but lua
require("nvim-tree").setup({
    --sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "?", action = "toggle_help" },
        },
      },
    },
    renderer = {
   --   group_empty = true,
        root_folder_modifier = ":t",
    },
   -- filters = {
   --   dotfiles = true,
   -- },
})

-- TELESCOPE
require('telescope').setup({
  defaults = {
      vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
      layout_strategy = 'vertical',
      layout_config = { height = 0.95 },
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        --["<C-h>"] = "which_key"
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
     buffers = {
            ignore_current_buffer = true,
            sort_lastused = true,
        },
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                           -- the default case_mode is "smart_case"
        }
    }
})
require('telescope').load_extension('fzf')

vim.api.nvim_set_keymap('n',  '<leader>tct', [[
    <cmd>lua require('telescope').extensions.ctags_outline.outline({buf='all'})<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tgs', [[
    <cmd>lua require'telescope.builtin'.grep_string({cwd=vim.fn['Find_git_root']()})<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tbb', [[
    <cmd>lua require'telescope.builtin'.buffers()<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>thh', [[
    <cmd>lua require'telescope.builtin'.help_tags()<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>ttt', [[
    <cmd>Telescope<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tcc', [[
    <cmd>lua require'telescope.builtin'.commands()<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tmm', [[
    <cmd>lua require('telescope').extensions.vim_bookmarks.all({tail_path=false})<cr>
]], {noremap = true})

vim.api.nvim_set_keymap('n',  '<leader>tmf', [[
<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>
]], {noremap = true})

-- SPECTRE search and replace
require('spectre').setup({
  find_engine = {
      -- rg is map with finder_cmd
      ['rg'] = {
        cmd = "rg",
        -- default args
        args = {
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
        } ,
        options = {
          ['ignore-case'] = {
            value= "--ignore-case",
            icon="[I]",
            desc="ignore case"
          },
          ['hidden'] = {
            value="--hidden",
            desc="hidden file",
            icon="[H]"
          },
          ['multiline'] = {
            value="--multiline",
            desc="multi line",
            icon="[M]"
          }
          -- you can put any rg search option you want here it can toggle with
          -- show_option function
        }
      },
      ['ag'] = {
        cmd = "ag",
        args = {
          '--vimgrep',
          '-s'
        } ,
        options = {
          ['ignore-case'] = {
            value= "-i",
            icon="[I]",
            desc="ignore case"
          },
          ['hidden'] = {
            value="--hidden",
            desc="hidden file",
            icon="[H]"
          },
        },
      },
    },
})

vim.api.nvim_set_keymap('n', '<Leader>ssg', [[
    <cmd>lua require('spectre').open({cwd = vim.fn['Find_git_root']()})<CR>
]], {noremap = true, silent = true})


--search current word
vim.api.nvim_set_keymap('n', '<leader>ssw', [[
    <cmd>lua require('spectre').open_visual({cwd = vim.fn['Find_git_root'](), select_word=true}) <CR>
]], {noremap = true})

vim.api.nvim_set_keymap('v', '<leader>ssv', [[
    <cmd>lua require('spectre').open_visual() <CR>
]], {noremap = true})

--  search in current file
vim.api.nvim_set_keymap('n', '<leader>ssf', [[
    <cmd>lua require('spectre').open_file_search() <CR>
]], {noremap = true})

-- NVIM HOP
require'hop'.setup{
  keys = 'etovxqpdygfblzhckisuran'
}
vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
EOF

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

" Far search/replace
let g:far#cwd = s:find_git_root()
let g:far#source = 'rgnvim'
let g:far#window_layout = 'tab'
nmap <silent> <buffer> <leader>gs :Farf<cr>
nmap <silent> <buffer> <leader>gc :Farr<cr>


augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

" Sweet Sweet FuGITive
nmap <leader>gf :diffget //3<CR>
nmap <leader>gj :diffget //2<CR>
"nmap <leader>gs :G<CR>

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
