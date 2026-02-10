-- lua/plugins/treesitter-extra.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "markdown",
        "markdown_inline",
        "latex",
        "python",
        "yaml",
        "html",
      },
    },
  },
}
