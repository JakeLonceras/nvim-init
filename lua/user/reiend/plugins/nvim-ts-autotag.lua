return {
  name = 'windwp/nvim-ts-autotag',
  version = '*',
  lazy = false,
  config = function()
    local status_ok, plugin = pcall(require, 'nvim-ts-autotag')

    if not status_ok then
      return
    end

    plugin.setup {}
  end,
}

