{-# LANGUAGE NoMonomorphismRestriction, TypeSynonymInstances, MultiParamTypeClasses, FlexibleContexts #-}
module Layout where

import Data.Ratio ((%))
import Control.Monad

import XMonad
import XMonad.Layout.LayoutModifier
import XMonad.Layout.Reflect
import XMonad.Util.WindowProperties
import qualified XMonad.StackSet as S
import XMonad.Layout.NoBorders
import XMonad.Layout.Named
import XMonad.Layout.Magnifier as Mag
import XMonad.Layout.MagicFocus
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace

import XMonad.Hooks.ManageDocks

basicLayout = Tall nmaster delta ratio
  where
    nmaster = 1
    delta   = 5/100
    ratio   = 1/2

tallLayout   = named "tall" $ Mag.magnifierOff $ basicLayout
wideLayout   = named "wide" $ Mag.magnifierOff $ Mirror basicLayout
fullLayout   = named "full" $ Mag.magnifierOff $ Full

gimpLayout = named "gimp"
  $ withIM (1%6) (Role "gimp-toolbox")
  $ reflectHoriz
  $ withIM (1%6) (Role "gimp-dock") Full

imLayout = named "im" $ Tall nmaster delta ratio
  where
    nmaster = 0
    delta   = 5/100
    ratio   = 1/2

customLayoutHook = smartBorders
                 $ avoidStruts
                 $ onWorkspace "0" gimpLayout
                 $ onWorkspace "2" (imLayout ||| fullLayout)
                 $ wideLayout ||| fullLayout
