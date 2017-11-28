module ShapeTest where

import Test.HUnit
import Shape

tests = TestList [
  TestLabel "Any overlap means there's a collision"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 5 }
               in (rectA !!! rectB) @=? True)

  , TestLabel "A gap above first rectangle means no collision"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 15 }
               in (rectA !!! rectB) @=? False)

   , TestLabel "A gap below first rectangle means no collision"
   $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 50, bottom = 35 }
                   rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 15 }
                in (rectA !!! rectB) @=? False)

   , TestLabel "A gap left of the first rectangle means no collision"
   $ TestCase (let rectA = Rectangle { left = 30, right = 50, top = 30, bottom = 15 }
                   rectB = Rectangle { left = 10, right = 25, top = 30, bottom = 15 }
                in (rectA !!! rectB) @=? False)

   , TestLabel "A gap right of the first rectangle means no collision"
   $ TestCase (let rectA = Rectangle { left = 10, right = 25, top = 30, bottom = 15 }
                   rectB = Rectangle { left = 30, right = 50, top = 30, bottom = 15 }
                in (rectA !!! rectB) @=? False)

  ]
