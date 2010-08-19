module Manage where

import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import qualified XMonad.StackSet as W

customManageHook = manageDocks
  <+> composeAll
    [ className =? "Skype"  --> doF (W.shift "2")
    , className =? "Pidgin" --> doF (W.shift "2")
    , className =? "Gimp"   --> doF (W.shift "0")
    , className =? "Zenity" --> doFloat
    -- fix flash fullscreen
    , isFullscreen --> (doF W.focusDown <+> doFullFloat <+> doF W.focusUp)
    ]
  <+> manageHook defaultConfig
