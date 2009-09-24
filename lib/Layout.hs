module Layout where

import XMonad
import XMonad.Layout.NoBorders
import XMonad.Layout.Named

import XMonad.Hooks.ManageDocks

basicLayout = Tall nmaster delta ratio
  where
    nmaster = 1
    delta   = 3/100
    ratio   = 1/2
tallLayout = named "tall" $ basicLayout
wideLayout = named "wide" $ Mirror basicLayout
fullLayout = named "full" $ Full

customLayoutHook = smartBorders 
                 $ avoidStruts
                 $ wideLayout ||| tallLayout ||| fullLayout
