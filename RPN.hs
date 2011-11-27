--chp.10, p.204
--added error handling, chp.14, p.332

module RPN
( solveRPN
--,foldingFunction   --export for testing, hide in prod
--,readMaybe         --export for testing, hide in prod
) where

import Control.Monad
import Data.Maybe
import Data.List


solveRPN :: String -> Maybe Double
solveRPN st = do
    [result] <- foldM foldingFunction [] (words st)
    return result


foldingFunction :: [Double] -> String -> Maybe [Double]
foldingFunction (x:y:ys) "*" = return ((y * x):ys)
foldingFunction (x:y:ys) "+" = return ((y + x):ys)
foldingFunction (x:y:ys) "-" = return ((y - x):ys)
foldingFunction (x:y:ys) "/" = return ((y / x):ys)
foldingFunction (x:y:ys) "^" = return ((y ** x):ys)
foldingFunction (x:xs) "ln" = return (log x:xs)
foldingFunction xs "sum" = return ([sum xs])
foldingFunction xs numberString = liftM (:xs) (readMaybe numberString)


readMaybe :: (Read a) => String -> Maybe a
readMaybe st = case reads st of [(x, "")] -> Just x
                                _ -> Nothing



