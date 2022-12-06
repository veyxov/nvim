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
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["flit.nvim"] = {
    config = { "\27LJ\2\nº\1\0\0\5\0\f\0\0165\0\0\0006\1\1\0009\1\2\1'\3\3\0B\1\2\0016\1\4\0'\3\5\0B\1\2\0029\1\6\0015\3\a\0005\4\b\0=\0\t\4=\0\n\4=\4\v\3B\1\2\1K\0\1\0\topts\vlabels\16safe_labels\1\0\0\1\0\1\18labeled_modes\bnvo\nsetup\tflit\frequire\26:PackerLoad leap.nvim\bcmd\bvim\1\t\0\0\6n\6e\6i\6o\6s\6a\6r\6t\0" },
    keys = { { "", "f" }, { "", "F" }, { "", "t" }, { "", "T" } },
    load_after = {
      ["leap.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/flit.nvim",
    url = "https://github.com/ggandor/flit.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\radd_file\17harpoon.mark\frequireD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\22toggle_quick_menu\15harpoon.ui\frequireZ\1\0\5\0\b\0\0156\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\6\0003\4\a\0B\0\4\1K\0\1\0\0\6)\0\6(\6n\bset\vkeymap\bvim\0" },
    keys = { { "", "(" }, { "", ")" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["leap.nvim"] = {
    after = { "flit.nvim" },
    config = { "\27LJ\2\nÅ\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0025\1\2\0009\2\3\0B\2\1\0019\2\4\0=\1\5\0029\2\4\0=\1\6\2K\0\1\0\vlabels\16safe_labels\topts\25add_default_mappings\1\t\0\0\6n\6e\6i\6o\6s\6a\6r\6t\tleap\frequire\0" },
    keys = { { "", "s" }, { "", "S" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nnn.nvim"] = {
    commands = { "NnnExplorer", "NnnPicker" },
    config = { "\27LJ\2\nØ\2\0\0\4\0\r\0\0185\0\1\0005\1\0\0=\1\2\0005\1\3\0005\2\4\0=\2\5\1=\1\6\0004\1\0\0=\1\a\0005\1\b\0=\1\t\0006\1\n\0'\3\v\0B\1\2\0029\1\f\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\bnnn\frequire\14windownav\1\0\4\tnext\v<C-w>w\nright\v<C-w>l\tprev\v<C-w>W\tleft\v<C-w>h\rmappings\vpicker\nstyle\1\0\5\vborder\frounded\nwidth\3\1\fyoffset\3\0\fxoffset\3\0\vheight\3\1\1\0\1\bcmd\bnnn\rexplorer\1\0\1\15auto_close\2\1\0\3\nwidth\3\24\bcmd\bnnn\tside\ftopleft\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nnn.nvim",
    url = "https://github.com/luukvbaal/nnn.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleû\3\1\0\v\0\27\00026\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\t¸ˇB\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\a5\t\15\0009\n\r\0009\n\14\n=\n\16\tB\a\2\2=\a\17\0069\a\3\0003\t\18\0005\n\19\0B\a\3\2=\a\20\0069\a\3\0003\t\21\0005\n\22\0B\a\3\2=\a\23\6B\4\2\2=\4\3\0034\4\3\0005\5\25\0>\5\1\4=\4\26\3B\1\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\rnvim_lsp\1\0\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\r<C-Down>\v<C-Up>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\n˙\6\0\0\6\0!\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\0025\3\14\0005\4\f\0005\5\r\0=\5\n\4=\4\15\0035\4\16\0005\5\17\0=\5\18\0045\5\19\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\4=\4\25\0035\4\26\0005\5\27\0=\5\28\0045\5\29\0=\5\30\4=\4\31\3=\3 \2B\0\2\1K\0\1\0\16textobjects\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\1\venable\2\tmove\22goto_previous_end\1\0\2\a[]\17@class.outer\a[M\20@function.outer\24goto_previous_start\1\0\2\a[m\20@function.outer\a[[\17@class.outer\18goto_next_end\1\0\2\a][\17@class.outer\a]M\20@function.outer\20goto_next_start\1\0\2\a]m\20@function.outer\a]]\17@class.outer\1\0\2\14set_jumps\2\venable\2\vselect\1\0\0\1\0\6\aif\20@function.inner\aaf\20@function.outer\aia\21@parameter.inner\aic\17@class.inner\aaa\21@parameter.outer\aac\17@class.outer\1\0\2\14lookahead\2\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_incremental\14<c-space>\21node_decremental\18<c-backspace>\19init_selection\14<c-space>\22scope_incremental\n<c-s>\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\0\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-tundra"] = {
    config = { "\27LJ\2\nå\1\0\0\3\0\t\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0016\0\3\0009\0\4\0'\1\6\0=\1\5\0006\0\3\0009\0\a\0'\2\b\0B\0\2\1K\0\1\0\23colorscheme tundra\bcmd\tdark\15background\bopt\bvim\nsetup\16nvim-tundra\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/nvim-tundra",
    url = "https://github.com/sam4llis/nvim-tundra"
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
  ["stay-centered.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18stay-centered\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/stay-centered.nvim",
    url = "https://github.com/arnamak/stay-centered.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    after = { "telescope.nvim" },
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n \1\0\0\4\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0'\2\a\0B\0\2\1K\0\1\0\bfzf\19load_extension\15extensions\1\0\0\1\0\4\14case_mode\15smart_case\25override_file_sorter\2\28override_generic_sorter\2\nfuzzy\2\nsetup\14telescope\frequire\0" },
    load_after = {
      ["telescope-fzf-native.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/iz/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleû\3\1\0\v\0\27\00026\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\24\0009\4\3\0009\4\4\0049\4\5\0045\6\a\0009\a\3\0009\a\6\a)\t¸ˇB\a\2\2=\a\b\0069\a\3\0009\a\6\a)\t\4\0B\a\2\2=\a\t\0069\a\3\0009\a\n\aB\a\1\2=\a\v\0069\a\3\0009\a\f\a5\t\15\0009\n\r\0009\n\14\n=\n\16\tB\a\2\2=\a\17\0069\a\3\0003\t\18\0005\n\19\0B\a\3\2=\a\20\0069\a\3\0003\t\21\0005\n\22\0B\a\3\2=\a\23\6B\4\2\2=\4\3\0034\4\3\0005\5\25\0>\5\1\4=\4\26\3B\1\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\rnvim_lsp\1\0\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\rbehavior\1\0\1\vselect\2\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\rcomplete\r<C-Down>\v<C-Up>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'NnnPicker', function(cmdargs)
          require('packer.load')({'nnn.nvim'}, { cmd = 'NnnPicker', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nnn.nvim'}, { cmd = 'NnnPicker' }, _G.packer_plugins)
          vim.api.nvim_input('<space><bs><tab>')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope-fzf-native.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope-fzf-native.nvim'}, { cmd = 'Telescope' }, _G.packer_plugins)
          vim.api.nvim_input('<space><bs><tab>')
      end})
pcall(vim.api.nvim_create_user_command, 'NnnExplorer', function(cmdargs)
          require('packer.load')({'nnn.nvim'}, { cmd = 'NnnExplorer', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nnn.nvim'}, { cmd = 'NnnExplorer' }, _G.packer_plugins)
          vim.api.nvim_input('<space><bs><tab>')
      end})
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> T <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'flit.nvim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ) <cmd>lua require("packer.load")({'harpoon'}, { keys = ")", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ( <cmd>lua require("packer.load")({'harpoon'}, { keys = "(", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> s <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> S <cmd>lua require("packer.load")({'leap.nvim'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-treesitter', 'nvim-tundra', 'stay-centered.nvim'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
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
