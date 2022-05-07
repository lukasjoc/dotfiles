import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP


-- a custom 3 col layout
layout = tiled ||| Mirror tiled ||| Full ||| threeCol
    where
        -- threeCol = magnifiercz' 1.3 $ ThreeColMid nmaster delta ratio
        threeCol = ThreeColMid nmaster delta ratio
        tiled = Tall nmaster delta ratio
        -- number of windows
        nmaster = 1
        -- master pane proportion
        ratio = 1/2
        -- resize increment percentage
        delta = 3/100

extendedConfig = def {
        -- map to super key
        modMask = mod4Mask,
        layoutHook = layout
    }
    -- KeyMaps
    `additionalKeysP` [("M-f"  , spawn "firefox")]

main :: IO ()
main = xmonad
    $ xmobarProp
    $ extendedConfig

