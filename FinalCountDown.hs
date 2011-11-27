--p.308-308 timer

import Control.Monad.Writer
import System.Console.GetOpt
import System( getArgs )
import DiffList

--http://leiffrenzel.de/papers/commandline-options-in-haskell.html
--main = do
--    mapM_ putStrLn . snd . runWriter $ finalCountDown n
--    mapM_ putStrLn . fromDiffList . snd . runWriter $ finalCountDownDiff n

--timer with DiffList
finalCountDownDiff :: Int -> Writer (DiffList String) ()
finalCountDownDiff 0 = do
    tell (toDiffList ["0"])
finalCountDownDiff x = do
    finalCountDownDiff (x-1)
    tell (toDiffList [show x])

--timer without DiffList
finalCountDown :: Int -> Writer [String] ()
finalCountDown 0 = do
    tell ["0"]
finalCountDown x = do
    finalCountDown (x-1)
    tell [show x]

