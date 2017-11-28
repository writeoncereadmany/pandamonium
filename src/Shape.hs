module Shape where

import Vector

data Shape = Rectangle { left :: Float, right :: Float, top :: Float, bottom :: Float }

-- checks if two shapes collide, returning a boolean
infixl 2 !!!
(!!!) :: Shape -> Shape -> Bool
a@Rectangle {} !!! b@Rectangle {} = not (top a < bottom b || top b < bottom a || left a > right b || left b > right a)

-- returns a Maybe of the vector needed to push the second argument so it doesn't overlap the first
infixl 2 !!>
(!!>) :: Shape -> Shape -> Maybe Vector
a@Rectangle {} !!> b@Rectangle {} = foldl1 smallest [ push_required move_up (top a - bottom b),
                                                      push_required move_down (top b - bottom a),
                                                      push_required move_left (right b - left a),
                                                      push_required move_right (right a - left b) ] where
                                           push_required f v = if v <= 0 then Nothing else Just $ f v
                                           smaller a b = if a |>| b then b else a
                                           smallest a b = pure smaller <*> a <*> b
