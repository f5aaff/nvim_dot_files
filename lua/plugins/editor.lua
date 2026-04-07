return {

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
  },

  {
    "laytan/cloak.nvim",
    config = function()
      require("cloak").setup({
        enabled = true,
        cloak_character = "*",
        highlight_group = "Comment",
        patterns = {
          {
            file_pattern = { ".env*", "wrangler.toml", ".dev.vars" },
            cloak_pattern = "=.+",
          },
        },
      })
    end,
  },

}
