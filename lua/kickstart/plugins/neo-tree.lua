-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree toggle<CR>', desc = 'Neotree foucs' },
    {
      '<leader>o',
      function()
        if vim.bo.filetype == 'neo-tree' then
          vim.cmd.wincmd 'p'
        else
          vim.cmd.Neotree 'focus'
        end
      end,
      desc = 'Toggle Explorer Focus',
    },
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['l'] = 'open', -- 'l' to open file
          ['h'] = 'close_node', -- 'h' to close folder
          ['a'] = { 'add', config = { show_path = 'relative' } }, -- Add file
          ['d'] = 'delete', -- Delete file
          ['r'] = 'rename', -- Rename
          ['y'] = 'copy_to_clipboard', -- Copy path
          ['x'] = 'cut_to_clipboard', -- Cut
          ['p'] = 'paste_from_clipboard', -- Paste
          ['<esc>'] = 'cancel', -- Escape closes prompts
        },
      },
    },
  },
}
