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
  { "LazyVim/LazyVim",                                                             -- use this as inspiration for more packages
    import = "lazyvim.plugins",
    enabled = false,
  },
  { "mfussenegger/nvim-dap",                                                       -- debugging
    dependencies = {
      "rcarriga/nvim-dap-ui",
    },
    -- enable = false,
  },
  { "zbirenbaum/copilot.lua",                                                      -- AI code snippets
    cmd = "Copilot",
    config = function()
      require("copilot").setup({})
    end,
  },
  { require("packages.starter") },                                                 -- define own starting screen
  { "rcarriga/nvim-notify",                                                        -- Fancy and beautiful notification system
    require("packages.notify"),
  },
  { "stevearc/dressing.nvim",
    opts = {},
  },
  { "echasnovski/mini.indentscope",
    version = false,
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      -- symbol = "▏",
      -- symbol = "│",
      options = { try_as_border = true },
    },
  },
  { "tpope/vim-fugitive",                                                          -- Git commands in nvim
    config = function()
      require("packages.fugitive");
    end
  },
  { "tpope/vim-rhubarb",                                                           -- Fugitive-companion to interact with github
    dependencies = { "tpope/vim-fugitive" },
    config = function()
      require("packages.rhubarb");
    end
  },
  { "lewis6991/gitsigns.nvim",                                                     -- Add git related info in the signs columns and popups
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("packages.Gitsigns");
    end
  },
  { "numToStr/Comment.nvim",                                                       -- "gc" to comment visual regions/lines
    config = function()
      require("packages.comment");
    end
  },
  { "nvim-treesitter/nvim-treesitter",                                             -- Highlight, edit, and navigate code
    config = function()
      require("packages.treesitter");
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",                                 -- Additional textobjects for treesitter
  },

  {
    "neovim/nvim-lspconfig",                                                       -- Collection of configurations for built-in LSP client
  },
  {
    "williamboman/mason.nvim",                                                     -- Manage external editor tooling i.e LSP servers
  },
  { "williamboman/mason-lspconfig.nvim",                                           -- Automatically install language servers to stdpath
    config = function()
      require("mason-lspconfig.install").compilers = { "gcc" };
    end
  },
  { "hrsh7th/nvim-cmp" },                                                          -- Autocompletion
  { "hrsh7th/cmp-nvim-lsp" },

  { "L3MON4D3/LuaSnip",                                                            -- Snippet Engine and Snippet Expansion
    dependencies = { "saadparwaiz1/cmp_luasnip" }
  },

  { "mhartington/formatter.nvim",                                                  -- use advanced diagnostics with automated formatting
    config = function()
      require("packages.formatter");
    end
  },

  { "Mofiqul/dracula.nvim",                                                        -- use darcula colortheme
    config = function()
      require("packages.dracula");
    end
  },
  { "nvim-lualine/lualine.nvim",                                                   -- Fancier statusline
    dependencies = { "Mofiqul/dracula.nvim" },
    config = function()
      require("packages.LuaLine");
    end
  },
  { "lukas-reineke/indent-blankline.nvim",                                         -- Add indentation guides even on blank lines
    config = function()
      require("packages.indent_blankline");
    end
  },
  { "tpope/vim-sleuth" },                                                          -- Detect tabstop and shiftwidth automatically

  { "junegunn/fzf",                                                                -- Install fzf and set base requirements instead of telescope
    dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    run = "./install --bin",
  },
  { "ibhagwan/fzf-lua",                                                            -- Fuzzy finder for lua
    dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },             -- popup for nice fzf looks     
    config = function()
      require("packages.FzfLua");
    end
  },
  { "kyazdani42/nvim-tree.lua",                                                    -- Use NerdTree
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("packages.nvim-tree");
    end
  },
  { "folke/which-key.nvim",
    config = function()
      require("packages.WhichKey");
    end
  },
  -- install without yarn or npm
  { "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
})
-- stylua: ignore end

-- [[ Setting options ]]
-- See `:help vim.o`

-- Make line numbers default
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 2

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

-- Set colorscheme
-- enable dracula colorscheme
vim.cmd[[colorscheme dracula]]
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.syntax = true
vim.o.autoindent = true
vim.o.colorcolumn = 90
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
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.termguicolors = true

require("additional")
require("mappings")
require("lsp-settings")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
