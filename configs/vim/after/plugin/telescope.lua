local builtin = require('telescope.builtin')
local telescope = require('telescope')
local actions = require('telescope.actions')

-- Configure Telescope
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Esc>"] = actions.close,
        ["<C-u>"] = false, -- reset to be able to delete all line
      },
    },
  },
})

-- Find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
-- Find in files (grep)
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Grep in files' })
-- Find in buffers
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
-- Find git files
vim.keymap.set('n', '<leader>fg', builtin.git_status, { desc = 'Find changed git files' })
-- Find in current buffer
vim.keymap.set('n', '<leader>fS', builtin.current_buffer_fuzzy_find, { desc = 'Find in current buffer' })
-- Find treesitter symbols
vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = 'Find treesitter symbols' })
