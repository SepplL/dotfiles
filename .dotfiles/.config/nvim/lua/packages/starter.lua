-- start screen
return {
  -- disable alpha
  { "goolord/alpha-nvim", enabled = false },

  -- enable mini.starter
  {
    "echasnovski/mini.starter",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VimEnter",
    opts = function()
      -- local logo = require("packages.starter-logos")[ math.random( #require("packages.starter-logos") ) ]
      local logo = require("packages.starter-logos")[ 1 ]
      local pad = string.rep(" ", 22)
      local new_section = function(name, action, section)
        return { name = name, action = action, section = pad .. section }
      end

      local starter = require("mini.starter")
      --stylua: ignore
      local config = {
        evaluate_single = true,
        header = logo,
        items = {
          new_section("Find file", [[lua require('fzf-lua').files()]], "FzF"),
          new_section("Recent files", [[lua require('fzf-lua').oldfiles()]], "FzF"),
          new_section("init.lua",     "e $MYVIMRC",           "Config"),
          new_section("Lazy",         "Lazy",                 "Config"),
          new_section("CheckHealth",  "checkhealth",          "Config"),
          new_section("New file",     "ene | startinsert",    "Built-in"),
          new_section("Quit",         "qa",                   "Built-in"),
          -- new_section("Session restore", [[lua require("persistence").load()]], "Session"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
      return config
    end,
    config = function(_, config)
    --   -- close Lazy and re-open when starter is ready
    --   if vim.o.filetype == "lazy" then
    --     vim.cmd.close()
    --     vim.api.nvim_create_autocmd("User", {
    --       pattern = "MiniStarterOpened",
    --       callback = function()
    --         require("lazy").show()
    --       end,
    --     })
    --   end
    --
      local starter = require("mini.starter")
      starter.setup(config)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local pad_footer = string.rep(" ", 8)
          starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(starter.refresh)
        end,
      })
    end,
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
