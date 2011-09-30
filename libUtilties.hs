-- Utility Library.  Many of these already exist in Haskell, just reimplementing for practice

module Utilities
( maximum'
, replicate'
, take'
, reverse'
, repeat'
, zip'
, elem'
, quicksort'
, zipwith'
, flip'
, chain'
, numLongChains'
) where

-- Find the highest value in a list
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty list"
maximum' [x] = x
maximum' [x:xs] = max x [maximum' xs]

-- Repeat x, n times
replicate' :: Int -> a -> [a]
replicate' n x
    | n <= 0 = []
    | otherwise = x : replicate' (n-1) x

-- Take the first n items of a list
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
    | n <=0 = []
take' _ []  = []
take' n (x:xs) = x : take' (n-1) xs

-- Reverse a list
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- Repeat indefinitely
-- Use take' to limit the output 
repeat' :: a -> [a]
repeat' x = x:repeat' x

-- Zip two lists into a list of tuples
zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

-- Check whether a value is a member of a list
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
    | a == x = True
    | otherwise = elem' a xs

-- Quicksort
quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) = 
    let smallerOrEqual = [a | a <- xs, a <= x]
        larger = [a | a <- xs, a > x]
    in quicksort' smallerOrEqual ++ [x] ++ quicksort' larger

-- ZipWith: zip two lists using a passed function
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- Flip: take a function that takes two params, return the same function but with the params reversed
flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f y x = f x y

-- Collatz Chain generator (p.70)
chain :: Integer -> [Integer]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n  = n:chain (n*3 + 1)
    
numLongChains :: Integer -> Integer 
numLongChains x = fromIntegral (length (filter isLong (map chain [1..x])))
    where isLong xs = length xs > 15
-- reimplemented using lambda instead of where clause
numLongChainsLambda :: Integer -> Integer
numLongChainsLambda x = fromIntegral (length (filter (\xs -> length xs > 15) (map chain [1..x])))


