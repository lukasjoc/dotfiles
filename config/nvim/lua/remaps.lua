local nnoremap = require("keymaps").nnoremap

nnoremap("<leader>e", "<cmd>Ex<CR>")
nnoremap("<leader>r", "<cmd>nohl<CR>")
nnoremap("<leader>f", "<cmd>Telescope find_files<CR>")
nnoremap("<leader>fo", "<cmd>Telescope oldfiles<CR>")
nnoremap("<leader>s", "<cmd>Telescope live_grep<CR>")
nnoremap("<leader>w", "<cmd>Telescope buffers<CR>")
nnoremap("<leader>h", "<cmd>Telescope help_tags<CR>")

