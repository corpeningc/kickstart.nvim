return {
  { -- Toggle terminal
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      -- Detect OS and set appropriate shell
      local shell = vim.o.shell -- Use system default
      if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
        shell = 'powershell'
      end

      require('toggleterm').setup {
        open_mapping = [[<leader>t]],
        direction = 'float',
        insert_mappings = false,
        terminal_mappings = false,
        shell = shell,
      }
    end,
  },
}
