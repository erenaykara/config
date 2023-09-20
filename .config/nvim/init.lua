-- Function for inspecting tables
P = function(value)
    print(vim.inspect(value))
    return value
end

-- Modules
require("loader")
require("bindings")
require("lazygit")
require("diagnostics")
require("generic")
