local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>e', vim.cmd.Explore, {})
vim.keymap.set('n', '<leader>r', vim.cmd.nohl, {})
vim.keymap.set('n', '<leader>f', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>g', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>h', telescope_builtin.help_tags, {})
