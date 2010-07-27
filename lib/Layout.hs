{-# LANGUAGE NoMonomorphismRestriction #-}
module Layout where

import Data.Ratio ((%))

import XMonad
import qualified XMonad.StackSet as S

import XMonad.Layout.LayoutModifier
import XMonad.Layout.Reflect
import XMonad.Layout.NoBorders
import XMonad.Layout.Named
import XMonad.Layout.Magnifier as Mag
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Tabbed
import XMonad.Layout.SimpleFloat
import XMonad.Layout.BorderResize

import XMonad.Hooks.ManageDocks

import XMonad.Util.WindowProperties
import XMonad.Util.Themes

basicLayout = addTabs shrinkText tabTheme $ Tall nmaster delta ratio
  where
    nmaster = 1
    delta   = 5/100
    ratio   = 1/2

tallLayout = named "tall" $ Mag.magnifierOff $ basicLayout
wideLayout = named "wide" $ Mag.magnifierOff $ Mirror basicLayout
fullLayout = named "full" $ Mag.magnifierOff $ tabbed shrinkText tabTheme

tabTheme = (theme deiflTheme)
  { fontName   = "-xos4-terminus-*-*-*-*-14-*-*-*-*-*-*-*"
  , decoHeight = 18
  }

gimpLayout = named "gimp" $ borderResize $ simpleFloat' shrinkText tabTheme
--  $ withIM (1%6) (Role "gimp-toolbox")
--  $ reflectHoriz
--  $ withIM (1%6) (Role "gimp-dock") Full

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
