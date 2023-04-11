local motion = function(motion)
    require 'spider'.motion(motion)
end

local mode = { 'n', 'o', 'x' }

local M = {
    "chrisgrieser/nvim-spider",
    keys = {
        { "<leader>w",     function() motion 'w' end,  mode = mode },
        { "<leader>e", function() motion 'e' end,  mode = mode },
        { "<cr>b",     function() motion 'b' end,  mode = mode },
        { "ge",        function() motion 'ge' end, mode = mode },
    }
}

return M;
