return {
  -- oil.nvim
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      vim.keymap.set("n", "\\\\", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },

  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            -- ".git/",
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {
            -- some generate ...
          },
        },
      },
    },
  },
}
