-- chp.7 p.116

module Person (
    firstName
    , lastName
    , age
    , height
    , phoneNumber
    , flavor )
    where

data Person = Person { 
    firstName   :: String
    , lastName  :: String
    , age :: Int
    , height :: Float
    , phoneNumber :: String
    , flavor :: String } 
    deriving (Show,Read,Eq)
                    
