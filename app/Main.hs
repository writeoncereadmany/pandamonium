module Main(
  main
) where

import Graphics.Gloss
import Graphics.Gloss.Interface.IO.Game
import Codec.BMP

type World = (Float, Float, Float, Float)

window :: Display
window = InWindow "A window!" (200, 200) (300, 300)

background :: Color
background = black

accel :: Float
accel = 5

fps :: Int
fps = 60

initialWorld :: World
initialWorld = (0, 0, 0, 0)

render :: Picture -> World -> Picture
render sprite (x, y, _, _) = translate x y sprite

onEvent :: Event -> World -> World
onEvent (EventKey key Down _ _) (x, y, dx, dy) = case key of
  (Char 'a') -> (x, y, dx - accel, dy)
  (Char 's') -> (x, y, dx + accel, dy)
  _ -> (x, y, dx, dy)
onEvent _ world = world

onTime :: Float -> World -> World
onTime t (x, y, dx, dy) = (x + (dx * t), y + (dy * t), dx, dy)

main :: IO ()
main = do sprite <- loadBMP "resources/sprites/ugliness.bmp"
          play window background fps initialWorld (render sprite) onEvent onTime
