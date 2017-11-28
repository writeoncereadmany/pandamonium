module Shape where

infixl 2 !!!

data Point = Point { x :: Float, y :: Float } deriving (Show, Eq)

data Shape = Rectangle { left :: Float, right :: Float, top :: Float, bottom :: Float }
           | Circle { centre :: Point, radius :: Float } deriving (Show, Eq)

(!!!) :: Shape -> Shape -> Bool
a@Rectangle {} !!! b@Rectangle {} = not (top a < bottom b || top b < bottom a)
