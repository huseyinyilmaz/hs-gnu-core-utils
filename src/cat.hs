{-
Haskell implementation of cat

http://linux.die.net/man/1/cat
-}

module Main where
import System.Environment(getArgs)

printFile :: FilePath -> IO ()
printFile filePath = readFile filePath >>= putStrLn

main:: IO ()
main = getArgs >>= mapM_ printFile
