vim.opt.number = true
vim.opt.relativenumber = true 

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add({
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- optional
  { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
})


vim.opt.tabstop = 4      -- Visual width of a tab
vim.opt.softtabstop = 4  -- Number of spaces a tab counts for while editing
vim.opt.shiftwidth = 4   -- Size of an indent
vim.opt.expandtab = true -- Turn tabs into spaces

vim.opt.termguicolors = true

require("nvim-tree").setup()

  ---@type nvim_tree.config
  local config = {
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  }
  require("nvim-tree").setup(config)

vim.opt.showmode = false 

local mode_labels = {
  ['n']  = ' NORMAL ',
  ['i']  = ' INSERT ',
  ['v']  = ' VISUAL ',
  ['V']  = ' V-LINE ',
  ['\22'] = ' V-BLOCK ',
  ['c']  = ' COMMAND ',
  ['R']  = ' REPLACE ',
}

function SimpleStatusLine()
  if vim.bo.filetype == 'NvimTree' then
    return '%#StatusLineNC# EXPLORER '
  end

  local current_mode = vim.api.nvim_get_mode().mode
  local label = mode_labels[current_mode] or ' NORMAL '
  
  return '%#BoxyMode#' .. label .. '%#StatusLine#'
end

vim.opt.statusline = '%{%v:lua.SimpleStatusLine()%}'

vim.api.nvim_set_hl(0, "BoxyMode", { fg = "#1E222A", bg = "#FF5F00", bold = true })

vim.api.nvim_set_hl(0, "StatusLine", { fg = "#6B7280", bg = "#F5F6F7", reverse = false })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#6B7280", bg = "#F5F6F7" })
