module Manage where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import qualified XMonad.StackSet as W

customManageHook = manageDocks
  <+> composeAll
    [ className =? "Skype"                           --> doF (W.shift "2:skype")
    , className =? "Sonata"                          --> doF (W.shift "3:music")
    , className =? "URxvt" <&&> appName =? "ncmpcpp" --> doF (W.shift "3:music")
    , className =? "URxvt" <&&> appName =? "htop"    --> doF (W.shift "4:htop")
    , className =? "Gimp"                            --> doF (W.shift "5:gimp")
    , className =? "Gimp"                            --> unfloat
    -- fix flash fullscreen
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)
    -- Keep Skype contact list master at all times
    , className =? "Skype" --> doF W.swapDown
    ]
  <+> manageHook defaultConfig
  where
    unfloat = ask >>= doF . W.sink
