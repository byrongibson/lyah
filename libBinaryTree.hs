-- p.134 

module BinaryTree
( Tree(..)
, singleton
, treeInsert
, treeElem
) where

import Data.Monoid
import qualified Data.Foldable as F

data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show)

-- Make Tree an instance of Functor p.148
instance Functor Tree where
    fmap f EmptyTree = EmptyTree
    fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

-- Make the Tree an instance of Data.Foldable p.263
instance F.Foldable Tree where
    foldMap f EmptyTree = mempty
    foldMap f (Node x l r) = F.foldMap f l `mappend`
                             f x           `mappend`
                             F.foldMap f r

-- a tree with no branches
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- insert x in Tree in correct order
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)  
    | x == a = Node x left right
    | x < a  = Node a (treeInsert x left) right
    | x > a  = Node a left (treeInsert x right)

-- test if x in Tree
treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a  = treeElem x left
    | x > a  = treeElem x right

-- test data
nums = [8,6,4,1,7,3,5]
numsTree = foldr treeInsert EmptyTree nums

