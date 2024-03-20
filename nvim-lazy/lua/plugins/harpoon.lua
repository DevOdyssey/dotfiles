local icon = "🐝 "
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = {
      {
        "\\a",
        function()
          require("harpoon"):list():append()
        end,
        desc = icon .. "Harpoon Append",
      },
      {
        "\\d",
        function()
          require("harpoon"):list():remove()
        end,
        desc = icon .. "Harpoon Delete",
      },
      {
        "\\\\",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = icon .. "Harpoon Show List",
      },
      {
        "\\1",
        function()
          require("harpoon"):list():select(1)
        end,
        desc = icon .. "Harpoon File 1",
      },
      {
        "\\2",
        function()
          require("harpoon"):list():select(2)
        end,
        desc = icon .. "Harpoon File 2",
      },
      {
        "\\3",
        function()
          require("harpoon"):list():select(3)
        end,
        desc = icon .. "Harpoon File 3",
      },
      {
        "\\4",
        function()
          require("harpoon"):list():select(4)
        end,
        desc = icon .. "Harpoon File 4",
      },
      {
        "\\5",
        function()
          require("harpoon"):list():select(5)
        end,
        desc = icon .. "Harpoon File 5",
      },
      {
        "]h",
        function()
          require("harpoon"):list():next({ ui_nav_wrap = true })
        end,
        desc = icon .. "Harpoon Next",
      },
      {
        "[h",
        function()
          require("harpoon"):list():prev({ ui_nav_wrap = true })
        end,
        desc = icon .. "Harpoon Prev",
      },
    },
  },
}
