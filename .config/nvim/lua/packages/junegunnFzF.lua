-- Install fzf and set base requirements instead of telescope
return { "junegunn/fzf",
    dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    run = "./install --bin",
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
