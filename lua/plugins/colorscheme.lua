return {
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        colors = {
          theme = {
            all = {
              ui = {
                bg = '#1c1917', -- oklch(27.4% 0.006 286.033)
                bg_gutter = 'none',
              },
            },
          },
        },
      }
      vim.cmd [[colorscheme kanagawa]]
    end,
  },
}
