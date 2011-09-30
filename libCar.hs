-- p.118

module Car (
  Car(..)
, getCar
) where

data Car a b c = Car {
  company :: a
, model :: b
, year :: c
} deriving (Show)

getCar :: (Show a,Show b,Show c) => Car a b c -> String
getCar (Car {company = c, model = m, year = y}) = 
    "This is my " ++ show y ++ " " ++ show c ++ " " ++ show m ++ "." 


