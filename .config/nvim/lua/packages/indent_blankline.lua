-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
-- Add indentation guides even on blank lines
--
return { "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()

    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"

    -- local highlight = {
    --   "yellow",
    --   "green",
    --   "pink",
    -- }
    --
    -- local hooks = require "ibl.hooks"
    -- hooks.register(
    --   hooks.type.HIGHLIGHT_SETUP, function ()
    --   vim.api.nvim_set_hl(0, "yellow", { fg = require("dracula").colors()["yellow"] })
    --   vim.api.nvim_set_hl(0, "green", { fg = require("dracula").colors()["green"] })
    --   vim.api.nvim_set_hl(0, "pink", { fg = require("dracula").colors()["pink"] })
    --   end
    -- )

    require("ibl").setup {
      enabled = true,
      indent = { char = "┆" }, -- highlight = highlight[1] },
      -- scope = { enabled = true, highlight = highlight[3] },
    }
  end
}


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
