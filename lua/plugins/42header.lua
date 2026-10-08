return {
    {
        "Diogo-ss/42-header.nvim",
        cmd = { "Stdheader" },
        keys = { "<F1>" },
        init = function()
            vim.g.user = "maxpignon"
            vim.g.mail = "maxpignon@student.42angouleme.fr"
        end,
        opts = {
            default_map = true,
            auto_update = true,
        },
        config = function(_, opts)
            require("42header").setup(opts)
        end,
    }
}
