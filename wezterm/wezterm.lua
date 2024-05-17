local wezterm = require 'wezterm'

-- Common section
local home_path <const> = os.getenv('userprofile')
local local_app_data_path <const> = os.getenv('localappdata')
local program_files_path <const> = os.getenv('programfiles')

local function is_linux()
  return wezterm.target_triple:find('linux') ~= nil
end

local function is_darwin()
  return wezterm.target_triple:find('darwin') ~= nil
end

local function is_windows()
  return wezterm.target_triple:find('windows') ~= nil
end

local function file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- Check if folder exists --
local function folder_exists(name)
  local fileHandle, strError = io.open(name .. "\\*.*", "r")
  if fileHandle ~= nil then
    io.close(fileHandle)
    return true
  else
    if string.match(strError, "No such file or directory") then
      return false
    else
      return true
    end
  end
end

local function has_wsl(name)
  if not is_windows() then return false end
  name = name:lower():gsub("^%l", string.upper)
  if name == 'Ubuntu' then
    name = name .. '_79rhkp1fndgsc'
  end
  return folder_exists(
    local_app_data_path .. '/Packages/CanonicalGroupLimited.' .. name)
end

-- This table will hold the configuration
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- option = value, [default] comment

-- General settings

if is_windows() then
  local launch_menu = {
    {
      label = 'PowerShell',
      args = { 'powershell.exe', '-NoLogo' },
    },
    {
      label = 'CMD',
      args = { 'cmd.exe' },
    }
  }

  -- MSYS2
  local msys2_args = {
    home_path .. '/msys64/usr/bin/env.exe',
    -- enable pseudo console api for msys (maybe not needed under wezterm?)
    -- actually, needed - without it, ctrl-d does not close the terminal!
    'msys=enable_pcon',
    'msystem=msys',
    '/usr/bin/bash', '--login',
  }
  if file_exists(msys2_args[1]) then
    table.insert(launch_menu, {
      label = 'MSYS2',
      args = msys2_args,
    })
    config.default_prog = msys2_args
  end

  -- Git Bash
  local git_bash_args = {
    program_files_path .. '/Git/usr/bin/bash.exe',
    '-i',
    '-l'
  }
  if file_exists(git_bash_args[1]) then
    table.insert(launch_menu, {
      label = 'Git Bash',
      args = git_bash_args,
    })
    config.default_prog = git_bash_args
  end

  config.launch_menu = launch_menu

  -- WSL
  if has_wsl('ubuntu') then
    config.wsl_domains = {
      {
        -- The name of this specific domain.  Must be unique amonst all types
        -- of domain in the configuration file.
        name = 'WSL:Ubuntu',

        -- The name of the distribution.  This identifies the WSL distribution.
        -- It must match a valid distribution from your `wsl -l -v` output in
        -- order for the domain to be useful.
        distribution = 'Ubuntu',
      },
    }

    -- Sets WSL2 UBUNTU-22.04 as the defualt when opening Wezterm
    config.default_domain = 'WSL:Ubuntu'
  end
end

-- Keys settings
config.keys = {
  -- This will create a new split and run your default program inside it
  {
    key = 'w',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action { CloseCurrentPane = { confirm = true } }
  },
  {
    key = '%',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action { SplitHorizontal = { domain = 'CurrentPaneDomain' } }
  },
  -- This will create a new split and run your default program inside it
  {
    key = '"',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action { SplitVertical = { domain = 'CurrentPaneDomain' } }
  },
  {
    key = 'h',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action { ActivatePaneDirection = 'Left' }
  },
  {
    key = 'l',
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action { ActivatePaneDirection = 'Right' }
  },
  {
    key = 'k',
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action { ActivatePaneDirection = 'Up' }
  },
  {
    key = 'j',
    mods = 'CTRL|SHIFT|ALT',
    action = wezterm.action { ActivatePaneDirection = 'Down' }
  },
  {
    key = 'F11',
    mods = 'ALT',
    action = 'ToggleFullScreen'
  },
}

-- Font settings
-- Needs to install nerd fonts later
config.font = wezterm.font('Hack Nerd Font')
config.font_size = 12.0 -- [12.0]

-- Appearance settings
-- config.window_background_opacity    = 0.9 -- [1.0] alpha channel value with floating point numbers in the range 0.0 (meaning completely translucent/transparent) through to 1.0 (meaning completely opaque)
-- config.enable_tab_bar = false -- [true]
config.hide_tab_bar_if_only_one_tab = true -- [false] hide the tab bar when there is only a single tab in the window

-- Return the configuration to wezterm
return config
