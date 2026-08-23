vim.g.mapleader = ' '

function _G.map(lhs, rhs, mode)
  vim.keymap.set(mode or 'n', lhs, rhs, { silent = true })
end

function _G.lmap(lhs, rhs, mode) map('<leader>' .. lhs, rhs, mode) end

function _G.cmd(s) return '<cmd>' .. s .. '<cr>' end

function _G.gh(s) return 'https://github.com/' .. s end

function _G.augroup(name)
  return vim.api.nvim_create_augroup('u_' .. name, { clear = true })
end

function _G.autocmd(event, group, opts)
  opts.group = augroup(group)
  vim.api.nvim_create_autocmd(event, opts)
end

function disable(names, value, prefix, suffix)
  prefix, suffix = prefix or 'loaded_', suffix or '_provider'
  for _, n in ipairs(names) do vim.g[prefix .. n .. suffix] = value end
end

disable({
  'netrw', 'netrwPlugin', 'tarPlugin', 'zipPlugin', 'gzip',
  '2html_plugin', 'tutor_mode_plugin', 'matchit', 'spellfile_plugin', 'fzf',
}, 1, nil, '')
disable({ 'python3', 'ruby', 'perl', 'node' }, 0)
