return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  lazy = false,
  dependencies = {
    require('user.reiend.plugins.planery').name,
  },
  config = function()
    local status_ok, builtin = pcall(require, 'telescope.builtin')

    if not status_ok then
      return
    end

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
}

