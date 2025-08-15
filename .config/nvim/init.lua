-- disable netrw at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- set termguicolors early to avoid render issues
vim.o.termguicolors = true

-- create symlink to move package directory to /data with
-- ln -s /data/nvim/... ~/.local/share/nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat( lazypath ) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend( lazypath )

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- stylua: ignore start
require("lazy").setup({
  require("packages"),
})
-- stylua: ignore end

-- [[ Setting options ]]
-- See `:help vim.o`

-- colorscheme is handled by loaded package
-- set line coloring
-- Sets colors to line numbers Above, Current and Below  in this order
LineNumberColors()

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 4

-- set min cursor distance from screen border
vim.o.scrolloff = 8

-- Enable break indent
vim.o.breakindent = true

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

vim.o.syntax = "true"
vim.o.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
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

require("additional")
require("mappings")
require("lsp-settings")
require("spell-settings")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
