-- Automatically install language servers to stdpath
return { "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig.install").compilers = { "gcc" };
  end
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
