return {
  'sainnhe/everforest',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    local status_ok, _plugin = pcall(require, 'everforest')

    if not status_ok then
      return
    end

    vim.g.everforest_background = 'hard'
    vim.g.everforest_better_performance = 1
    vim.opt.background = 'dark'
    vim.cmd [[ colorscheme everforest ]]
  end,
}

