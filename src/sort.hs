{-
Haskell implementation of sort tool.

http://linux.die.net/man/1/sort
-}

module Main where

import Data.List(sort)

main:: IO ()

main = getContents >>= putStrLn.unlines.sort.lines
