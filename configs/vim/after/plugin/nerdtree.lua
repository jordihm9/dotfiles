-- NERDTree configuration
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeQuitOnOpen = 1
vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1
vim.g.NERDTreeShowLineNumbers = 1

-- Hidden files/folders in tree
vim.g.NERDTreeIgnore = {'^node_modules$', '^.git$'}

-- Add spaces after comment delimiters by default
vim.g.NERDSpaceDelims = 1

vim.keymap.set('n', '<Leader>nt', ':NERDTreeToggle<CR>', { noremap = true, silent = true, desc = 'Toggle NERDTree' })
vim.keymap.set('n', '<Leader>nf', ':NERDTreeFind<CR>', { noremap = true, silent = true, desc = 'Find current file in NERDTree' })
