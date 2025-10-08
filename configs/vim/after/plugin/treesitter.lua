require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "bash",
    "css",
    "diff",
    "dockerfile",
    "html",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "markdown",
    "python",
    "regex",
    "scss",
    "tsx",
    "typescript",
    "vim",
    "yaml"
  },

  sync_install = false,

  auto_install = true,

  indent = {
    enable = false,
    disable = {},
  },

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
