-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- colorscheme
  use({
      'ray-x/aurora',
      init = function()
        vim.g.aurora_italic = 1
        vim.g.aurora_transparent = 1
        vim.g.aurora_bold = 1
      end
    })

  -- LSP
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('RRethy/nvim-treesitter-textsubjects')

  -- File explorer
  use('preservim/nerdtree')
  
  -- LSP Support
  use('neovim/nvim-lspconfig') -- Collection of configurations for built-in LSP client
  use('williamboman/mason.nvim') -- Package manager for LSP servers, DAP servers, linters, and formatters
  use('williamboman/mason-lspconfig.nvim') -- Bridge between mason.nvim and nvim-lspconfig
  
  -- Language-specific LSP servers
  -- TypeScript/JavaScript/TSX/CSS/HTML/JSON
  -- use('jose-elias-alvarez/null-ls.nvim') -- Formatting and diagnostics
  
  -- LSP Autocomplete
  use('hrsh7th/nvim-cmp') -- Completion framework
  use('hrsh7th/cmp-nvim-lsp') -- LSP source for nvim-cmp
  use('hrsh7th/cmp-buffer') -- Buffer source for nvim-cmp
  use('hrsh7th/cmp-path') -- Path source for nvim-cmp
  use('L3MON4D3/LuaSnip') -- Snippets engine
  use('saadparwaiz1/cmp_luasnip') -- Luasnip source for nvim-cmp

  -- Git
  use('tpope/vim-fugitive')
end)
