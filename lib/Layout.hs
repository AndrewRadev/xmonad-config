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

--tallLayout   = named "tall"   $ basicLayout
wideLayout   = named "wide"  $ Mirror basicLayout
fullLayout   = named "full"  $ Full
skypeLayout  = named "skype" $ reflectHoriz $ withIMs (1%6) [skypeRoster] wideLayout
  where
    skypeRoster = (ClassName "Skype")
            `And` (Not (Title "Options"))
            `And` (Not (Role "Chats"))
            `And` (Not (Role "CallWindowForm"))

--circleLayout = named "circle" $ magicFocus Circle
--tabbedLayout = named "tabbed" $ (tabbed shrinkText defaultTheme)

customLayoutHook = smartBorders
                 $ avoidStruts
                 $ onWorkspace "2:skype" wideLayout wideLayout ||| fullLayout


-- modified version of XMonad.Layout.IM --
-- from Thomas Ten Kate's config        --

-- | Data type for LayoutModifier which converts given layout to IM-layout
-- (with dedicated space for the roster and original layout for chat windows)
data AddRosters a = AddRosters Rational [Property] deriving (Read, Show)

instance LayoutModifier AddRosters Window where
  modifyLayout (AddRosters ratio props) = applyIMs ratio props
  modifierDescription _                = "IMs"

-- | Modifier which converts given layout to IMs-layout (with dedicated
-- space for rosters and original layout for chat windows)
withIMs :: LayoutClass l a => Rational -> [Property] -> l a -> ModifiedLayout AddRosters l a
withIMs ratio props = ModifiedLayout $ AddRosters ratio props

-- | IM layout modifier applied to the Grid layout
gridIMs :: Rational -> [Property] -> ModifiedLayout AddRosters Grid a
gridIMs ratio props = withIMs ratio props Grid

hasAnyProperty :: [Property] -> Window -> X Bool
hasAnyProperty [] _ = return False
hasAnyProperty (p:ps) w = do
    b <- hasProperty p w
    if b then return True else hasAnyProperty ps w

-- | Internal function for placing the rosters specified by
-- the properties and running original layout for all chat windows
applyIMs :: (LayoutClass l Window) =>
               Rational
            -> [Property]
            -> S.Workspace WorkspaceId (l Window) Window
            -> Rectangle
            -> X ([(Window, Rectangle)], Maybe (l Window))
applyIMs ratio props wksp rect = do
    let stack = S.stack wksp
    let ws = S.integrate' $ stack
    rosters <- filterM (hasAnyProperty props) ws
    let n = fromIntegral $ length rosters
    let (rostersRect, chatsRect) = splitHorizontallyBy (n * ratio) rect
    let rosterRects = splitHorizontally n rostersRect
    let filteredStack = stack >>= S.filter (`notElem` rosters)
    wrs <- runLayout (wksp {S.stack = filteredStack}) chatsRect
    return ((zip rosters rosterRects) ++ fst wrs, snd wrs)
