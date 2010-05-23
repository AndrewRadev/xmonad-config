module Manage where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import qualified XMonad.StackSet as W

customManageHook = manageDocks
  <+> composeAll
    [ className =? "Skype"      --> doF (W.shift "2")
    , className =? "Mail"       --> doF (W.shift "8")
    , className =? "VirtualBox" --> doF (W.shift "9")
    , className =? "Gimp"       --> doF (W.shift "0")
    , className =? "Gimp"       --> unfloat
    -- fix flash fullscreen
    , isFullscreen --> (doF W.focusDown <+> doFullFloat)
    ]
  <+> manageHook defaultConfig
  where
    unfloat = ask >>= doF . W.sink
