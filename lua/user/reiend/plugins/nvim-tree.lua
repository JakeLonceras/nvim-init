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

    plugin.setup {}
  end,
}

