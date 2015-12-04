{-
Haskell implementation of yes tool.

http://linux.die.net/man/1/yes
-}
module Main where
import System.Environment(getArgs)

main:: IO ()
main = do as <- getArgs
          --mapM_ putStrLn $ repeat $ if as == [] then "y" else (head as)
          (mapM_ putStrLn).repeat $ if as == [] then "y" else (head as)
