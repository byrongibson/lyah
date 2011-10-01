-- p.175

import System.IO

{-main = do
    handle <- openFile "girlfriend.txt" ReadMode
    contents <- hGetContents handle
    putStr contents
    hClose handle
-}

{-main = do
    withFile "girlfriend.txt" ReadMode (\handle -> do
        contents <- hGetContents handle
        putStr contents)
-}

{-main = do 
    contents <- readFile "girlfriend.txt"
    putStrLn contents
-}

import Data.Char

main = do 
    contents <- readFile "girlfriend.txt"
    writeFile "girlfriendcaps.txt" $ map toUpper contents
    
