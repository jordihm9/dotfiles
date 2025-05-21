return {
    'joshdick/onedark.vim',
    lazy = false,
    priority = 1000,
    init = function()
        vim.g.onedark_allow_italics = 1
        vim.g.onedark_terminal_italics = 1
        vim.g.airline_theme = 'onedark'
        vim.g.lightline = { colorscheme = 'onedark' }
    end,
    config = function()
        vim.cmd.colorscheme "onedark"
        vim.cmd [[
            set background=dark
            highlight Normal ctermbg=NONE
        ]]
    end
}
