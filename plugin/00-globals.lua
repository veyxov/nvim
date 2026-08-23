vim.g.mapleader = ' '

function _G.map(lhs, rhs, mode)
  vim.keymap.set(mode or 'n', lhs, rhs, { silent = true })
end

function _G.lmap(lhs, rhs, mode) map('<leader>' .. lhs, rhs, mode) end

function _G.cmd(s) return '<cmd>' .. s .. '<cr>' end

function _G.gh(s) return 'https://github.com/' .. s end

-- defer fn past startup; errors inside are caught + traced instead of
-- silently killing the rest of the deferred block (mini.misc.safely)
function _G.later(fn)
  vim.schedule(function() require('mini.misc').safely('now', fn) end)
end

function _G.augroup(name)
  return vim.api.nvim_create_augroup('u_' .. name, { clear = true })
end

function _G.autocmd(event, group, opts)
  opts.group = augroup(group)
  vim.api.nvim_create_autocmd(event, opts)
end
