return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp", -- Use this branch for better performance/compatibility
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    "mfussenegger/nvim-dap-python",
  },
  opts = {
    -- Your custom path
    anaconda_base_path = "/home/vegard/.local/share/mamba",
    anaconda_envs_path = "/home/vegard/.local/share/mamba/envs",
    -- Force it to look for these specifically
    name = { "venv", ".venv", "env", ".env" },
    -- Ensure the cached selection stays loaded
    stay_on_export = true,
  },
  keys = {
    -- Force the keybinding in case it was lost
    { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
  },
}
