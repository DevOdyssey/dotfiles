local etc = require("help.etc")

local function get_build()
  if etc.is_window() then
    return "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
  end
  return "make"
end

local function has_buildable()
  if etc.is_window() then
    return vim.fn.executable("cmake") == 1
  end
  return vim.fn.executable("make") == 1
end

local icon = require("help.config").icons.misc.telescope .. " "

return {
  {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = get_build(),
        enabled = has_buildable(),
      },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })

      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")

      -- telescope keymaps
      local map = vim.keymap.set
      local tb = etc.telescope

      -- short keymaps
      map("n", "\\\\", tb("buffers", { sort_mru = true, sort_lastused = true }), { desc = icon .. "Switch Buffers" })
      map("n", "<leader>:", tb("command_history"), { desc = icon .. "Command History" })
      map("n", "<leader>\\", tb("live_grep"), { desc = icon .. "Search Grep(root)" })
      map("n", "<leader><space>", tb("find_files"), { desc = icon .. "Find Files(root)" })
      map("n", "<leader>/", etc.buffer_fzf(), { desc = icon .. "Search Buffer" })

      -- git
      map("n", "<leader>gc", tb("git_commits"), { desc = icon .. "[G]it [C]ommits" })
      map("n", "<leader>gs", tb("git_status"), { desc = icon .. "[G]it [S]tatus" })

      -- find
      map("n", "<leader>fb", tb("buffers", { sort_mru = true, sort_lastused = true }), { desc = icon .. "[F]ind [B]uffers" })
      map("n", "<leader>fc", etc.config_files(), { desc = icon .. "[F]ind [C]onfig" })
      map("n", "<leader>ff", tb("find_files"), { desc = icon .. "[F]ind [F]ile (root)" })
      map("n", "<leader>fF", tb("find_files", { cwd = false }), { desc = icon .. "[F]ind [F]ile (cwd)" })
      map("n", "<leader>fg", tb("git_files"), { desc = icon .. "[F]ind [G]it Files" })
      map("n", "<leader>fr", tb("oldfiles"), { desc = icon .. "[F]ind [R]ecent Files" })

      -- search
      map("n", '<leader>s"', tb("registers"), { desc = icon .. "[S]earch Registers" })
      map("n", "<leader>sa", tb("autocommands"), { desc = icon .. "[S]earch [A]utocommands" })
      map("n", "<leader>sb", etc.buffer_fzf(), { desc = icon .. "[S]earch [B]uffer" })
      map("n", "<leader>sc", tb("command_history"), { desc = icon .. "[S]earch [C]ommand History" })
      map("n", "<leader>sC", tb("commands"), { desc = icon .. "[S]earch [C]ommands" })
      map("n", "<leader>sd", tb("diagnostics", { bufnr = 0 }), { desc = icon .. "[S]earch [D]iagnostics (doc)" })
      map("n", "<leader>sD", tb("diagnostics"), { desc = icon .. "[S]earch [D]iagnostics (ws)" })
      map("n", "<leader>sg", tb("live_grep"), { desc = icon .. "[S]earch [G]rep (root)" })
      map("n", "<leader>sG", tb("live_grep", { cwd = false }), { desc = icon .. "[S]earch [G]rep (cwd)" })
      map("n", "<leader>sh", tb("help_tags"), { desc = icon .. "[S]earch [H]elps" })
      map("n", "<leader>sH", tb("highlights"), { desc = icon .. "[S]earch [H]ighlights" })
      map("n", "<leader>sk", tb("keymaps"), { desc = icon .. "[S]earch [K]eymaps" })
      map("n", "<leader>sm", tb("marks"), { desc = icon .. "[S]earch [M]arks" })
      map("n", "<leader>sM", tb("man_pages"), { desc = icon .. "[S]earch [M]an Pages" })
      map("n", "<leader>so", tb("vim_options"), { desc = icon .. "[S]earch Vim [O]ptions" })
      map("n", "<leader>sR", tb("resume"), { desc = icon .. "Resume" })
      map({ "n", "v" }, "<leader>sw", tb("grep_string", { word_match = "-w" }), { desc = icon .. "[S]earch [W]ord (root)" })
      map({ "n", "v" }, "<leader>sw", tb("grep_string", { cwd = false, word_match = "-w" }), { desc = icon .. "[S]earch [W]ord (cwd)" })
      map("n", "<leader>ss", tb("lsp_document_symbols"), { desc = icon .. "[Search] [S]ymbols Document" })
      map("n", "<leader>sS", tb("lsp_dynamic_workspace_symbols"), { desc = icon .. "[Search] [S]ymbols Workspace" })

      -- etc
      map("n", "<leader>uC", tb("colorscheme", { enable_preview = true }), { desc = icon .. "Colorscheme with preview" })
    end,
  },
}
