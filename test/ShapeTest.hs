module ShapeTest where

import Test.HUnit
import Shape
import Vector

collisions = TestList [
  TestLabel "Any overlap means there's a collision"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 5 }
               in (rectA !!! rectB) @?= True)

  , TestLabel "A gap above first rectangle means no collision"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 15 }
               in (rectA !!! rectB) @?= False)

   , TestLabel "A gap below first rectangle means no collision"
   $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 50, bottom = 35 }
                   rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 15 }
                in (rectA !!! rectB) @?= False)

   , TestLabel "A gap left of the first rectangle means no collision"
   $ TestCase (let rectA = Rectangle { left = 30, right = 50, top = 30, bottom = 15 }
                   rectB = Rectangle { left = 10, right = 25, top = 30, bottom = 15 }
                in (rectA !!! rectB) @?= False)

   , TestLabel "A gap right of the first rectangle means no collision"
   $ TestCase (let rectA = Rectangle { left = 10, right = 25, top = 30, bottom = 15 }
                   rectB = Rectangle { left = 30, right = 50, top = 30, bottom = 15 }
                in (rectA !!! rectB) @?= False)

  ]

pushout = TestList [
  TestLabel "No overlap means no pushout required"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 15 }
               in (rectA !!> rectB) @?= Nothing)

  , TestLabel "Overlapping the top of the first rectangle pushes the other rectangle up"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 5 }
               in (rectA !!> rectB) @?= Just (move_up 5))

  , TestLabel "Overlapping the bottom of the first rectangle pushes the other rectangle down"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 40, bottom = 20 }
                  rectB = Rectangle { left = 10, right = 30, top = 25, bottom = 5 }
               in (rectA !!> rectB) @?= Just (move_down 5))

  , TestLabel "Overlapping the left of the first rectangle pushes the other rectangle left"
  $ TestCase (let rectA = Rectangle { left = 30, right = 50, top = 40, bottom = 20 }
                  rectB = Rectangle { left = 10, right = 32, top = 40, bottom = 20 }
               in (rectA !!> rectB) @?= Just (move_left 2))

  , TestLabel "Overlapping the right of the first rectangle pushes the other rectangle right"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 40, bottom = 20 }
                  rectB = Rectangle { left = 27, right = 50, top = 40, bottom = 20 }
               in (rectA !!> rectB) @?= Just (move_right 3))

  , TestLabel "Overlapping a corner pushes out whatever the shortest pushout is #1"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 40, bottom = 20 }
                  rectB = Rectangle { left = 27, right = 50, top = 22, bottom = 0 }
               in (rectA !!> rectB) @?= Just (move_down 2))

  , TestLabel "Overlapping a corner pushes out whatever the shortest pushout is #2"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 40, bottom = 20 }
                  rectB = Rectangle { left = 27, right = 50, top = 24, bottom = 0 }
               in (rectA !!> rectB) @?= Just (move_right 3))

  ]

tests = TestList [ TestLabel "Collisions" collisions
                 , TestLabel "Pushout" pushout ]
