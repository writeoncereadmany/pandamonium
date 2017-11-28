module Main(
  main
) where

import Graphics.Gloss
import Codec.BMP

window :: Display
window = InWindow "A window!" (200, 200) (300, 300)

background :: Color
background = white

main :: IO ()
main = do picture <- loadBMP "resources/sprites/ugliness.bmp"
          display window background picture
