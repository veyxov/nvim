local motion = function(motion)
    require 'spider'.motion(motion)
end

local mode = { 'n', 'o', 'x' }

local M = {
    "chrisgrieser/nvim-spider",
    keys = {
        { "w", function() motion 'w' end,  mode = mode },
        { "e", function() motion 'e' end,  mode = mode },
        { "b", function() motion 'b' end,  mode = mode },
        { "ge",function() motion 'ge' end, mode = mode },
    }
}

M.init = function()
    vim.keymap.set('n', 'W', 'w')
    vim.keymap.set('n', 'E', 'e')
    vim.keymap.set('n', 'b', 'B')
end

return M;
