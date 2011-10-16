-- test fold syntax
--
--

module MapPrime 
( map'
) where

--map' :: (a -> b) -> [a] -> [b] 
--map' f xs = foldr (\x acc -> f acc : x) [] xs

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

