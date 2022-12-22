set number
set relativenumber
set nowrap " lines do not wrap
set mouse=a
set numberwidth=1 
set autoindent " intelligent autoindent when creating a new line
set expandtab " force the use of spaces
set shiftwidth=2
"set scrolloff=8 " always keep at least 8 lines above and below the cursor
set clipboard+=unnamedplus " use system clipboard
set ruler " force showing the ruler
set cmdheight=1 " better display for messages
set showcmd
set showmatch
set noshowmode " given by the status bar
set laststatus=2
set nocompatible

" locale settings
set encoding=utf-8
lang en_US.utf-8
lang time es_ES.utf-8

" search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Turn on syntax highlighting.
syntax on

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly.
filetype plugin indent on

"" ----------------------------------------------------------------------------
""  PLUGINS
"" ----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" ----- Status bar
Plug 'itchyny/lightline.vim'
" -----

" ----- Color-themes
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'ray-x/aurora'
" -----

" ----- Syntax
Plug 'sheerun/vim-polyglot'	" Collection of language packs
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'HerringtonDarkholme/yats.vim' " typescript syntax
Plug 'norcalli/nvim-colorizer.lua' " color highlighter 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" -----

" ----- Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
Plug 'github/copilot.vim'
" -----

" ----- File system explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin' " shows git status flag for files and folders
" -----

" ----- Icons
Plug 'ryanoasis/vim-devicons' " filetype-specific icons
" -----

" typing helpers
Plug 'alvan/vim-closetag' " closes < >
Plug 'tpope/vim-surround' " to surround with parenthesis and ticks
" -----

" ----- Tmux
Plug 'christoomey/vim-tmux-navigator' " navigate seamlessly between vim and tmux splits
" -----

" ----- Snippets
Plug 'honza/vim-snippets'
" -----

" ----- Tests
Plug 'janko-m/vim-test'
" -----

" ----- Search Tools
Plug 'junegunn/fzf' " Fuzzy Finder
Plug 'junegunn/fzf.vim' " Fuzzy Finder
Plug 'easymotion/vim-easymotion' " fast-moving-search
Plug 'nvim-lua/plenary.nvim' " required by telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"" -----

" ----- GIT
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
" git(HUB)
Plug 'tpope/vim-rhubarb'
" uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS)
Plug 'mhinz/vim-signify'
" -----

" ----- Other
Plug 'editorconfig/editorconfig-vim'
Plug 'yuttie/comfortable-motion.vim' " smooth scroll
Plug 'yggdroot/indentline' " display the indention levels with thin vertical lines
Plug 'scrooloose/nerdcommenter' " fast comment
Plug 'folke/todo-comments.nvim' " highlight TODOs
" -----

call plug#end()

"" ----------------------------------------------------------------------------
""  PLUGINS CONFIG
"" ----------------------------------------------------------------------------

"" ----- onedark:
colorscheme onedark
set background=dark
highlight Normal ctermbg=NONE
let g:onedark_allow_italics = 1
let g:onedark_terminal_italics = 1
let g:airline_theme = 'onedark'
let g:lightline = { 'colorscheme': 'onedark'}
"" -----

"" ----- one:
colorscheme one
set background=dark
let g:one_allow_italics = 1
let g:airline_theme = 'one'
call one#highlight('Normal', '', 'none', '')
"" -----

"" oceanic
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" transparency
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
"" -----

"" aurora
let g:aurora_italic = 1     " italic
let g:aurora_transparent = 1     " transparent
let g:aurora_bold = 1     " bold
let g:aurora_darker = 1     " darker background
let g:lightline.colorscheme='aurora'
let g:airline_theme='aurora'
colorscheme aurora
"" -----

" for vim 7
set t_Co=256

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" au BufNewFile,BufRead *.html set filetype=htmldjango

"" ----- colorizer
lua require'colorizer'.setup()
"" -----

"" ----- NerdTree 
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
" hidden files/folders in tree:
let g:NERDTreeIgnore=['^node_modules$', '^.git$']
" add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
"" -----

"" ----- Auto-Close tags
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
"" ----- 

"" ----- Conquer of Completion (coc)
let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-eslint', 
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-styled-components', 
  \ 'coc-tsserver',  
  \ 'coc-yaml',
  \ 'coc-yank',
  \ 'coc-deno',
  \ ]
"" -----

"" ----- Copilot
let g:copilot_node_command = "~/.nodenv/versions/16.17.0/bin/node"
"" -----

"" ----- TreeSitter
lua <<EOF
require 'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "css",
    "html",
    "javascript",
    "json",
    "markdown",
    "python",
    "scss",
    "tsx",
    "typescript",
    "yaml"
  }
}
EOF
"" ------

"" ----- vim fugitive
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
" vertical diffing
set diffopt+=vertical
"" ------

"" ------ fuzzy finder
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"" ------

"" ----- vim-test
let g:test#basic#start_normal = 1 " leave terminal in normal mode to not exit on key press
let g:test#neovim#start_normal = 1 " leave terminal in normal mode to not exit on key press
"" -----

"" ----- vim-json
let g:vim_json_syntax_conceal = 0
"" -----

"" ----- todo-comments
lua << EOF
require("todo-comments").setup {
    \ keywords = {
        \ FIX = {
            \ icon = " ",
            \ color = "error",
            \ alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            \ },
        \ TODO = { icon = " ", color = "info" },
        \ HACK = { icon = " ", color = "warning" },
        \ WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
        \ PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        \ NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        \ },
    \ }
EOF
"" ----

"" ----------------------------------------------------------------------------
""  Key bindings / Mappings
"" ----------------------------------------------------------------------------
let mapleader = ' '

" ----- Vanilla VIM mappings
" stop highlighing matches
map <Leader>sh :noh<CR>
" quick semicolon at the end of the line
nnoremap <Leader>; $a;<Esc>
" save current
nnoremap <Leader>w :w<CR>
" save all
nnoremap <Leader>wa :wa<CR>
" quit
nnoremap <Leader>q :q<CR>
" leave insert mode
inoremap <ESC> <C-\><C-n>
" fast scrolling 10 lines 
map <A-J> 10j<CR>
map <A-K> 10k<CR>
" add another shortcut to scroll 1/2 page
nmap <C-H> C-u<CR>
nmap <C-J> C-d<CR>
" let move lines of code using 'Alt + hjkl
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" macos map command instead of alt
nnoremap <Leader>j :m .+1<CR>==
nnoremap <Leader>k :m .-2<CR>==
vnoremap <Leader>j :m '>+1<CR>gv=gv
vnoremap <Leader>k :m '<-2<CR>gv=gv
" tabs navigation
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>
map <Leader>W :tabclose<cr>
" open terminal in (v)ertical or (h)oritzonal
noremap <Leader>tv :botright vnew <Bar> :terminal<CR>
noremap <Leader>th :botright new <Bar> :terminal<CR>
noremap <Leader>tt :tabnew new <Bar> :terminal<CR>
tnoremap <Esc> <C-\><C-n> " remap exit from intermode in terminal
" -----

" ----- Tmux navigator
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<CR>
" -----

" ----- easymotion
nmap <Leader>se <Plug>(easymotion-s2)
" -----

" ----- NerdTree
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>
" -----

" ------- Conquer Of Completion

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>es :CocCommand eslint.executeAutofix<CR>
nmap <silent> <Leader>et :CocCommand tsserver.executeAutofix<CR>

" Go To navigation 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" renaming.
nmap <leader>rn <Plug>(coc-rename)
" yank extension
map <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>
" -------

" ----- Copilot
imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <C-]> <Plug>(copilot-next)
imap <C-[> <Plug>(copilot-previous)
" -------

" ----- Fuzzy Finder
" map <Leader>pp :Files<CR>
nnoremap <Leader>pp <cmd>Telescope find_files<CR>
" map <Leader>ss :Rg<CR>
nnoremap <Leader>ss <cmd>Telescope live_grep<CR>
" map <Leader>bb :Buffers<CR>
nnoremap <Leader>bb <cmd>Telescope buffers<CR>
" configure mappings for telescope;
lua << EOF
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close, -- press Esc on insert mode to close
        ["<C-u>"] = false, -- reset to be able to delete all line
        ["<C-j>"] = actions.move_selection_next, -- previous item
        ["<C-k>"] = actions.move_selection_previous, -- next item
        ["<C-i>"] = actions.select_horizontal, -- go to file as a split
      }
    }
  }
}
EOF
" -----

" ----- Remap surround to lowercase s so it does not add an empty space
xmap sr <Plug>VSurround
" -----

" ----- Tests
nnoremap <Leader>t :TestNearest<CR>
nnoremap <Leader>T :TestFile<CR>
nnoremap <Leader>TT :TestSuite<CR>
" -----

" ------- GIT
" show git status
map <Leader>GG :Git<CR>
" git diff split
map <Leader>Gd :Gdiffsplit<CR>
" git diff resolve conflicts
map <Leader>Gc :Gdiffsplit!<CR>
map <Leader>L :diffget //3<CR>
map <Leader>H :diffget //2<CR>
" save changes and stage
map <Leader>Gw :Gw<CR>
" show logs
map <Leader>Gl :GV<CR>
map <Leader>Gll :GV!<CR>
" -------
