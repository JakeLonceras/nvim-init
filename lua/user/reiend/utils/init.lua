return {
  keymap  = vim.keymap.set,
  package_manager = {
    lazy = {
      get_config = function(data)
        local config = {}
        for key, value in pairs(data.plugin) do
          if key == 'name' then
            table.insert(config, value)
          else
            config[key] = value
          end
        end
        return config
      end,
    },
  },
}

