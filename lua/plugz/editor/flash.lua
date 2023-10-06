local lbls = 'netsidarhol/m?f;cu,w'

local M = {
    'folke/flash.nvim',
    keys = {
        {
            's',
            mode = { 'n', 'x', 'o' },
            function()
                require('flash').jump {
                    search = {
                        mode = function(str) return '\\<' .. str end,
                    },
                }
            end,
        },
        {
            'r',
            mode = 'o',
            function()
                -- jump to a remote location to execute the operator
                require('flash').remote()
            end,
            desc = 'Remote Flash',
        },
        {
            'S',
            mode = { 'n', 'o', 'x' },
            function()
                -- show labeled treesitter nodes around the search matches
                require('flash').treesitter_search()
            end,
            desc = 'Treesitter Search',
        },
        {
            'rs',
            function()
                local Flash = require("flash")

---@param opts Flash.Format
local function format(opts)
  -- always show first and second label
  return {
    { opts.match.label1, "FlashMatch" },
    { opts.match.label2, "FlashLabel" },
  }
end

Flash.jump({
  search = { mode = "search" },
  label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
  pattern = [[\<]],
  action = function(match, state)
    state:hide()
    Flash.jump({
      search = { max_length = 0 },
      highlight = { matches = false },
      label = { format = format },
      matcher = function(win)
        -- limit matches to the current label
        return vim.tbl_filter(function(m)
          return m.label == match.label and m.win == win
        end, state.results)
      end,
      labeler = function(matches)
        for _, m in ipairs(matches) do
          m.label = m.label2 -- use the second label
        end
      end,
    })
  end,
  labeler = function(matches, state)
    local labels = state:labels()
    for m, match in ipairs(matches) do
      match.label1 = labels[math.floor((m - 1) / #labels) + 1]
      match.label2 = labels[(m - 1) % #labels + 1]
      match.label = match.label1
    end
  end,
})
            end
        },
        {
            -- Show diagnostic details
            '<leader>dd',
            function()
                require('flash').jump {
                    matcher = function(win)
                        return vim.tbl_map(
                        ---@param diag Diagnostic
                            function(diag)
                                return {
                                    pos = { diag.lnum + 1, diag.col },
                                    end_pos = {
                                        diag.end_lnum + 1,
                                        diag.end_col - 1,
                                    },
                                }
                            end,
                            vim.diagnostic.get(vim.api.nvim_win_get_buf(win))
                        )
                    end,
                    action = function(match, state)
                        vim.api.nvim_win_call(match.win, function()
                            vim.api.nvim_win_set_cursor(match.win, match.pos)
                            vim.diagnostic.open_float()
                            vim.api.nvim_win_set_cursor(match.win, state.pos)
                        end)
                    end,
                }
            end,
        },
        {
            '<leader>w',
            function() require('flash').jump {} end,
        },
    },
}

M.opts = {
    labels = lbls,
    search = {
        multi_window = true,
        forward = true,
        wrap = true,
        mode = 'exact',
        incremental = false,
        filetype_exclude = { 'notify', 'noice' },
        trigger = '',
    },
    jump = {
        jumplist = true,
        pos = 'start', ---@type "start" | "end" | "range"
        history = false,
        register = false,
        nohlsearch = false,
        autojump = true,
    },
    highlight = {
        backdrop = true,
        matches = true,
        priority = 5000,
        groups = {
            match = 'FlashMatch',
            current = 'FlashCurrent',
            backdrop = 'FlashBackdrop',
            label = 'FlashLabel',
        },
    },
    modes = {
        search = {
            enabled = false, -- enable flash for search
        },
        char = {
            enabled = false,
        },
        treesitter = {
            labels = lbls,
            jump = { pos = 'range' },
            highlight = {
                label = { before = true, after = true, style = 'inine' },
                backdrop = false,
                matches = false,
            },
        },
    },
}

return M
