local map = require'globals'.Map
local cmd = require'globals'.Cmd

map('<leader>t', cmd [[lua vim.fn.jobstart({ 'tmux', 'neww', 'make tust ; read' })]])

GetClassName = function ()
    local bufnr = vim.api.nvim_get_current_buf()

    local get_root_node = function ()
        local parser = vim.treesitter.get_parser(bufnr, "c_sharp", {})
        local tree = parser:parse()[1]

        return tree:root()
    end

    local get_class_name = function()
        -- The actual tree-sitter query
        local querystr = "(class_declaration name: (identifier) @name)"

        local query = vim.treesitter.parse_query("c_sharp", querystr)

        -- Get the actual data
        for _, match, _ in query:iter_matches(get_root_node(), bufnr, 0, -1) do
          for _, node in pairs(match) do
            local class_name = vim.treesitter.get_node_text(node, bufnr)

            return class_name
          end
        end
    end

    return get_class_name()
end

local getCurrentMethodName = function()
    local ts_utils = require'nvim-treesitter.ts_utils'

    local current_node = ts_utils.get_node_at_cursor() if not current_node then return "" end

    local expr = current_node

    while expr do
        if expr:type() == 'method_declaration' then
            break
        end
        expr = expr:parent()
    end

    if not expr then return "" end

    for node, field in expr:iter_children() do
        if (field == "name") then
            return ts_utils.get_node_text(node)[1]
        end
    end

end

RunTest = function()
    RunTestOnTerminal(getCurrentMethodName())
end

RunTestOnTerminal = function(method_name)
    local the_command = string.format([[dotnet test --filter "FullyQualifiedName~%s" ; read]], method_name)
    print(the_command)
    vim.fn.jobstart({"tmux", "neww", the_command})
end

vim.keymap.set("n", "<leader>T", "<cmd>lua RunTest()<CR>")
