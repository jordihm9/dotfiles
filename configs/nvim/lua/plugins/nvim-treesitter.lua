return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'RRethy/nvim-treesitter-textsubjects',
    },
    cmd = 'TSUpdate',
    config = function()
        require 'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = false,
                disable = {},
            },
            ensure_installed = {
                "bash",
                "css",
                "html",
                "javascript",
                "json",
                "markdown",
                "lua",
                "python",
                "scss",
                "tsx",
                "typescript",
                "regex",
                "dockerfile",
                "jsdoc",
                "diff",
                "vim",
                "yaml"
            },
            textsubjects = {
                enable = true,
                prev_selection = ',', -- (Optional) keymap to select the previous selection
                keymaps = {
                    ['.'] = 'textsubjects-smart',
                    [';'] = 'textsubjects-container-outer',
                    ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
                },
            },
        }
    end
}
