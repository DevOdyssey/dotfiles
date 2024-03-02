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
  return vim.fm.executable("make") == 1
end

local tag = "🔭 "
return {

  -- telescope.nvim
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = get_build(),
        enabled = has_buildable(),
      },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        ";r",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = tag .. "Fzf File-Name in Plugin Directory",
      },
      {
        ";s",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({
            additional_args = { "--hidden" },
          })
        end,
        desc = tag .. "Fzf String in Current Directory",
      },
      {
        "\\\\",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = tag .. "Fzf Buffer",
      },
      {
        ";h",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = tag .. "Fzf Help-Tag",
      },
      {
        ";;",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
        end,
        desc = tag .. "Fzf Resume",
      },
      {
        ";d",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = tag .. "Fzf Diagnostics",
      },
      {
        ";t",
        function()
          local builtin = require("telescope.builtin")
          builtin.treesitter()
        end,
        desc = tag .. "Fzf Treesitter",
      },
      {
        ";f",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = tag .. "Open File Browser in buffer Directory",
      },
    },

    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }

      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
