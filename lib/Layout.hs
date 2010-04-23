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
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Grid
import XMonad.Layout.Accordion
import XMonad.Layout.Magnifier as Mag
import XMonad.Layout.MagicFocus
import XMonad.Layout.Roledex
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace

import XMonad.Hooks.ManageDocks

basicLayout = Tall nmaster delta ratio
  where
    nmaster = 1
    delta   = 3/100
    ratio   = 1/2

tallLayout   = named "tall" $ Mag.magnifierOff $ basicLayout
wideLayout   = named "wide" $ Mag.magnifierOff $ Mirror basicLayout
fullLayout   = named "full" $ Mag.magnifierOff $ Full

gimpLayout = named "gimp"
  $ withIM (1%6) (Role "gimp-toolbox")
  $ reflectHoriz
  $ withIM (1%6) (Role "gimp-dock") Full

skypeLayout = named "skype"
  $ Mag.magnifierOff
  $ withIM (1%4) contactList
  $ Tall 0 (3/100) (1/2)
  where
    contactList = (ClassName "Skype"
      `And` (Not (Title "Options"))
      `And` (Not (Role "Chats"))
      `And` (Not (Role "CallWindowForm")))

customLayoutHook = smartBorders
                 $ avoidStruts
                 $ onWorkspace "8:gimp" gimpLayout
                 $ onWorkspace "2:skype" (skypeLayout ||| fullLayout)
                 $ wideLayout ||| fullLayout
