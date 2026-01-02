return {
  'mason-org/mason-lspconfig.nvim',
  opts = {
    ensure_installed = {
      'lua_ls',
      'gopls',
    },
  },
  dependencies = {
    { 'mson-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
