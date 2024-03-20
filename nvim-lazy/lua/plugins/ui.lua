return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },

  {
    "akinsho/toggleterm.nvim",
    enabled = false,
    config = true,
    cmd = "ToggleTerm",
    build = ":ToggleTerm",
    keys = { { "<C-t>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" } },
    opts = {
      open_mapping = [[<C-t>]],
      direction = "horizontal",
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
    },
  },

  -- noice.nvim
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },

  -- nvim-notify
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- mini.animate
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  -- filename
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- dashboard
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
   ██████╗ ██████╗ ██╗   ██╗███████╗███████╗███████╗██╗   ██╗
  ██╔═══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██╔════╝██╔════╝╚██╗ ██╔╝
  ██║   ██║██║  ██║ ╚████╔╝ ███████╗███████╗█████╗   ╚████╔╝ 
  ██║   ██║██║  ██║  ╚██╔╝  ╚════██║╚════██║██╔══╝    ╚██╔╝  
  ╚██████╔╝██████╔╝   ██║   ███████║███████║███████╗   ██║   
   ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝╚══════╝╚══════╝   ╚═╝   
      ]]

      logo = string.rep("\n", 6) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}
