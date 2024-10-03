-- disable netrw at the very start of init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- create symlink to move package directory to /data with
-- ln -s /data/nvim/... ~/.local/share/nvim
local lazypath = vim.fn.stdpath "data" .. "lazy/lazy.nvim"
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
vim.g.maplocalleader = ","

-- stylua: ignore start
require("lazy").setup({
  { require("packages.lazy") },

  { require("packages.dap") }, -- debugging
  { require("packages.starter") }, -- define own starting screen
  { require("packages.Ollama") }, -- define Ollama setup
  { require("packages.notify") }, -- Fancy and beautiful notification system
  { require("packages.dressing") },
  { require("packages.miniIndentscope") },
  { require("packages.fugitive") },
  { require("packages.rhubarb") },
  { require("packages.Gitsigns") }, -- Add git related info in the signs columns and popups
  { require("packages.comment") },
  -- potentially group similar packages later
  { require("packages.treesitter") }, -- Highlight, edit, and navigate code
  { require("packages.treesitter-textobjects") }, -- Additional textobjects for treesitter
  -- potentially group similar packages later
  { require("packages.lspconfig") }, -- Collection of configurations for built-in LSP client
  { require("packages.mason") }, -- Manage external editor tooling i.e LSP servers
  { require("packages.mason-lspconfig") }, -- Automatically install language servers to stdpath
  { require("packages.nvim-cmp") }, -- Autocompletion

  { require("packages.LuaSnip") }, -- Snippet Engine and Snippet Expansion
  { require("packages.formatter") }, -- use advanced diagnostics with automated formatting

  { require("packages.dracula") }, -- use darcula colortheme
  { require("packages.LuaLine") }, -- Fancier statusline
  { require("packages.indent_blankline") }, -- Add indentation guides even on blank lines
  { require("packages.sleuth") }, -- Detect tabstop and shiftwidth automatically

  -- test telescope at a different stage - currently liking fzf
  { require("packages.junegunnFzF") }, -- Install fzf and set base requirements
  { require("packages.FzfLua") }, -- Fuzzy finder for lua

  { require("packages.nvim-tree") }, -- Use NerdTree
  { require("packages.WhichKey") },
  { require("packages.markdown") },
  { require("packages.vimtex") }, --vimtex
  -- check spell checker and settle on a good version
  -- { require("packages.thethethe") },
  { require("packages.autocorrect") },
  { require("packages.colorizer") },
  { require("packages.diffview") },
  -- { require("packages.statuscol") },
  { require("packages.todo") },
})
-- stylua: ignore end

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set colorscheme
-- enable dracula colorscheme
vim.cmd[[colorscheme dracula]]
vim.o.termguicolors = true
-- set line coloring
-- Sets colors to line numbers Above, Current and Below  in this order
-- local LineColoring = require( "packages.dracula" )
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
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.syntax = "true"
vim.o.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.o.colorcolumn = "90"
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
