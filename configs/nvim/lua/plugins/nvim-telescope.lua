return {
    {
        'junegunn/fzf',
        -- Alternatively use this:
        -- https://github.com/ibhagwan/fzf-lua
        dependencies = {
            'junegunn/fzf.vim'
        },
        dir = "~./fzf",
        build = "./install --all"
    },
    {

        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make'
            }
        },
        config = function()
            local actions = require("telescope.actions")
            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<esc>"] = actions.close,                   -- press Esc on insert mode to close
                            ["<C-u>"] = false,                           -- reset to be able to delete all line
                            ["<C-j>"] = actions.move_selection_next,     -- previous item
                            ["<C-k>"] = actions.move_selection_previous, -- next item
                            ["<C-i>"] = actions.select_horizontal,       -- go to file as a split
                        }
                    }
                }
            }

            -- map <Leader>pp :Files<CR>
            vim.keymap.set("n", "<leader>pp", ":Telescope find_files<CR>", { noremap = true })
            -- map <Leader>ss :Rg<CR>
            vim.keymap.set("n", "<leader>ss", ":Telescope live_grep<CR>", { noremap = true })
            -- map <Leader>bb :Buffers<CR>
            vim.keymap.set("n", "<leader>bb", ":Telescope buffers<CR>", { noremap = true })
            vim.keymap.set("n", "<leader>ts", ":Telescope treesitter<CR>", { noremap = true })
            vim.keymap.set("n", "<leader>Gs", ":Telescope git_status<CR>", { noremap = true })

            require("telescope").load_extension "fzf"
        end
    }
}
