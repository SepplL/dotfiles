-- use this as inspiration for more packages
return { "LazyVim/LazyVim",
    import = "lazyvim.plugins",
    enabled = false,
    spec = { import = "packages" },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
