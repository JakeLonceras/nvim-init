return {
  name = 'nvim-tree/nvim-tree.lua',
  dependencies = require('user.reiend.plugins.nvim-web-devicons').name,
  version = '*',
  lazy = false,
  config = function()
    local status_ok, plugin = pcall(require, 'nvim-tree')

    if not status_ok then
      return
    end

    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    local keymap = require('user.reiend.utils').keymap

    keymap(
      'n',
      '<C-n>',
      ':NvimTreeToggle<CR>',
      { desc = 'Toggling file explorer' }
    )

    plugin.setup {
      sort_by = 'case_sensitive',
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    }
  end,
}

