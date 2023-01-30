local M = {
    'folke/twilight.nvim'
}

M.config = function()
    require("twilight").setup {
      context = 5, -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
      expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        "function",
        "method",
        "table",
        "if_statement",
      },
    }

end

return M
