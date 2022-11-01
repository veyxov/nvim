-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/iz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/iz/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/iz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/iz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/iz/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\nﬂ\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\rmappings\1\0\3\nextra\2\nbasic\2\rextended\1\nextra\1\0\3\beol\agA\nbelow\bgco\nabove\bgcO\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\0\1\0\2\nblock\bgbc\tline\bgcc\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { 'require("cfg/luasnip")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    after_files = { "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["delaytrain.nvim"] = {
    config = { "\27LJ\2\n≤\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\tkeys\bnvi\1\5\0\0\v<Left>\v<Down>\t<Up>\f<Right>\anv\1\0\0\1\b\0\0\6h\6j\6k\6l\6w\6b\6e\1\0\2\17grace_period\3\1\rdelay_ms\3–\15\nsetup\15delaytrain\frequire\0" },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/delaytrain.nvim",
    url = "https://github.com/ja-ford/delaytrain.nvim"
  },
  everforest = {
    config = { "\27LJ\2\na\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\21color everforest\bcmd\thard\26everforest_background\6g\bvim\0" },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\ne\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\21invert_selection\1\finverse\2\rcontrast\thard\nsetup\fgruvbox\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  harpoon = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hydra.nvim"] = {
    config = { 'require("cfg/hydra")' },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/hydra.nvim",
    url = "https://github.com/anuvyklack/hydra.nvim"
  },
  ["keymap-layer.nvim"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/keymap-layer.nvim",
    url = "https://github.com/anuvyklack/keymap-layer.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\2\nﬂ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\17special_keys\1\0\2\21next_match_group\f<space>\21prev_match_group\n<tab>\vlabels\1\t\0\0\6n\6e\6i\6o\6a\6r\6s\6t\16safe_labels\1\t\0\0\6n\6e\6i\6o\6a\6r\6s\6t\1\0\1\16ignore_case\2\nsetup\15lightspeed\frequire\0" },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/lightspeed.nvim",
    url = "https://github.com/ggandor/lightspeed.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\nr\0\0\3\0\a\0\v6\0\0\0009\0\1\0009\0\2\0005\2\3\0B\0\2\0016\0\4\0'\2\5\0B\0\2\0029\0\6\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvim\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lspsaga.nvim"] = {
    commands = { "Lspsaga" },
    config = { 'require("cfg/lspsaga")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    after = { "mason.nvim" },
    commands = { "LspStart" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "nvim-lspconfig" },
    load_after = {
      ["mason-lspconfig.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    config = { 'require("cfg/tree")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    after = { "cmp-path", "cmp_luasnip", "cmp-buffer", "cmp-cmdline", "cmp-nvim-lsp" },
    config = { 'require("cfg/cmp")' },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    after = { "lsp_lines.nvim", "nvim-cmp" },
    config = { 'require("cfg/lsp")' },
    load_after = {
      ["mason.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n–\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\1\0\t\vchange\akc\15normal_cur\bkss\vnormal\aks\16insert_line\v<C-g>S\vdelete\ads\16visual_line\agS\vvisual\6K\20normal_cur_line\bySS\16normal_line\akS\nsetup\18nvim-surround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { 'require("cfg/treesitter")' },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    config = { 'require("cfg/treesitter-textobjects")' },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["smart-pairs"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0B\0\2\1K\0\1\0\nsetup\npairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/smart-pairs",
    url = "https://github.com/ZhiyuanLck/smart-pairs"
  },
  ["stay-centered.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18stay-centered\frequire\0" },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/stay-centered.nvim",
    url = "https://github.com/arnamak/stay-centered.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { 'require("cfg/telescope")' },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["typebreak.nvim"] = {
    config = { "\27LJ\2\n}\0\0\a\0\t\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\0045\5\b\0B\0\5\1K\0\1\0\1\0\1\tdesc\14Typebreak\nstart\14typebreak\frequire\15<leader>tb\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/typebreak.nvim",
    url = "https://github.com/nagy135/typebreak.nvim"
  },
  ["vim-moonfly-colors"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/vim-moonfly-colors",
    url = "https://github.com/bluz71/vim-moonfly-colors"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: hydra.nvim
time([[Config for hydra.nvim]], true)
require("cfg/hydra")
time([[Config for hydra.nvim]], false)
-- Config for: delaytrain.nvim
time([[Config for delaytrain.nvim]], true)
try_loadstring("\27LJ\2\n≤\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\tkeys\bnvi\1\5\0\0\v<Left>\v<Down>\t<Up>\f<Right>\anv\1\0\0\1\b\0\0\6h\6j\6k\6l\6w\6b\6e\1\0\2\17grace_period\3\1\rdelay_ms\3–\15\nsetup\15delaytrain\frequire\0", "config", "delaytrain.nvim")
time([[Config for delaytrain.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\nﬂ\1\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\rmappings\1\0\3\nextra\2\nbasic\2\rextended\1\nextra\1\0\3\beol\agA\nbelow\bgco\nabove\bgcO\ropleader\1\0\2\nblock\agb\tline\agc\ftoggler\1\0\0\1\0\2\nblock\bgbc\tline\bgcc\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: stay-centered.nvim
time([[Config for stay-centered.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18stay-centered\frequire\0", "config", "stay-centered.nvim")
time([[Config for stay-centered.nvim]], false)
-- Config for: everforest
time([[Config for everforest]], true)
try_loadstring("\27LJ\2\na\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\21color everforest\bcmd\thard\26everforest_background\6g\bvim\0", "config", "everforest")
time([[Config for everforest]], false)
-- Config for: lightspeed.nvim
time([[Config for lightspeed.nvim]], true)
try_loadstring("\27LJ\2\nﬂ\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\17special_keys\1\0\2\21next_match_group\f<space>\21prev_match_group\n<tab>\vlabels\1\t\0\0\6n\6e\6i\6o\6a\6r\6s\6t\16safe_labels\1\t\0\0\6n\6e\6i\6o\6a\6r\6s\6t\1\0\1\16ignore_case\2\nsetup\15lightspeed\frequire\0", "config", "lightspeed.nvim")
time([[Config for lightspeed.nvim]], false)
-- Config for: typebreak.nvim
time([[Config for typebreak.nvim]], true)
try_loadstring("\27LJ\2\n}\0\0\a\0\t\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0006\4\5\0'\6\6\0B\4\2\0029\4\a\0045\5\b\0B\0\5\1K\0\1\0\1\0\1\tdesc\14Typebreak\nstart\14typebreak\frequire\15<leader>tb\6n\bset\vkeymap\bvim\0", "config", "typebreak.nvim")
time([[Config for typebreak.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lspsaga lua require("packer.load")({'lspsaga.nvim'}, { cmd = "Lspsaga", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neotree lua require("packer.load")({'neo-tree.nvim'}, { cmd = "Neotree", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspStart lua require("packer.load")({'mason-lspconfig.nvim'}, { cmd = "LspStart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'smart-pairs', 'nvim-surround', 'gruvbox.nvim', 'vim-moonfly-colors', 'nvim-treesitter', 'LuaSnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
