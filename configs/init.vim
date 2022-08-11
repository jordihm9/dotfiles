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

syntax on

"" ----------------------------------------------------------------------------
""  PLUGINS
"" ----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" status bar
Plug 'itchyny/lightline.vim'

" theme
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

" syntax
Plug 'sheerun/vim-polyglot'	" Collection of language packs
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim' " typescript syntax highlighter
Plug 'norcalli/nvim-colorizer.lua' " color highlighter 

" tree
Plug 'preservim/nerdtree' " file system explorer
Plug 'Xuyuanp/nerdtree-git-plugin' " shows git status flag for files and folders

" icons
Plug 'ryanoasis/vim-devicons' " filetype-specific icons

" typing helpers
Plug 'alvan/vim-closetag' " closes < >
Plug 'tpope/vim-surround' " to surround with parenthesis and ticks

" tmux
Plug 'christoomey/vim-tmux-navigator' " navigate seamlessly between vim and tmux splits

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion

" snippets
Plug 'honza/vim-snippets'

" tests
Plug 'janko-m/vim-test'

" IDE
Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf' " Fuzzy Finder
Plug 'junegunn/fzf.vim' " Fuzzy Finder
Plug 'easymotion/vim-easymotion' " Search tool
Plug 'mhinz/vim-signify' " uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS)
Plug 'yggdroot/indentline' " display the indention levels with thin vertical lines
Plug 'scrooloose/nerdcommenter' " allow fast comment

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" smooth scroll
Plug 'yuttie/comfortable-motion.vim'

call plug#end()

"" ----------------------------------------------------------------------------
""  PLUGINS CONFIG
"" ----------------------------------------------------------------------------
" themes
" onedark:
colorscheme onedark
set background=dark
highlight Normal ctermbg=NONE
let g:onedark_allow_italics = 1
let g:onedark_terminal_italics = 1
let g:airline_theme = 'onedark'
let g:lightline = { 'colorscheme': 'onedark'}

" one:
colorscheme one
set background=dark
let g:one_allow_italics = 1
let g:airline_theme = 'one'
call one#highlight('Normal', '', 'none', '')

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

au BufNewFile,BufRead *.html set filetype=htmldjango

" colorizer
lua require'colorizer'.setup()

" NerdTree 
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

" auto close tags
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" coc config
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

" vim fugitive
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" fugitive always vertical diffing
set diffopt+=vertical

" vim-test
let g:test#basic#start_normal = 1 " leave terminal in normal mode to not exit on key press
let g:test#neovim#start_normal = 1 " leave terminal in normal mode to not exit on key press

"" ----------------------------------------------------------------------------
""  Key bindings / Mappings
"" ----------------------------------------------------------------------------
let mapleader = ' '

" stop highlighing matches
map <Leader>sh :noh<CR>

" split resizing
" horitzonal:
nnoremap <Leader>> 15<C-w>>
nnoremap <Leader>< 15<C-w><
" vertical:
nnoremap <Leader>< 15<C-h><
nnoremap <Leader>> 15<C-h>>

" quick semicolon at the end of the line
nnoremap <Leader>; $a;<Esc>

" quick save and quick quit
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wa :wa<CR>
nnoremap <Leader>q :q<CR>

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

" fast search
nmap <Leader>se <Plug>(easymotion-s2)

" tabs navigation
map <Leader>h :tabprevious<cr>
map <Leader>l :tabnext<cr>
map <Leader>W :tabclose<cr>

" NerdTree
nmap <Leader>nt :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>

" tmux navigator
nnoremap <silent> <Leader><C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <Leader><C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <Leader><C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <Leader><C-l> :TmuxNavigateRight<CR>

" Conquer Of Completion
" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <Leader>es :CocCommand eslint.executeAutofix<CR>
nmap <silent> <Leader>et :CocCommand tsserver.executeAutofix<CR>

" yank extension
nnoremap <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>

" Go To navigation 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" fzf search
map <Leader>pp :Files<CR>
map <Leader>ss :Rg<CR>
map <Leader>bb :Buffers<CR>

" Remap surround to lowercase s so it does not add an empty space
xmap sr <Plug>VSurround

" run tests
nnoremap <Leader>t :TestNearest<CR>
nnoremap <Leader>T :TestFile<CR>
nnoremap <Leader>TT :TestSuite<CR>

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
