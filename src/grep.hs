{-
Haskell implementation of grep tool.
http://linux.die.net/man/1/grep

-- from stdin:
$ ls | ./grep ep.hs

-- with file names
$ grep List grep.hs
grep.hs:import Data.List(isInfixOf)
$

-}

module Main where

import Data.List(isInfixOf)
import System.Environment(getArgs)


-- reads content of the file and adds file name in front of it
getFileContent :: FilePath -> IO String
getFileContent f = do
  contents <- readFile f
  return ((unlines.(fmap ((f++":")++)).lines) contents)

-- read all file contents and return them as one string.
getFileContents :: [FilePath] -> IO String
getFileContents filePaths = do
  cs <- sequence $ getFileContent <$> filePaths
  return (concat cs)

main:: IO ()
main = do
  args <- getArgs
  let kw = case args of
        [] -> []
        (k:_) -> k

  contents <- case args of [] -> getContents
                           [_] -> getContents
                           (_:ps) -> getFileContents ps
  (putStrLn.unlines.(filter $ isInfixOf kw).lines) contents
