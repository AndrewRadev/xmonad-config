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
--import XMonad.Layout.Circle
import XMonad.Layout.MagicFocus
--import XMonad.Layout.Tabbed
import XMonad.Layout.IM
import XMonad.Layout.PerWorkspace

import XMonad.Hooks.ManageDocks

basicLayout = Tall nmaster delta ratio
  where
    nmaster = 1
    delta   = 3/100
    ratio   = 1/2

tallLayout   = named "tall"  $ basicLayout
wideLayout   = named "wide"  $ Mirror basicLayout
fullLayout   = named "full"  $ Full

skypeLayout  = named "skype"
  $ withIM (1%6) skypeRoster
  $ reflectHoriz Accordion
  where
    skypeRoster = (ClassName "Skype")
            `And` (Not (Title "Options"))
            `And` (Not (Role "Chats"))
            `And` (Not (Role "CallWindowForm"))

--circleLayout = named "circle" $ magicFocus Circle
--tabbedLayout = named "tabbed" $ (tabbed shrinkText defaultTheme)

gimpLayout = named "Gimp"
  $ withIM (1%6) (Role "gimp-toolbox")
  $ reflectHoriz
  $ withIM (1%6) (Role "gimp-dock") Full

-- @TODO: skype layout

customLayoutHook = smartBorders
                 $ avoidStruts
                 $ onWorkspace "5:gimp" gimpLayout
                 $ onWorkspace "2:skype" wideLayout
                 $ wideLayout ||| fullLayout
