return {
  "andythigpen/nvim-coverage",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-neotest/neotest",
  },
  config = function()
    require("coverage").setup({
      auto_reload = true,
      lang = {
        java = {
          coverage_file = "target/site/jacoco/jacoco.xml",
        },
      },
    })
  end,
}
