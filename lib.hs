-- Utility Library.  Many of these already exist in Haskell, just reimplementing for practice
--  

-- Find the highest value in a list
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty list, no possible maximum"
maximum' [x] = x
maximum' [x:xs] = max x (maximum' xs)

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


