return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Install parsers
    local ts = require("nvim-treesitter")
    ts.install({
      "bash",
      "c",
      "diff",
      "go",
      "gomod",
      "gosum",
      "graphql",
      "html",
      "java",
      "javascript",
      "json",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "proto",
      "query",
      "typescript",
      "vim",
      "vimdoc",
    })

    -- Enable highlighting and indentation
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
