-- I would consider migrating to:
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
    'preservim/nerdtree',
    dependencies = {
        -- shows git status flag for files and folders
        'Xuyuanp/nerdtree-git-plugin'
    },
    config = function()
        vim.cmd [[
            let NERDTreeShowHidden=1
            let NERDTreeQuitOnOpen=1
            let NERDTreeAutoDeleteBuffer=1
            let NERDTreeMinimalUI=1
            let NERDTreeDirArrows=1
            let NERDTreeShowLineNumbers=1
        ]]

        -- hidden files/folders in tree:
        vim.g.NERDTreeIgnore = { '^node_modules$', '^.git$' }
        -- add spaces after comment delimiters by default
        vim.g.NERDSpaceDelims = 1

        vim.keymap.set("n", "<leader>nt", ":NERDTreeToggle<CR>")
        vim.keymap.set("n", "<leader>nf", ":NERDTreeFind<CR>")
    end

}
