-- Function for inspecting tables
P = function(value)
    print(vim.inspect(value))
    return value
end

-- Modules
require("options")
require("loader")
require("bindings")
require("folds")
require("diagnostics")
require("autocommands")
