local M = {}
-- Cartographer
M.Map = function(lhs, rhs, mode)
	mode = mode or "n" -- We are normal, most of the time
	vim.keymap.set(mode, lhs, rhs)
end

return M
