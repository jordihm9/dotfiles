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

" ----- Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion
" ----

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
Plug 'easymotion/vim-easymotion' " fast-moving-search
"" -----

" ----- Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"" -----

" ----- Other
Plug 'editorconfig/editorconfig-vim'
Plug 'yuttie/comfortable-motion.vim' " smooth scroll
Plug 'yggdroot/indentline' " display the indention levels with thin vertical lines
Plug 'scrooloose/nerdcommenter' " fast comment
" -----

call plug#end()

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

"" ----- Auto-Close tags
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
"" ----- 

"" ----- Conquer of Completion (coc)
let g:coc_global_extensions = [
  \ 'coc-sh',
  \ 'coc-css',
  \ 'coc-eslint', 
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-jedi',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-snippets',
  \ 'coc-styled-components', 
  \ 'coc-tsserver',  
  \ 'coc-yaml',
  \ 'coc-yank',
  \ 'coc-deno',
  \ 'coc-emmet',
  \ ]
"" -----

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

"" ----------------------------------------------------------------------------
""  Key bindings / Mappings
"" ----------------------------------------------------------------------------

" ----- Vanilla VIM mappings
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
nmap <silent> ca <Plug>(coc-codeaction)
nmap <silent> rn <Plug>(coc-rename)

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

" yank extension
map <silent> <Leader>y  :<C-u>CocList -A --normal yank<cr>
" -------

" ----- markdown-preview
nmap <C-m> <Plug>MarkdownPreviewToggle
"" -----

" ----- Remap surround to lowercase s so it does not add an empty space
xmap sr <Plug>VSurround
" -----

" ----- Tests
nnoremap <Leader>Tt :TestNearest<CR>
nnoremap <Leader>T :TestFile<CR>
nnoremap <Leader>TT :TestSuite<CR>
" -----

