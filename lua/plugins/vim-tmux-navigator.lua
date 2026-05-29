-- ~/.config/nvim/lua/plugins/vim-tmux-navigator.lua
return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Tmux/win left" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Tmux/win down" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Tmux/win up" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Tmux/win right" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Tmux/win previous" },
    },
  },
}
