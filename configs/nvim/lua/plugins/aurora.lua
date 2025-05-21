return {
    "ray-x/aurora",
    lazy = false,
    priority = 1000,
    init = function()
        vim.g.aurora_italic = 1
        vim.g.aurora_transparent = 1
        vim.g.aurora_bold = 1
        vim.g.aurora_darker = 1
        vim.g.lightline = { colorscheme = 'aurora' }
        vim.g.airline_theme = 'aurora'
    end,
    config = function()
        vim.cmd.colorscheme "aurora"
    end,
}
