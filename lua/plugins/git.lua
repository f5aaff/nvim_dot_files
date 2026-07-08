return {

    {
        "tpope/vim-fugitive",
        lazy = false,
        cmd = { "Git", "G" },
    },

    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        config = true,
    },

}
