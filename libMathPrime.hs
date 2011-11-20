--p.304 gcd

module MathPrime
( gcd'
) where

import Control.Monad.Writer

gcd' :: Int -> Int -> Int 
gcd' a b
    | b == 0    = a
    | otherwise = gcd' b (mod a b)

gcdWriter :: Int -> Int -> Writer [String] Int
gcdWriter a b
    | b == 0 = do
        tell ["Finished with " ++ show a]
        return a
    | otherwise = do
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (mod a b)]
        gcdWriter b (mod a b)

gcdReverseWriter :: Int -> Int -> Writer [String] Int
gcdReverseWriter a b
    | b == 0 = do
        tell ["Finished with " ++ show a]
        return a
    | otherwise = do
        result <- gcdReverseWriter b (mod a b)
        tell [show a ++ " mod " ++ show b ++ " = " ++ show (mod a b)]
        return result
