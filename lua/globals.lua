function _G.map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

function _G.nmap(lhs, rhs) map("n", lhs, rhs) end
function _G.vmap(lhs, rhs) map("v", lhs, rhs) end

function _G.augroup(name)
  return vim.api.nvim_create_augroup("u_" .. name, { clear = true })
end

function _G.autocmd(event, group, opts)
  opts.group = augroup(group)
  vim.api.nvim_create_autocmd(event, opts)
end

function _G.disable(names, value)
  for _, n in ipairs(names) do vim.g[n] = value end
end
