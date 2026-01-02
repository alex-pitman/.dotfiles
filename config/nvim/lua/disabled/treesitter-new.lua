return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    local ts = require('nvim-treesitter')

    local ensure_installed = {
      'lua',
      'go',
    }

    local installed = ts.get_installed()
    local to_install = {}

    for _, parser in ipairs(ensure_installed) do
      if not vim.tbl_contains(installed, parser) then
        table.insert(to_install, parser)
      end
    end

    if #to_install > 0 then
      ts.install(to_install)
    end

    -- Enable highlighting and indendation
    vim.api.nvim_create_autocmd('FileType', {
      pattern = { '<filetype>' },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
