return {
  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = require("help.config").icons

      vim.o.laststatus = vim.g.lualine_laststatus

      return {
        options = {
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
          -- icons:     
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            -- vim-icons:    󰕷 
            -- neovim-icons:  
            { "mode", icons_enabled = true, icon = "" },
          },
          lualine_b = { "branch" },

          lualine_c = {
            vim.fn.expand("%:p"),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          },
          lualine_x = {
            {
              function()
                return require("help.etc").currentLsp()
              end,
            },
          },
          lualine_y = {
            { "encoding", separator = "" },
            { "fileformat", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            { "progress", separator = "" },
            { "location", padding = { left = 0, right = 1 } },
            {
              function()
                return " " .. os.date("%R")
              end,
            },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
}
