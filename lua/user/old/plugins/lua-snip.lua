return {
  name = 'L3MON4D3/LuaSnip',
  config = function(data)
    local status_ok, plugin = pcall(require, 'luasnip')

    if not status_ok then
      return
    end

    plugin.lsp_expand(data.args.body) -- For `luasnip` users.
  end,
}

