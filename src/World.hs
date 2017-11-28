module World where

import Entity

data World = World { scenery :: [Entity], entities :: [Entity] } deriving (Show, Eq)
