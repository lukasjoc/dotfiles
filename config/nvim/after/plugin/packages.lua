vim.opt.colorcolumn = "92"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g.gruvbox_flat_style = "hard"
vim.g.gruvbox_colors = { comment = "orange" }

-- hello world this is a cool cool world
vim.cmd("colorscheme gruvbox-flat")

local telescope = require("telescope")
telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        }
    }
})
telescope.load_extension("fzf")

local comp = require("cmp")
comp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },

    mapping = comp.mapping.preset.insert({
        ['<C-j>'] = comp.mapping.scroll_docs(-4),
        ['<C-k>'] = comp.mapping.scroll_docs(4),
        ['<C-c>'] = comp.mapping.abort(),
        ['<leader>m'] = comp.mapping.confirm({
            behavior = comp.ConfirmBehavior.Insert,
            select = true
        }),
    }),

    sources = {
        { name = "nvim_lsp", keyword_length = 7 },
        { name = "path", keyword_length = 3 },
        { name = "buffer", keyword_length = 7 },
    }
})


