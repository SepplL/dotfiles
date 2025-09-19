-- activate spell checking
-- vim.o.spell = true
vim.o.spelllang = "en_gb"

-- Use spelling for markdown files ‘]s’ to find next, ‘[s’ for previous, 'z=‘ for suggestions when on one.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
