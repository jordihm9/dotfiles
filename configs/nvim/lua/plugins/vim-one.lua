return {
    'rakr/vim-one',
    lazy = false,
    priority = 1000,
    init = function()
        vim.g.one_allow_italics = 1
        vim.g.airline_theme = 'one'
    end,
    config = function()
        vim.cmd.colorscheme "one"
        vim.cmd [[
            set background=dark
            call one#highlight('Normal', '', 'none', '')
        ]]
    end
}
