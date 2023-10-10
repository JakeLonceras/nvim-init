return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  lazy = false,
  config = function()
    local status_ok, plugin = pcall(require, 'telescope')

    if not status_ok then
      return
    end

    vim.keymap.set('n', '<leader>ff', plugin.builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', plugin.builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', plugin.builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', plugin.builtin.help_tags, {})
  end,
}

