module Main where

import XMonad

import XMonad.Util.Run      (spawnPipe)
import XMonad.Util.EZConfig (additionalKeysP)

import Keys   (customKeymap)
import Log    (customLogHook)
import Manage (customManageHook)
import Layout (customLayoutHook)

main = do
  logger <- spawnPipe "xmobar"
  xmonad (customConfig logger)

customConfig logger = defaultConfig
  { borderWidth        = 3
  , terminal           = "urxvtc"
  , normalBorderColor  = "#cccccc"
  , focusedBorderColor = "#111199"
  , focusFollowsMouse  = False
  , workspaces         = ["1:main", "2:skype", "3:music", "4:htop"] ++ map show [5..9]
  -- Custom hooks:
  , logHook            = customLogHook logger
  , manageHook         = customManageHook
  , layoutHook         = customLayoutHook
  -- Custom keys:
  } `additionalKeysP` customKeymap
