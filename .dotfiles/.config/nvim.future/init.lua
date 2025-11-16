-- disable netrw at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors early to avoid render issues
vim.o.termguicolors = true

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 4

-- set min cursor distance from screen border
vim.o.scrolloff = 8

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = "yes"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Enable break indent
vim.o.breakindent = true

vim.o.syntax = "true"
vim.o.autoindent = true
vim.opt.smartindent = true
vim.o.colorcolumn = "88"
vim.o.laststatus = 2

vim.o.tabstop = 4

-- set shortcut for disable highlighting noh
vim.api.nvim_set_keymap( "n", "<esc><esc>", ":noh<cr>", {
  noremap = true}
)

-- disable mouse
vim.opt.mouse = ""

-- further display and indentation settings
vim.o.foldlevel = 99
vim.opt.linebreak = true
vim.opt.textwidth = 90
vim.opt.smarttab = true

local path = vim.fn.stdpath "data" .. "pack"
vim.opt.rtp:prepend( path )
require("packages")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
