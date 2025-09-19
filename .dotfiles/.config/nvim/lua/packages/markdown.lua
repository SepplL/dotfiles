-- include markdown
return { "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
