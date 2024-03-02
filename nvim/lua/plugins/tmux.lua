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
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc="Window Nav Left" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc="Window Nav Down"},
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc="Window Nav Up"},
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc="Window Nav Right"},
    },
  },  
}
