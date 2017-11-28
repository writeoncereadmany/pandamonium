module Entity where

import Graphics.Gloss

data Entity = Entity { x :: Float, y :: Float, sprite :: Picture } deriving (Show, Eq)
