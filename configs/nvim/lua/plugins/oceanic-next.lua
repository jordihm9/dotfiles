return {
    'mhartington/oceanic-next',
    lazy = false,
    priority = 1000,
    init = function()
        vim.g.airline_theme = 'oceanicnext'
        vim.g.oceanic_next_terminal_bold = 1
        vim.g.oceanic_next_terminal_italic = 1
        vim.cmd [[
            hi Normal guibg=NONE ctermbg=NONE
            hi LineNr guibg=NONE ctermbg=NONE
            hi SignColumn guibg=NONE ctermbg=NONE
            hi EndOfBuffer guibg=NONE ctermbg=NONE
        ]]
    end,
    config = function()
        vim.cmd.colorscheme "OceanicNext"
    end
}
