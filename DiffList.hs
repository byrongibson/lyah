--p.307-308

module DiffList
( DiffList
, toDiffList
, fromDiffList
) where

import Data.Monoid

newtype DiffList a = DiffList { getDiffList :: [a] -> [a] }

toDiffList :: [a] -> DiffList a
toDiffList xs = DiffList (xs++)

fromDiffList :: DiffList a -> [a]
fromDiffList (DiffList f) = f []

instance Monoid (DiffList a) where
    mempty = DiffList (\xs -> [] ++ xs)
    mappend (DiffList f) (DiffList g) = DiffList (\xs -> f (g xs))

