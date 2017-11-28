module Main where

import Test.HUnit

tests = TestList [
  TestLabel "five is greater than three"
  $ (5 > 3) ~=? True,

  TestLabel "two is greater than seven"
  $ (2 > 7) ~=? True

  ]

main :: IO ()
main = do counts <- runTestTT tests
          return ()
