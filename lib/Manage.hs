module Manage where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import qualified XMonad.StackSet as W

customManageHook = manageDocks
  <+> composeAll
    [ className =? "Skype"  --> doF (W.shift "2")
    , className =? "Gimp"   --> doF (W.shift "0")
    , className =? "Gimp"   --> unfloat
    , className =? "Zenity" --> doFloat
    -- fix flash fullscreen
    , isFullscreen --> (doF W.focusDown <+> doFullFloat <+> doF W.focusUp)
    ]
  <+> manageHook defaultConfig
  where
    unfloat = ask >>= doF . W.sink
