-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('BufNewFile', {
  pattern = '*/diary/*.md',
  callback = function()
    local date = vim.fn.strftime '%Y-%m-%d %A'
    vim.api.nvim_buf_set_lines(0, 0, 0, false, {
      '# ' .. date,
      '',
      '## Tasks',
      '- [ ] ',
      '',
      '## Notes',
      '',
      '## Log',
      '',
    })
  end,
})
