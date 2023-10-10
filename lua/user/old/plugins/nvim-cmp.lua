return {
  name = 'hrsh7th/nvim-nvim-cmp',
  dependencies = {
    require('lua.user.reiend.plugins.nvim-lspconfig').name,
    require('lua.user.reiend.plugins.plugin-nvim-lsp').name,
    require('lua.user.reiend.plugins.plugin-buffer').name,
    require('lua.user.reiend.plugins.plugin-path').name,
    require('lua.user.reiend.plugins.plugin-cmdline').name,
    require('lua.user.reiend.plugins.lua-snip').name,
    require('lua.user.reiend.plugins.plugin-lua-snip').name,
  },
  version = '*',
  lazy = false,
  config = function()
    local status_ok, plugin = pcall(require, 'cmp')

    if not status_ok then
      return
    end

    plugin.setup {
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body)   -- For `vsnip` users.
          require('lua.user.reiend.plugins.lua-snip').config { args = args }
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = plugin.config.window.bordered(),
        -- documentation = plugin.config.window.bordered(),
      },
      mapping = plugin.mapping.preset.insert {
        ['<C-b>'] = plugin.mapping.scroll_docs(-4),
        ['<C-f>'] = plugin.mapping.scroll_docs(4),
        ['<C-Space>'] = plugin.mapping.complete(),
        ['<C-e>'] = plugin.mapping.abort(),
        ['<CR>'] = plugin.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      },
      sources = plugin.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      }),
    }

    -- Set configuration for specific filetype.
    plugin.setup.filetype('gitcommit', {
      sources = plugin.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/plugin-git).
      }, {
        { name = 'buffer' },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    plugin.setup.cmdline({ '/', '?' }, {
      mapping = plugin.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    require('lua.user.reiend.plugins.nvim-lspconfig').config()
  end,
}

