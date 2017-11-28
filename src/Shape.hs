module Shape where

data Point = Point { x :: Float, y :: Float } deriving (Show, Eq)

data Shape = Rectangle { left :: Float, right :: Float, top :: Float, bottom :: Float }
           | Circle { centre :: Point, radius :: Float } deriving (Show, Eq)
