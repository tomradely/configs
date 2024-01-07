local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-f>', builtin.find_files , {})
vim.keymap.set('n', '<C-t>', ':Neotree toggle<CR>' , {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
