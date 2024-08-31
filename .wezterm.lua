-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Snazzy'

-- 背景透過
config.window_background_opacity = 0.9



-- Changing the default program: wsl
---------------------------------------------------------
config.default_prog = {"wsl.exe", "--distribution", "Ubuntu-22.04", "--exec", "/bin/bash", "-l"}

config.default_domain = 'WSL:Ubuntu-22.04'

config.wsl_domains = {
  {
    name = 'WSL:Ubuntu-22.04',
    distribution = 'Ubuntu-22.04',
    default_cwd = '/home/kei',
  }
}

---------------------------------------------------------


font = wezterm.font("0xProto Nerd Font", {weight="Regular", stretch="Normal", style="Normal"})

-- ショートカットキー設定
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|ALT',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
    -- Ctrl+左矢印でカーソルを前の単語に移動
    {
      key = "LeftArrow",
      mods = "CTRL",
      action = act.SendKey {
        key = "b",
        mods = "META",
      },
    },
    -- Ctrl+右矢印でカーソルを次の単語に移動
    {
      key = "RightArrow",
      mods = "CTRL",
      action = act.SendKey {
        key = "f",
        mods = "META",
      },
    },
    -- Ctrl+Backspaceで前の単語を削除
    {
      key = "Backspace",
      mods = "CTRL",
      action = act.SendKey {
        key = "w",
        mods = "CTRL",
      },
    },
    {
      key = "w",
      mods = "CTRL|SHIFT",
      action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- ⌘ Ctrl ,で下方向にペイン分割
  
  {
      key = ",",
      mods = "CTRL",
      action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
  },
  -- ⌘ Ctrl .で右方向にペイン分割
  {
      key = ".",
      mods = "CTRL",
      action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
  },
  -- ⌘ Ctrl oでペインの中身を入れ替える
  {
      key = "o",
      mods = "CTRL",
      action = wezterm.action.RotatePanes 'Clockwise'
  },
  -- ⌘ Ctrl hjklでペインの移動
  {
      key = 'h',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
      key = 'j',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
      key = 'k',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
      key = 'l',
      mods = 'CTRL',
      action = wezterm.action.ActivatePaneDirection 'Right',
  },
  -- ⌘ Ctrl Shift hjklでペイン境界の調整
  {
      key = 'h',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.AdjustPaneSize { 'Left', 2 },
  },
  {
      key = 'j',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.AdjustPaneSize { 'Down', 2 },
  },
  {
      key = 'k',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.AdjustPaneSize { 'Up', 2 },
  },
  {
      key = 'l',
      mods = 'CTRL|SHIFT',
      action = wezterm.action.AdjustPaneSize { 'Right', 2 },
  },

}

-- マウス操作の挙動設定
config.mouse_bindings = {
  -- 右クリックでクリップボードから貼り付け
  {
      event = { Down = { streak = 1, button = 'Right' } },
      mods = 'NONE',
      action = wezterm.action.PasteFrom 'Clipboard',
  },
    
  
}









-- and finally, return the configuration to wezterm
return config