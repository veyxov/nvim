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
