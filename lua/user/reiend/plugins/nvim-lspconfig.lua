return {
  name = 'neovim/nvim-lspconfig',
  config = function()
    local status_ok, plugin = pcall(require, 'cmp_nvim_lsp')

    if not status_ok then
      return
    end

    -- Set up lspconfig.
    local capabilities = plugin.default_capabilities()

    require('lspconfig')['lua_ls'].setup {
      capabilities = capabilities,
    }
    require('lspconfig')['tsserver'].setup {
      capabilities = capabilities,
    }
  end,
}

