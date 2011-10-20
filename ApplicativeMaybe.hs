-- p.229


import Control.Applicative

-- already defined in Control.Applicative
{-instance Applicative Maybe where
    pure = Just
    Nothing <*> _ = Nothing
    (Just f) <*> something = fmap f something-}
