-- [[ Diagnostic Keymaps ]]
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })

-- [[ Leader Keymaps ]]
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q!<CR>', { desc = 'Quit without saving' })
vim.keymap.set('n', '<leader>x', ':x!<CR>', { desc = 'Save and quit' })
vim.keymap.set('n', '<leader>u', ':e!<CR>', { desc = 'Reload file' })
vim.keymap.set('n', '<leader>o', ':only!<CR>', { desc = 'Close other windows' })
-- Splits
vim.keymap.set('n', '<leader>v', ':vsplit<CR>', { desc = 'Vertical Split' })
vim.keymap.set('n', '<leader>S', ':split<CR>', { desc = 'Horizontal Split' })

-- [[ Movement Keymaps ]]
vim.keymap.set('n', 'H', '^', { desc = 'Go to line start' })
vim.keymap.set('n', 'L', '$', { desc = 'Go to line end' })
vim.keymap.set('n', 'K', ':move .-2<CR>==', { desc = 'Go to line start' })
vim.keymap.set('n', 'J', ':move .+1<CR>==', { desc = 'Go to line end' })
-- Visual
vim.keymap.set('v', 'H', '^', { desc = 'Go to line start' })
vim.keymap.set('v', 'L', '$', { desc = 'Go to line end' })
vim.keymap.set('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Go to line start' })
vim.keymap.set('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'Go to line end' })

-- [[ Search ]]
vim.keymap.set('n', '//', 'viwy/<C-r>"')
vim.keymap.set('v', '//', 'y/<C-r>"')

-- [[ Indentation ]]
vim.keymap.set('n', '>', '>>', { desc = 'Indent right' })
vim.keymap.set('n', '<', '<<', { desc = 'Indent left' })
-- Visual
vim.keymap.set('v', '>', '>gv', { desc = 'Indent right' })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent left' })

-- [[ Pane Navigation ]]
vim.keymap.set('n', '<C-Up>', '<C-w>+', { desc = 'Increase pane height' })
vim.keymap.set('n', '<C-Down>', '<C-w>-', { desc = 'Decrease pane height' })
vim.keymap.set('n', '<C-Right>', '<C-w><', { desc = 'Decrease pane width' })
vim.keymap.set('n', '<C-Left>', '<C-w>>', { desc = 'Increase pane width' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Better search ]]
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Next search result' })

-- [[ Newline Keymaps ]]
vim.keymap.set('n', '<Enter>', 'o<Esc>', { desc = 'Newline Below' })
vim.keymap.set('n', '<leader><Enter>', 'O<Esc>', { desc = 'Newline Above' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
