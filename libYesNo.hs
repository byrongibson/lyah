-- p.143

module YesNo
( YesNo(..)
, yesnoIf
) where 

-- import BinaryTree
-- import TrafficLight

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _  = True

-- id is standard library function that takes a param and returns the same thing, in this case either True or False
instance YesNo Bool where
    yesno = id

instance YesNo (Maybe a) where
    yesno (Just _) = True
    yesno Nothing  = False

{- 
instance YesNo Tree a where
    yesno EmptyTree = False
    yesno _         = True
-}

{-
instance YesNo TrafficLight where
    yesno Red   = False
    yesno _     = True
-}

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = 
        if yesno yesnoVal
        then yesResult
        else noResult



