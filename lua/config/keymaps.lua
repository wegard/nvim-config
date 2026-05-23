-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap H and L to start/end of line, matching shell vi mode
-- Original H = top-of-screen, L = bottom-of-screen (you lose these)
vim.keymap.set({ "n", "x", "o" }, "H", "^", { desc = "Go to first non-blank char" })
vim.keymap.set({ "n", "x", "o" }, "L", "$", { desc = "Go to end of line" })
