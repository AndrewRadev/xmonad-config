module Main where

import XMonad

import XMonad.Util.Run      (spawnPipe)
import XMonad.Util.EZConfig (additionalKeysP, checkKeymap)
import XMonad.Hooks.FadeInactive (fadeInactiveLogHook)

import Keys    (customKeys, customKeyList)
import Log     (customLogHook)
import Manage  (customManageHook)
import Layout  (customLayoutHook)
import Startup (customStartupHook)

main = do
  logger <- spawnPipe "xmobar"
  xmonad (customConfig logger)

customConfig logger = defaultConfig
  { borderWidth        = 3
  , terminal           = "urxvt"
  , normalBorderColor  = "#cccccc"
  , focusedBorderColor = "#111199"
  , focusFollowsMouse  = False
  , workspaces         =
    [ "1:main"
    , "2:skype"
    , "3:music"
    , "4:htop"
    , "5"
    , "6"
    , "7"
    , "8:gimp"
    , "9"
    , "0"
    , "-"
    ]
  , keys               = customKeys
  -- Custom hooks:
  , startupHook        = do
      customStartupHook
      checkKeymap (customConfig logger) (customKeyList (customConfig logger))
--  , logHook            = fadeInactiveLogHook 0.8 >> customLogHook logger
  , logHook            = customLogHook logger
  , manageHook         = customManageHook
  , layoutHook         = customLayoutHook
  -- Custom keys:
  }
