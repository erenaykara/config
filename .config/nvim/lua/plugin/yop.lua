local function config()
    local yop = require("yop")

    -- Go to start of a text object
    yop.op_map({ "n", "v" }, "gs", function() end, { desc = "Go to start of text object" })

    -- Go to end of a text object
    yop.op_map({ "n", "v" }, "ge", function(lines, info)
        local position = info.position.last
        vim.api.nvim_win_set_cursor(0, { position[1], position[2] })
    end, { desc = "Go to end of text object" })
end

return {
    "zdcthomas/yop.nvim",
    config = config,
    event = { "BufRead", "BufNewFile" },
}
