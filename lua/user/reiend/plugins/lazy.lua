local get_config = require('user.reiend.utils').package_manager.lazy.get_config

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  get_config { plugin = require 'user.reiend.plugins.nvim-tree' },
  get_config { plugin = require 'user.reiend.plugins.nvim-autopairs' },
  get_config { plugin = require 'user.reiend.plugins.mason' },
  get_config { plugin = require 'user.reiend.plugins.mason-lspconfig' },
  get_config { plugin = require 'user.reiend.plugins.nvim-cmp' },
  get_config { plugin = require 'user.reiend.plugins.everforest' },
  get_config { plugin = require 'user.reiend.plugins.nvim-treesitter' },
  get_config { plugin = require 'user.reiend.plugins.efmls-configs-nvim' },
  get_config { plugin = require 'user.reiend.plugins.telescope' },
}

