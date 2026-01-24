-- ~/.config/nvim/lua/plugins/notebook.lua
return {
  -- 1. LUAROCKS (Required to install the magick bindings)
  {
    "vhyrro/luarocks.nvim",
    priority = 1001,
    opts = {
      rocks = { "magick" },
    },
  },

  -- 2. IMAGE.NVIM (Renders plots in Ghostty)
  {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      -- Headless nvim has no UI; image.nvim crashes when it queries terminal size.
      if #vim.api.nvim_list_uis() == 0 then
        return
      end

      require("image").setup({
        backend = "kitty",
        kitty_method = "normal",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = false,
            download_remote_images = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown", "vimwiki", "quarto" },
          },
        },
        max_width = 100,
        max_height = 12,
        max_width_window_percentage = math.huge,
        max_height_window_percentage = 50,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "notify" },
      })
    end,
  },

  -- 3. JUPYTEXT (Edit .ipynb as markdown)
  {
    "GCBallesteros/jupytext.nvim",
    lazy = false,
    init = function()
      -- Ensure Neovim can find the `jupytext` CLI (micromamba env bin dir).
      local py = vim.g.python3_host_prog
      if not py or py == "" then
        py = vim.fn.exepath("python3")
      end
      if py and py ~= "" then
        local bin = vim.fn.fnamemodify(py, ":h")
        local path = vim.env.PATH or ""
        if bin ~= "" and not string.find(path, bin, 1, true) then
          vim.env.PATH = bin .. ":" .. path
        end
      end
    end,
    config = true,
    opts = {
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    },
  },

  -- 4. MOLTEN (The Jupyter Client)
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    lazy = false,
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = true
      vim.g.molten_wrap_output = true
      vim.g.molten_virt_text_output = false
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    keys = {
      { "<leader>mi", ":MoltenInit<CR>", desc = "Initialize Molten" },
      { "<leader>ml", ":MoltenEvaluateLine<CR>", desc = "Evaluate Line" },
      { "<leader>mr", ":MoltenReevaluateCell<CR>", desc = "Re-evaluate Cell" },
      { "<leader>md", ":MoltenDelete<CR>", desc = "Delete Cell" },
      { "<leader>mo", ":MoltenShowOutput<CR>", desc = "Show Output" },
      { "<leader>mh", ":MoltenHideOutput<CR>", desc = "Hide Output" },
      { "<leader>me", ":MoltenEvaluateOperator<CR>", desc = "Evaluate Operator" },
      { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Evaluate Visual" },
    },
  },
}
