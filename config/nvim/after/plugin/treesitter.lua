require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c", "lua", "rust", "javascript", "typescript", "bash", "make", "cmake", "vue",
        "ninja", "nix", "cpp", "html", "css", "diff", "dockerfile", "erlang", "gitignore",
        "go", "gomod", "gowork", "haskell", "julia", "toml", "json", "json5", "latex",
        "julia", "markdown", "perl", "php", "proto", "sql", "vala", "verilog",
    },

    sync_install = false,
    auto_instal = false,
    ignore_install = {"java", "fish"},

    highlight = {
        enable = true,
        disable = {},
        disable = function(lang, buf)
            local max_filesize = 500 * 1024
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }
}
