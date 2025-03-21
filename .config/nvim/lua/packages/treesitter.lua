-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
return { "nvim-treesitter/nvim-treesitter", -- Highlight, edit, and navigate code
  config = function()
    local configs = require("nvim-treesitter.configs")
    local install = require('nvim-treesitter.install')

    install.compilers = { "gcc" }
    configs.setup({
      sync_install = true,
      auto_install = true,
      ignore_install = {},
      modules = {},
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        'c',
        'cpp',
        'lua',
        'python',
        'rust',
        'typescript',
        'markdown',
        'latex',
        'bash',
        'zig',
      },
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          -- TODO: I'm not sure for this one.
          scope_incremental = '<c-s>',
          node_decremental = '<c-backspace>',
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ['<leader>a'] = '@parameter.inner',
          },
          swap_previous = {
            ['<leader>A'] = '@parameter.inner',
          },
        },
      },
    },
  })
  end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
