-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

local highlight = {
  "yellow",
  "green",
  "pink",
}

local hooks = require "ibl.hooks"
hooks.register(
  hooks.type.HIGHLIGHT_SETUP, function ()
  vim.api.nvim_set_hl(0, "yellow", { fg = require("dracula").colors()["yellow"] })
  vim.api.nvim_set_hl(0, "green", { fg = require("dracula").colors()["green"] })
  vim.api.nvim_set_hl(0, "pink", { fg = require("dracula").colors()["pink"] })
  end
)

require("ibl").setup {
  enabled = true,
  indent = { char = "┆" }, -- highlight = highlight[1] },
  scope = { enabled = true, highlight = highlight[3] },
}
