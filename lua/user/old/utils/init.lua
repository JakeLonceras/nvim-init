return {
  package_manager = {
    lazy = {
      download = function(data)
        vim.fn.system { data.command }
      end,
      get_config = function(data)
        local config = {}
        for key, value in pairs(data.plugin) do
          if key == 'name' then
            table.insert(value)
          end
          config[key] = value
        end
        return config
      end,
    },
  },
}

