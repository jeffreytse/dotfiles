local wezterm = require "wezterm"
-- local home = os.getenv("USERPROFILE")
-- local git_bash_args = {"C:\\Program Files\\Git\\usr\\bin\\bash.exe", "-i", "-l"}
-- local msys2_args = {
--     home .. "\\msys64\\usr\\bin\\env.exe",
--     "MSYS=enable_pcon", -- Enable pseudo console API for msys (maybe not needed under wezterm?) Actually, needed - without it, Ctrl-D does not close the terminal!
--     "MSYSTEM=MSYS",
--     "/usr/bin/bash", "--login",
-- }

return {
  -- option = value, [default] comment

  -- General
   --  default_prog = git_bash_args,
   --  launch_menu = {
   --      {
   --          label = "CMD",
   --          args = {"cmd.exe"},
   --      },
   --      {
   --          label = "Git Bash",
   --          args = git_bash_args,
   --      },
   --      {
   --          label = "MSYS2",
   --          args = msys2_args,
   --      }
   -- },

   -- Keys
   keys = {
    -- This will create a new split and run your default program inside it
    {key="w", mods="CTRL|SHIFT|ALT",
      action=wezterm.action{CloseCurrentPane={confirm=true}}},
    {key="%", mods="CTRL|SHIFT|ALT",
      action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
      -- This will create a new split and run your default program inside it
    {key="\"", mods="CTRL|SHIFT|ALT",
      action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    { key = "h", mods="CTRL|SHIFT|ALT",
      action=wezterm.action{ActivatePaneDirection="Left"}},
    { key = "l", mods="CTRL|SHIFT|ALT",
      action=wezterm.action{ActivatePaneDirection="Right"}},
    { key = "k", mods="CTRL|SHIFT|ALT",
      action=wezterm.action{ActivatePaneDirection="Up"}},
    { key = "j", mods="CTRL|SHIFT|ALT",
      action=wezterm.action{ActivatePaneDirection="Down"}},
    {key="F9", mods="ALT", action="ShowTabNavigator"},
    {key="F11", mods="ALT", action="ToggleFullScreen"},
  },

  -- Fonts
  -- font       = wezterm.font("JetBrains Mono")                             , -- [JetBrains Mono]
  -- font       = wezterm.font("JetBrains Mono", {weight="Bold",italic=true}), -- [JetBrains Mono] Name with parameters
  font_size  = 12.0                                                       , -- [12.0]

  -- Appearance
  -- window_background_opacity    = 0.9  , -- [1.0] alpha channel value with floating point numbers in the range 0.0 (meaning completely translucent/transparent) through to 1.0 (meaning completely opaque)
  enable_tab_bar                = false, -- [true]
  hide_tab_bar_if_only_one_tab  = false, -- [false] hide the tab bar when there is only a single tab in the window
}
