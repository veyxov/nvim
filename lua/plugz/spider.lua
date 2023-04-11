local motion = function(motion)
    require 'spider'.motion(motion)
end

local mode = { 'n', 'o', 'x' }

local M = { "chrisgrieser/nvim-spider" }

M.keys = {
    { "w",  function() motion 'w' end,  mode = mode },
    { "e",  function() motion 'e' end,  mode = mode },
    { "b",  function() motion 'b' end,  mode = mode },
    { "ge", function() motion 'ge' end, mode = mode },
}

M.init = function()
    local map = require 'globals'.Map

    map('W', 'w')
    map('E', 'e')
    map('b', 'B')
end

return M;
