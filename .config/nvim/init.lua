-- Function for inspecting tables
P = function(value)
    print(vim.inspect(value))
    return value
end

-- Modules
require("options")
require("plugins")
require("bindings")
require("folds")
require("diagnostics")
require("autocommands")
