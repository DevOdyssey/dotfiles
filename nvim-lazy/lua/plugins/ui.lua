return {
  -- {
  --   "carbon-steel/detour.nvim",
  --   config = function()
  --     vim.keymap.set("n", "<c-w><enter>", ":Detour<cr>")
  --     vim.keymap.set("n", "<leader>t", function()
  --       local ok = require("detour").Detour() -- Open a detour popup
  --       if not ok then
  --         return
  --       end
  --
  --       vim.cmd.enew()
  --       vim.bo.bufhidden = "delete"
  --       require("telescope.builtin").buffers({})
  --       vim.api.nvim_feedkeys("term://", "n", true)
  --     end)
  --   end,
  -- },
  {
    "tamton-aquib/keys.nvim",
    cmd = "KeysToggle",
    keys = {
      { "<leader>uk", "<cmd>KeysToggle<cr>" },
    },
  },

  -- vim-tmux-navigator
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
