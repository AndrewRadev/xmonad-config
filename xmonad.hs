module Main where

import XMonad

import XMonad.Util.Run      (spawnPipe)
import XMonad.Util.EZConfig (checkKeymap)

import XMonad.Hooks.DynamicHooks (dynamicMasterHook)

import Keys    (customKeys, customKeyList)
import Log     (customLogHook)
import Manage  (customManageHook)
import Layout  (customLayoutHook)
import Startup (customStartupHook)

main = do
  loggerTop    <- spawnPipe "xmobar ~/.xmonad/xmobarrc-top"
  loggerBottom <- spawnPipe "xmobar ~/.xmonad/xmobarrc-bottom"
  xmonad (customConfig loggerTop)

customConfig logger = defaultConfig
  { borderWidth        = 3
  , terminal           = "urxvt"
  , normalBorderColor  = "#cccccc"
--  , normalBorderColor  = "#000000"
  , focusedBorderColor = "#ee1111"
  , focusFollowsMouse  = False
  , workspaces         =
    [ "1"
    , "2"
    , "3"
    , "4"
    , "5"
    , "6"
    , "7"
    , "8"
    , "9"
    , "0"
    ]
  , keys               = customKeys
  , startupHook        = do
      customStartupHook
      checkKeymap (customConfig logger) (customKeyList (customConfig logger))
  , logHook            = customLogHook logger
  , manageHook         = customManageHook <+> dynamicMasterHook
  , layoutHook         = customLayoutHook
  }
