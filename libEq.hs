-- p.138 Type Classes 102

module Eq'
( (===)
, (/==)
) where

class Eq' a where
    (===) :: a -> a -> Bool
    (/==) :: a -> a -> Bool
    x === y = not (x /== y)
    x /== y = not (x === y)




