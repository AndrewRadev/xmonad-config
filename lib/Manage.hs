module Manage where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import qualified XMonad.StackSet as W

customManageHook = manageDocks
  <+> composeAll
    [ className =? "Gimp"                            --> doFloat
    , className =? "Skype"                           --> doF (W.shift "2:skype")
    , className =? "Sonata"                          --> doF (W.shift "3:music")
    , className =? "URxvt" <&&> appName =? "ncmpcpp" --> doF (W.shift "3:music")
    , className =? "URxvt" <&&> appName =? "htop"    --> doF (W.shift "4:htop")
    -- fix flash fullscreen
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)
    ]
  <+> manageHook defaultConfig
