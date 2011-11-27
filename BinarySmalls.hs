--p.331
--

binarySmalls :: Int -> Int -> Maybe Int
binarySmalls acc x
    | x > 9 = Nothing
    | otherwise = Just (acc + x)

