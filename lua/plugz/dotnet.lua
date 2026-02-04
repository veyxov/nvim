return {
    'GustavEikaas/easy-dotnet.nvim',
    ft = { 'cs', 'csharp', "c_sharp" },
    event = "BufEnter",
    build = ':Dotnet _server update',
    config = function()
        local dotnet = require 'easy-dotnet'
        dotnet.setup({
            picker = 'snacks'
        })
    end
}
