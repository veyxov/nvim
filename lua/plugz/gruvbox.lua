local M = {
    "sainnhe/gruvbox-material",
    event = "InsertEnter"
}

M.config = function() 
    vim.cmd.colorscheme "gruvbox-material"
end

return M
