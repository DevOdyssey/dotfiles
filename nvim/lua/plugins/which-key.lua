return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("which-key").setup()
      require("which-key").register({
        ["g"] = { name = "+[G]oto", _ = "which_key_ignore" },
        ["gs"] = { name = "+Surround", _ = "which_key_ignore" },
        ["]"] = { name = "+[N]ext", _ = "which_key_ignore" },
        ["["] = { name = "+[P]rev", _ = "which_key_ignore" },
        ["<leader>b"] = { name = "+[B]uffer", _ = "which_key_ignore" },
        ["<leader>c"] = { name = "+[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "+[D]ebug/Document", _ = "which_key_ignore" },
        ["<leader>f"] = { name = "+[F]ile/Find", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "+[G]it", _ = "which_key_ignore" },
        ["<leader>q"] = { name = "+[Q]uit/Session", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "+[R]efactoring", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "+[S]earch", _ = "which_key_ignore" },
        ["<leader>t"] = { name = "+[T]est", _ = "which_key_ignore" },
        ["<leader>u"] = { name = "+[U]I", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "+[W]orkspace/Window", _ = "which_key_ignore" },
        ["<leader>x"] = { name = "+[X]Diagnostics/Quickfix", _ = "which_key_ignore" },
      })
    end,
  },
}
