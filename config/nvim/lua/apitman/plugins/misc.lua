return {
  {
    -- Highlight todo, notes, etc.
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    -- Indentation style detection
    "NMAC427/guess-indent.nvim",
    opts = {},
  },
  {
    -- Color highligher
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    -- Autoclose parentheses, brackets, quotes, etc.
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
}
