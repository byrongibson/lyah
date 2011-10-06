-- p.196

--module NumberGuess
--( main ) where

import System.Random
import Control.Monad(when)

main = do
    gen <- newStdGen
    askForNumber gen

askForNumber :: StdGen -> IO ()
askForNumber gen = do
    let (randNumber, newGen) = randomR (1,10) gen :: (Int, StdGen)
    putStrLn "Which number in the range of 1 - 10 am I thinking of? "
    numberString <- getLine
    when (not $ null numberString) $ do
        let [(number,_)] = reads numberString
        if randNumber == number
            then putStrLn "You are CORRECT! Good guess!"
            else putStrLn $ "Sorry, it was " ++ show randNumber
        askForNumber newGen

