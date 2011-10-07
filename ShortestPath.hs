-- p.211

module ShortestPath 
( Section
, RoadSystem 
) where

data Section = Section { getA :: Int, getB :: Int, getC :: Int }
    deriving (Show)

type RoadSystem = [Section]

