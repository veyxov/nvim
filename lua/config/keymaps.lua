nmap("<Esc>", "<cmd>nohlsearch<cr>")

nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

vmap("J", ":m '>+1<cr>gv=gv")
vmap("K", ":m '<-2<cr>gv=gv")

nmap("<C-d>", "<C-d>zz")
nmap("<C-u>", "<C-u>zz")
nmap("n", "nzzzv")
nmap("N", "Nzzzv")

vmap("<", "<gv")
vmap(">", ">gv")

nmap("<leader>w", "<cmd>write<cr>")
nmap("<leader>q", "<cmd>quit<cr>")

nmap("<S-l>", "<cmd>bnext<cr>")
nmap("<S-h>", "<cmd>bprevious<cr>")

nmap("<leader>e", vim.diagnostic.open_float)
nmap("[d", function() vim.diagnostic.jump({ count = -1 }) end)
nmap("]d", function() vim.diagnostic.jump({ count = 1 }) end)
