return {
  {
    "sphamba/smear-cursor.nvim",
    opts = {
      -- The color of the smear trail (Gruvbox Yellow)
      cursor_color = "#fabd2f",
      -- Background color to blend into (Gruvbox Dark Hard background)
      -- This ensures the "tail" fades out cleanly
      bg_color = "#1d2021",
      -- Adjust these for the "vibe" you want:
      stiffness = 0.6, -- Lower = more "rubbery" feel
      trailing_stiffness = 0.3, -- How fast the tail catches up
      distance_stop_animating = 0.1,
      -- If you want the trail to be even more subtle,
      -- you can use the Gruvbox Gray: "#928374"
    },
  },
}
