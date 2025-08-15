-- packages init to gather all plungins
return {
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

  -- colorschemes
  -- { require("packages.dracula") }, -- use darcula colortheme
  { require("packages.rosepine") }, -- use rosepine colortheme

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
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
