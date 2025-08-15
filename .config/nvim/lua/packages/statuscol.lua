-- [[ Configure statuscol ]]
-- See `:help statuscol

return { "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    local cfg = {
      setopt = true,
      -- Whether to set the 'statuscolumn' option, may be set to false for those who
      -- want to use the click handlers in their own 'statuscolumn': _G.Sc[SFL]a().
      -- Although I recommend just using the segments field below to build your
      -- statuscolumn to benefit from the performance optimizations in this plugin.
      -- builtin.lnumfunc number string options
      -- or line number thousands separator string ("." / ",")
      thousands = false,
      -- whether to right-align the cursor line number with 'relativenumber' set
      relculright = false,
      -- Builtin 'statuscolumn' options
      -- lua table with 'filetype' values for which 'statuscolumn' will be unset
      ft_ignore = nil,
      -- lua table with 'buftype' values for which 'statuscolumn' will be unset
      bt_ignore = nil,
      -- Default segments (fold -> sign -> line number + separator), explained below
      segments = {
        { text = { "%C" }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
        {
          text = { builtin.lnumfunc, " " },
          condition = { true, builtin.not_empty },
          click = "v:lua.ScLa",
        }
      },
      -- modifier used for certain actions in the builtin clickhandlers:
      -- "a" for Alt, "c" for Ctrl and "m" for Meta.
      clickmod = "c",
      clickhandlers = {       -- builtin click handlers
        Lnum                    = builtin.lnum_click,
        FoldClose               = builtin.foldclose_click,
        FoldOpen                = builtin.foldopen_click,
        FoldOther               = builtin.foldother_click,
        DapBreakpointRejected   = builtin.toggle_breakpoint,
        DapBreakpoint           = builtin.toggle_breakpoint,
        DapBreakpointCondition  = builtin.toggle_breakpoint,
        ["diagnostic/signs"]    = builtin.diagnostic_click,
        gitsigns                = builtin.gitsigns_click,
      },
    }

    require("statuscol").setup({
      -- currently using standard settings
    })
  end
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
