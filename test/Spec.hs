module Main where

import Test.HUnit
import Shape

tests = TestList [
  TestLabel "Any overlap means there's a collision"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 5 }
               in (rectA !!! rectB) @=? True)

  , TestLabel "A gap below first rectangle means no collision"
  $ TestCase (let rectA = Rectangle { left = 10, right = 30, top = 10, bottom = -10 }
                  rectB = Rectangle { left = 10, right = 30, top = 30, bottom = 15 }
               in (rectA !!! rectB) @=? False)
  ]

main :: IO ()
main = do counts <- runTestTT tests
          return ()
