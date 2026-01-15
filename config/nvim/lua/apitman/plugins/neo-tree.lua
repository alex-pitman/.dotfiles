return {
  "nvim-neo-tree/neo-tree.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
  },
  opts = {
    close_if_last_window = false,
    filesystem = {
      filtered_items = {
        visible = true,
      },
      follow_current_file = {
        enabled = true,
      },
      window = {
        mappings = {
          ["\\"] = "close_window",
        },
      },
    },
  },
}
