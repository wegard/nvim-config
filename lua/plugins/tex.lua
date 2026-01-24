return {
  {
    "lervag/vimtex",
    opts = function(_, opts)
      -- 1. Configure Tectonic as the compiler (Works on both Mac & Linux)
      vim.g.vimtex_compiler_method = "tectonic"

      -- 2. Detect OS and choose the correct viewer
      if jit.os == "OSX" then
        -- Mac: Use Skim
        vim.g.vimtex_view_method = "skim"
      elseif jit.os == "Linux" then
        -- Linux: Use Zathura
        vim.g.vimtex_view_method = "zathura"
      else
        -- Fallback for other systems (Windows, etc.)
        vim.g.vimtex_view_method = "general"
      end
    end,
  },
}
