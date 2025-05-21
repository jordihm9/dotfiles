vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.mouse = 'a'
vim.o.numberwidth = 1
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.clipboard = 'unnamedplus'
vim.o.showmatch = true
vim.o.showmode = false

-- locale settings
vim.api.nvim_command("lang en_US.utf-8")
vim.api.nvim_command("lang time es_ES.utf-8")

-- search settings
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- source a the old config for a partial migration
vim.cmd('source ./old.vim')

-- Download Lazy.nvim if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- <space> as leader
vim.g.mapleader = " "

-- setup Lazy.nvim (:Lazy)
require("lazy").setup('plugins')

--[[
    Key bindings / Mappings
--]]

-- Stop highlighting matches
vim.keymap.set("", "<leader>sh", ":noh<CR>")

-- Fast scrolling 10 lines
vim.keymap.set("", "<A-J>", "10j")
vim.keymap.set("", "<A-K>", "10k")

-- Tabs navigation
vim.keymap.set("", "<leader>h", ":tabprevious<CR>")
vim.keymap.set("", "<leader>l", ":tabnext<CR>")
vim.keymap.set("", "<leader>W", ":tabclose<CR>")

-- Add another shortcut to scroll 1/2 page
vim.keymap.set("n", "<C-H>", "<C-u>")
vim.keymap.set("n", "<C-J>", "<C-d>")

-- easymotion - The plugin is deprecated
vim.keymap.set("n", "<leader>se", "<Plug>(easymotion-s2)")
