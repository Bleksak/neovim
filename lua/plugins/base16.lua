return {
    "echasnovski/mini.base16",
    priority = 1000,
    lazy = false,
    opts = {
        use_cterm = true,
        palette = {
            base00 = '#000000',
            base01 = '#000000',
            base02 = '#000000',
            base03 = '#000000',
            base04 = '#000000',
            base05 = '#000000',
            base06 = '#000000',
            base07 = '#000000',
            base08 = '#000000',
            base09 = '#000000',
            base0A = '#000000',
            base0B = '#000000',
            base0C = '#000000',
            base0D = '#000000',
            base0E = '#000000',
            base0F = '#000000',
        },
    },
    config = function(_, opts)
        require("mini.base16").setup(opts)

        vim.cmd("colorscheme minischeme")
    end,
}
