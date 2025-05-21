return {
    {
        'junegunn/gv.vim'
    },
    {
        -- git(HUB)
        'tpope/vim-rhubarb'
    },
    {
        'mhinz/vim-signify'
        -- uses the sign column to indicate added, modified and removed lines in a file that is managed by a version control system (VCS)
    },
    {
        'tpope/vim-fugitive',
        config = function()
            -- show git status
            vim.keymap.set("", "<leader>GG", ":Git<CR>")
            -- git diff split
            vim.keymap.set("", "<leader>Gd", ":Gdiffsplit<CR>")
            -- git diff resolve conflicts
            vim.keymap.set("", "<leader>Gc", ":Gdiffsplit!<CR>")
            vim.keymap.set("", "<leader>L", ":diffget //3<CR>")
            vim.keymap.set("", "<leader>H", ":diffget //2<CR>")
            -- save changes and stage
            vim.keymap.set("", "<leader>Gw", ":Gw<CR>")
            -- show logs
            vim.keymap.set("", "<leader>Gl", ":GV<CR>")
            vim.keymap.set("", "<leader>Gll", ":GV!<CR>")

            vim.cmd [[
            command! -bang -nargs=? -complete=dir GFiles
              \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)
            " vertical diffing
            set diffopt+=vertical
        ]]
        end
    }
}
