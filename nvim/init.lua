require("config.lazy")

require("nvim-tree").setup()

require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'rust', 'javascript', 'zig', 'c' }

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })

vim.api.nvim_create_autocmd('FileType', {
  pattern = { '<filetype>' },
  callback = function() vim.treesitter.start() end,
})

vim.opt.number = true
vim.opt.relativenumber = true 

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 4      
vim.opt.softtabstop = 4 
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.termguicolors = true

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
