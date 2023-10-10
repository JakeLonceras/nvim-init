return {
  name = 'creativenull/efmls-configs-nvim',
  dependencies = {
    require('lua.user.reiend.plugins.nvim-lspconfig').name,
  },
        tag = 'v0.1.3',
  lazy = false,
  config = function()
    local status_ok, plugin = pcall(require, 'cmp')

    if not status_ok then
      return
    end

    plugin.setup {

    }
  end,
}

