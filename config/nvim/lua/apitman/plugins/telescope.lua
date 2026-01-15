return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enabble Telescope extensions
    require('telescope').load_extension 'fzf'
    require('telescope').load_extension 'ui-select'

    -- Setup keymaps
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]search [F]files' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]search by [G]rep' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]search [W]ord under cursor' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]search [H]help' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]search in [K]eymaps' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]search in open [B]uffers' })
  end,
}
