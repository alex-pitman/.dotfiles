return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "gopls",
      "graphql",
      "jdtls",
      "lua_ls",
      "protols",
      "ts_ls",
    },
  },
}
