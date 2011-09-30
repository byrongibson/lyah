-- chp.7 p.116

module Person 
( firstName
, lastName
, age
, height
, phoneNumber
, flavor 
, getFirstName
, getLastName
, getAge
, getHeight
, getPhoneNumber
, getFlavor
) where

-- encapsulate
{-module Person
( getFirstName
, getLastName
, getAge
, getHeight
, getPhoneNumber
, getFlavor
) where-}

data Person = Person { 
  firstName :: String
, lastName :: String
, age :: Int
, height :: Float
, phoneNumber :: String
, flavor :: String 
} deriving (Show,Read,Eq)

getFirstName :: Person -> String
getFirstName (Person firstName _ _ _ _ _) = firstName

getLastName :: Person -> String
getLastName (Person _ lastName _ _ _ _) = lastName

getAge :: Person -> Int
getAge (Person _ _ age _ _ _) = age

getHeight :: Person -> Float
getHeight (Person _ _ _ height _ _) = height


getPhoneNumber :: Person -> String
getPhoneNumber (Person _ _ _ _ phoneNumber _) = phoneNumber

getFlavor :: Person -> String
getFlavor (Person _ _ _ _ _ flavor) = flavor

 
