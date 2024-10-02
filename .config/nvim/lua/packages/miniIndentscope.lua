return { "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- symbol = "▏",
    -- symbol = "│",
    options = { try_as_border = true },
  },
  -- setup()
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
