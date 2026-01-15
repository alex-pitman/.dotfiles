return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = {
      -- Customize your input configuration here, or leave it empty for defaults
      icon = " ", -- Icon to display in the input window
      icon_hl = "SnacksInputIcon", -- Highlight group for the icon
      icon_pos = "left", -- Position of the icon
      prompt_pos = "title", -- Position of the prompt
      win = {
        style = "input", -- Use the predefined 'input' window style
      },
      expand = true, -- Allow the window to expand
    },
    lazygit = {},
  },
}
